import test from "node:test";
import assert from "node:assert/strict";
import http from "node:http";
import type { AddressInfo } from "node:net";
import { startHttpTransport } from "../src/transport/http.js";

function getPort(address: string | AddressInfo | null): number {
  assert.ok(address && typeof address === "object");
  return address.port;
}

function sendRawHttpRequest(opts: {
  port: number;
  method: string;
  path: string;
  headers?: Record<string, string>;
  bodyChunks?: string[];
}): Promise<{ status: number; headers: http.IncomingHttpHeaders; json: Record<string, unknown> }> {
  return new Promise((resolve, reject) => {
    const req = http.request(
      {
        host: "127.0.0.1",
        port: opts.port,
        method: opts.method,
        path: opts.path,
        headers: opts.headers,
      },
      (res) => {
        const chunks: Buffer[] = [];
        res.on("data", (chunk: Buffer) => chunks.push(chunk));
        res.on("end", () => {
          const text = Buffer.concat(chunks).toString("utf8");
          resolve({
            status: res.statusCode ?? 0,
            headers: res.headers,
            json: text ? (JSON.parse(text) as Record<string, unknown>) : {},
          });
        });
      }
    );

    req.on("error", reject);
    for (const chunk of opts.bodyChunks ?? []) {
      req.write(chunk);
    }
    req.end();
  });
}

test("startHttpTransport serves /healthz and routes HTTP error status codes cleanly", async () => {
  const handle = await startHttpTransport({
    port: 0,
    host: "127.0.0.1",
    connect: async () => undefined,
  });

  try {
    const port = getPort(handle.server.address());
    const base = `http://127.0.0.1:${port}`;

    const healthRes = await fetch(`${base}/healthz`);
    assert.equal(healthRes.status, 200);
    assert.deepEqual(await healthRes.json(), { status: "ok", protocol: "mcp-streamable-http" });

    const notFoundRes = await fetch(`${base}/unknown`);
    assert.equal(notFoundRes.status, 404);
    assert.deepEqual(await notFoundRes.json(), { error: "not found", expected: "/mcp" });

    const methodRes = await fetch(`${base}/mcp`, { method: "PUT" });
    assert.equal(methodRes.status, 405);
    assert.equal(methodRes.headers.get("allow"), "POST, GET, DELETE");
    assert.deepEqual(await methodRes.json(), { error: "method not allowed" });

    const getRes = await fetch(`${base}/mcp`, { method: "GET" });
    assert.equal(getRes.status, 404);
    assert.deepEqual(await getRes.json(), { error: "unknown session" });

    const delRes = await fetch(`${base}/mcp`, {
      method: "DELETE",
      headers: { "Mcp-Session-Id": "missing-session" },
    });
    assert.equal(delRes.status, 404);
    assert.deepEqual(await delRes.json(), { error: "unknown session" });

    const noInitRes = await fetch(`${base}/mcp`, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ jsonrpc: "2.0", id: 1, method: "tools/list" }),
    });
    assert.equal(noInitRes.status, 400);
    const noInitJson = (await noInitRes.json()) as { error?: string };
    assert.match(noInitJson.error ?? "", /no transport for request/);
  } finally {
    await handle.close();
  }
});

test("startHttpTransport returns 400 on malformed JSON instead of 500", async () => {
  const handle = await startHttpTransport({
    port: 0,
    host: "127.0.0.1",
    connect: async () => undefined,
  });

  try {
    const port = getPort(handle.server.address());
    const res = await fetch(`http://127.0.0.1:${port}/mcp`, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: "{not valid json",
    });

    assert.equal(res.status, 400);
    assert.deepEqual(await res.json(), { error: "invalid JSON request body" });
  } finally {
    await handle.close();
  }
});

test("startHttpTransport returns 413 when Content-Length or streamed body exceeds maxBodyBytes", async () => {
  const handle = await startHttpTransport({
    port: 0,
    host: "127.0.0.1",
    maxBodyBytes: 64,
    connect: async () => undefined,
  });

  try {
    const port = getPort(handle.server.address());

    const declaredPayload = JSON.stringify({ payload: "x".repeat(110) });
    const declaredTooLarge = await sendRawHttpRequest({
      port,
      method: "POST",
      path: "/mcp",
      headers: {
        "Content-Type": "application/json",
        "Content-Length": String(Buffer.byteLength(declaredPayload)),
      },
      bodyChunks: [declaredPayload],
    });
    assert.equal(declaredTooLarge.status, 413);
    assert.match(String(declaredTooLarge.json.error ?? ""), /exceeds maximum of 64 bytes/);

    const streamedTooLarge = await sendRawHttpRequest({
      port,
      method: "POST",
      path: "/mcp",
      headers: {
        "Content-Type": "application/json",
      },
      bodyChunks: ['{"a":"', "b".repeat(40), '","c":"', "d".repeat(40), '"}'],
    });
    assert.equal(
      streamedTooLarge.status,
      413,
      `Expected 413 for chunked body, got ${streamedTooLarge.status}: ${JSON.stringify(streamedTooLarge.json)}`
    );
    assert.match(String(streamedTooLarge.json.error ?? ""), /exceeds maximum of 64 bytes/);
  } finally {
    await handle.close();
  }
});
