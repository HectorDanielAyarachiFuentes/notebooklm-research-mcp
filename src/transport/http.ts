/**
 * Streamable-HTTP transport for the MCP server (issue #4).
 *
 * Hosts the MCP protocol over HTTP using the SDK's
 * `StreamableHTTPServerTransport`. Built on Node's stdlib `http` module so we
 * don't pull in Express just to forward requests. Two operations:
 *
 *   POST /mcp        — JSON-RPC requests/responses
 *   GET  /healthz    — liveness probe (200 OK with version)
 *
 * Multiple sessions are supported via the `Mcp-Session-Id` header — each
 * session keeps its own transport so concurrent clients don't tread on each
 * other. Session lifecycle is fully owned by the SDK; we just route.
 */

import { createServer } from "node:http";
import type { IncomingMessage, Server as HttpServer, ServerResponse } from "node:http";
import { randomUUID } from "node:crypto";
import { StreamableHTTPServerTransport } from "@modelcontextprotocol/sdk/server/streamableHttp.js";
import { isInitializeRequest } from "@modelcontextprotocol/sdk/types.js";
import { log } from "../utils/logger.js";

export const DEFAULT_MAX_BODY_BYTES = 10 * 1024 * 1024; // 10 MiB

export interface HttpTransportOptions {
  port: number;
  host?: string;
  /** Maximum accepted request payload size in bytes (default: 10 MiB). */
  maxBodyBytes?: number;
  /** Connect callback invoked once per new session — wires the McpServer to the transport. */
  connect: (transport: StreamableHTTPServerTransport) => Promise<void>;
}

export interface HttpTransportHandle {
  server: HttpServer;
  close: () => Promise<void>;
}

class HttpRequestError extends Error {
  readonly statusCode: number;

  constructor(statusCode: number, message: string) {
    super(message);
    this.name = "HttpRequestError";
    this.statusCode = statusCode;
  }
}

const SESSION_HEADER = "mcp-session-id";

function sendJson(
  res: ServerResponse,
  statusCode: number,
  payload: Record<string, unknown>,
  extraHeaders?: Record<string, string>
): void {
  res.writeHead(statusCode, { "Content-Type": "application/json", ...extraHeaders });
  res.end(JSON.stringify(payload));
}

export async function startHttpTransport(opts: HttpTransportOptions): Promise<HttpTransportHandle> {
  const transports = new Map<string, StreamableHTTPServerTransport>();

  const server = createServer((req, res) => {
    void handleRequest(req, res, transports, opts).catch((err) => {
      if (err instanceof HttpRequestError) {
        if (!res.headersSent) {
          sendJson(
            res,
            err.statusCode,
            { error: err.message },
            err.statusCode === 413 ? { Connection: "close" } : undefined
          );
        }
        return;
      }
      log.error(`❌ [HTTP] Unhandled request error: ${err}`);
      if (!res.headersSent) {
        sendJson(res, 500, { error: "internal server error" });
      }
    });
  });

  await new Promise<void>((resolve, reject) => {
    server.once("error", reject);
    server.listen(opts.port, opts.host ?? "127.0.0.1", () => {
      server.off("error", reject);
      log.success(
        `🌐 HTTP transport listening on http://${opts.host ?? "127.0.0.1"}:${opts.port}/mcp`
      );
      resolve();
    });
  });

  return {
    server,
    close: async () => {
      for (const t of transports.values()) {
        try {
          await t.close();
        } catch {
          /* ignore — best-effort shutdown */
        }
      }
      transports.clear();
      await new Promise<void>((resolve, reject) =>
        server.close((err) => (err ? reject(err) : resolve()))
      );
    },
  };
}

async function handleRequest(
  req: IncomingMessage,
  res: ServerResponse,
  transports: Map<string, StreamableHTTPServerTransport>,
  opts: HttpTransportOptions
): Promise<void> {
  const url = new URL(req.url ?? "/", `http://${req.headers.host ?? "localhost"}`);

  if (url.pathname === "/healthz" && req.method === "GET") {
    sendJson(res, 200, { status: "ok", protocol: "mcp-streamable-http" });
    return;
  }

  if (url.pathname !== "/mcp") {
    sendJson(res, 404, { error: "not found", expected: "/mcp" });
    return;
  }

  const sessionId = headerString(req.headers[SESSION_HEADER]);

  if (req.method === "GET" || req.method === "DELETE") {
    // SSE streams + session termination — both routed by session.
    const transport = sessionId ? transports.get(sessionId) : undefined;
    if (!transport) {
      sendJson(res, 404, { error: "unknown session" });
      return;
    }
    await transport.handleRequest(req, res);
    return;
  }

  if (req.method !== "POST") {
    sendJson(res, 405, { error: "method not allowed" }, { Allow: "POST, GET, DELETE" });
    return;
  }

  const body = await readJsonBody(req, opts.maxBodyBytes ?? DEFAULT_MAX_BODY_BYTES);

  // Re-use existing session, or initialise a new one when the client says so.
  let transport = sessionId ? transports.get(sessionId) : undefined;
  if (!transport && isInitializeRequest(body)) {
    transport = new StreamableHTTPServerTransport({
      sessionIdGenerator: () => randomUUID(),
      onsessioninitialized: (sid) => {
        transports.set(sid, transport!);
      },
    });
    transport.onclose = () => {
      if (transport!.sessionId) transports.delete(transport!.sessionId);
    };
    await opts.connect(transport);
  }

  if (!transport) {
    sendJson(res, 400, {
      error: "no transport for request — pass an `Mcp-Session-Id` header or send `initialize`",
    });
    return;
  }

  await transport.handleRequest(req, res, body);
}

async function readJsonBody(req: IncomingMessage, maxBytes: number): Promise<unknown> {
  const contentLengthHeader = headerString(req.headers["content-length"]);
  if (contentLengthHeader !== undefined) {
    const declaredLength = Number(contentLengthHeader);
    if (Number.isFinite(declaredLength) && declaredLength > maxBytes) {
      req.resume();
      throw new HttpRequestError(413, `request body exceeds maximum of ${maxBytes} bytes`);
    }
  }

  const chunks: Buffer[] = [];
  let totalBytes = 0;
  for await (const chunk of req) {
    const buf = Buffer.isBuffer(chunk) ? chunk : Buffer.from(chunk);
    totalBytes += buf.length;
    if (totalBytes > maxBytes) {
      req.resume();
      throw new HttpRequestError(413, `request body exceeds maximum of ${maxBytes} bytes`);
    }
    chunks.push(buf);
  }

  if (chunks.length === 0) return undefined;
  const raw = Buffer.concat(chunks).toString("utf8");
  if (!raw.trim()) return undefined;
  try {
    return JSON.parse(raw);
  } catch {
    throw new HttpRequestError(400, "invalid JSON request body");
  }
}

function headerString(value: string | string[] | undefined): string | undefined {
  if (Array.isArray(value)) return value[0];
  return value;
}
