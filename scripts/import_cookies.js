import { execFileSync } from "node:child_process";
import fs from "node:fs";
import path from "node:path";
import { pathToFileURL } from "node:url";
import { AuthManager } from "../dist/auth/auth-manager.js";
import { CONFIG, ensureDirectories } from "../dist/config.js";

function mapSameSiteGuess(name) {
  return name.startsWith("__Secure-3P") ? "None" : "Lax";
}

function isValidPlaywrightCookie(c) {
  return (
    Boolean(c) &&
    typeof c.name === "string" &&
    c.name.length > 0 &&
    typeof c.value === "string" &&
    typeof c.domain === "string" &&
    c.domain.length > 0
  );
}

/**
 * Parse raw clipboard or file input as either Playwright `state.json` or a flat `Cookie:` header string.
 */
export function parseCookiesInput(rawInput, nowSeconds = Math.floor(Date.now() / 1000)) {
  const trimmed = rawInput.trim();
  if (!trimmed) {
    throw new Error("Input is empty");
  }

  if (trimmed.startsWith("{") || trimmed.startsWith("[")) {
    const parsed = JSON.parse(trimmed);
    const rawCookies = Array.isArray(parsed) ? parsed : parsed?.cookies;
    if (!Array.isArray(rawCookies) || rawCookies.length === 0) {
      throw new Error("JSON input contains no cookies array");
    }

    const cookies = rawCookies.filter(isValidPlaywrightCookie).map((c) => ({
      name: c.name,
      value: c.value,
      domain: c.domain,
      path: c.path || "/",
      expires: typeof c.expires === "number" ? c.expires : -1,
      httpOnly: Boolean(c.httpOnly),
      secure: Boolean(c.secure),
      sameSite: c.sameSite === "Strict" || c.sameSite === "Lax" || c.sameSite === "None" ? c.sameSite : "Lax",
    }));

    return {
      format: "state_json",
      stateData: { cookies, origins: Array.isArray(parsed?.origins) ? parsed.origins : [] },
    };
  }

  const cleaned = trimmed
    .replace(/^cookie:\s*/i, "")
    .replace(/[\r\n]+/g, ";");
  const cookiePairs = cleaned
    .split(";")
    .map((s) => s.trim())
    .filter(Boolean);

  const cookies = [];
  const expires = nowSeconds + 365 * 24 * 60 * 60;

  for (const pair of cookiePairs) {
    const eqIdx = pair.indexOf("=");
    if (eqIdx === -1) continue;
    const name = pair.slice(0, eqIdx).trim();
    const value = pair.slice(eqIdx + 1).trim();
    if (!name) continue;

    let domain = ".google.com";
    if (name.startsWith("__Host-")) {
      domain = "google.com";
    }

    cookies.push({
      name,
      value,
      domain,
      path: "/",
      expires,
      httpOnly: name.includes("SID") || name.includes("APISID") || name.includes("OSID"),
      secure:
        name.startsWith("__Secure-") ||
        name.startsWith("__Host-") ||
        ["SID", "HSID", "SSID", "APISID", "SAPISID"].includes(name),
      sameSite: mapSameSiteGuess(name),
    });

    if (name === "OSID" || name === "__Secure-OSID") {
      for (const host of ["notebooklm.google.com", "notebook.google.com"]) {
        cookies.push({
          name,
          value,
          domain: host,
          path: "/",
          expires,
          httpOnly: true,
          secure: true,
          sameSite: "Lax",
        });
      }
    }
  }

  if (cookies.length === 0) {
    throw new Error("No valid key=value cookie pairs found");
  }

  return {
    format: "header",
    stateData: { cookies, origins: [] },
  };
}

function readClipboardText() {
  if (process.platform === "win32") {
    return execFileSync("powershell", ["-NoProfile", "-Command", "Get-Clipboard -Raw"], {
      encoding: "utf8",
    });
  }
  if (process.platform === "darwin") {
    return execFileSync("pbpaste", [], { encoding: "utf8" });
  }
  return execFileSync("xclip", ["-o", "-selection", "clipboard"], { encoding: "utf8" });
}

function resolveRawInput(args) {
  if (args.includes("--stdin")) {
    return { source: "stdin", raw: fs.readFileSync(0, "utf8") };
  }

  if (args.includes("--clipboard")) {
    return { source: "clipboard", raw: readClipboardText() };
  }

  const fileArg = args.find((a) => !a.startsWith("-"));
  if (fileArg) {
    const targetPath = path.resolve(fileArg);
    if (!fs.existsSync(targetPath)) {
      throw new Error(`Input file not found: ${targetPath}`);
    }
    return { source: targetPath, raw: fs.readFileSync(targetPath, "utf8") };
  }

  for (const defaultFile of ["state.json", "cookies.txt"]) {
    const candidate = path.resolve(defaultFile);
    if (fs.existsSync(candidate)) {
      return { source: candidate, raw: fs.readFileSync(candidate, "utf8") };
    }
  }

  throw new Error("No input found. Pass --clipboard, a file path, state.json, or cookies.txt.");
}

async function main() {
  ensureDirectories();
  const { source, raw } = resolveRawInput(process.argv.slice(2));
  const { format, stateData } = parseCookiesInput(raw);

  if (format === "header") {
    console.warn(
      "⚠️  Imported legacy Cookie header string (domains/flags had to be guessed). Prefer state.json from NotebookLM Sync v2.0 if Google returns CookieMismatch."
    );
  }

  const stateDir = CONFIG.browserStateDir;
  if (!fs.existsSync(stateDir)) {
    fs.mkdirSync(stateDir, { recursive: true });
  }

  const stateFilePath = path.join(stateDir, "state.json");
  fs.writeFileSync(stateFilePath, JSON.stringify(stateData, null, 2), "utf8");
  console.log(
    `Successfully written ${stateData.cookies.length} cookies (${format}) from ${source} to ${stateFilePath}`
  );

  const authManager = new AuthManager();
  const validPath = await authManager.getValidStatePath();
  console.log("Valid state path returned by AuthManager:", validPath);
  if (validPath) {
    console.log("✅ Authentication state is VALID and ready for Node/TypeScript MCP!");
  } else {
    console.log("⚠️ State path could not be validated.");
  }
}

if (process.argv[1] && pathToFileURL(path.resolve(process.argv[1])).href === import.meta.url) {
  main().catch((err) => {
    console.error(`❌ ${err instanceof Error ? err.message : String(err)}`);
    process.exit(1);
  });
}
