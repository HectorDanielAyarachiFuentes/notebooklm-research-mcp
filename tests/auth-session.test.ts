import test from "node:test";
import assert from "node:assert/strict";
import fs from "node:fs";
import os from "node:os";
import path from "node:path";
import type { BrowserContext } from "patchright";
import { AuthManager } from "../src/auth/auth-manager.js";
import { CONFIG } from "../src/config.js";
import { NotebookLibrary } from "../src/library/notebook-library.js";
import { BrowserSession } from "../src/session/browser-session.js";
import { SessionManager } from "../src/session/session-manager.js";
import {
  SharedContextManager,
  shouldSyncSavedState,
} from "../src/session/shared-context-manager.js";
import { ToolHandlers } from "../src/tools/handlers.js";

const CRITICAL_COOKIES = [
  "SID",
  "HSID",
  "SSID",
  "APISID",
  "SAPISID",
  "OSID",
  "__Secure-OSID",
  "__Secure-1PSID",
  "__Secure-3PSID",
];

function withTempConfigDirs(fn: (dirs: { dataDir: string; stateDir: string }) => Promise<void> | void) {
  const prevDataDir = CONFIG.dataDir;
  const prevStateDir = CONFIG.browserStateDir;
  const prevNotebookUrl = CONFIG.notebookUrl;
  const rootDir = fs.mkdtempSync(path.join(os.tmpdir(), "nlm-auth-session-test-"));
  const dataDir = path.join(rootDir, "data");
  const stateDir = path.join(rootDir, "browser_state");
  fs.mkdirSync(dataDir, { recursive: true });
  fs.mkdirSync(stateDir, { recursive: true });

  CONFIG.dataDir = dataDir;
  CONFIG.browserStateDir = stateDir;
  CONFIG.notebookUrl = "";

  return Promise.resolve()
    .then(() => fn({ dataDir, stateDir }))
    .finally(() => {
      CONFIG.dataDir = prevDataDir;
      CONFIG.browserStateDir = prevStateDir;
      CONFIG.notebookUrl = prevNotebookUrl;
      fs.rmSync(rootDir, { recursive: true, force: true });
    });
}

test("AuthManager validates state files, cookie freshness, and loads state.json cookies", async () => {
  await withTempConfigDirs(async ({ stateDir }) => {
    const authManager = new AuthManager();

    assert.equal(authManager.getStatePath(), null);
    assert.equal(await authManager.hasSavedState(), false);
    assert.equal(await authManager.isStateExpired(), true);
    assert.equal(await authManager.getValidStatePath(), null);

    const futureSec = Math.floor(Date.now() / 1000) + 3600;
    const pastSec = Math.floor(Date.now() / 1000) - 3600;

    const validCookies = CRITICAL_COOKIES.map((name) => ({
      name,
      value: `val-${name}`,
      domain: ".google.com",
      path: "/",
      expires: futureSec,
    }));

    const statePath = path.join(stateDir, "state.json");
    fs.writeFileSync(statePath, JSON.stringify({ cookies: validCookies }), "utf-8");

    assert.equal(authManager.getStatePath(), statePath);
    assert.equal(await authManager.hasSavedState(), true);
    assert.equal(await authManager.isStateExpired(), false);
    assert.equal(await authManager.getValidStatePath(), statePath);

    const added: Array<Record<string, unknown>> = [];
    const loadedContext = {
      cookies: async () => validCookies,
      addCookies: async (cookies: Array<Record<string, unknown>>) => {
        added.push(...cookies);
      },
    } as unknown as BrowserContext;

    assert.equal(await authManager.loadAuthState(loadedContext, statePath), true);
    assert.equal(added.length, CRITICAL_COOKIES.length);
    assert.equal(await authManager.validateState(loadedContext), true);
    assert.equal(await authManager.validateCookiesExpiry(loadedContext), true);

    const emptyContext = {
      cookies: async () => [],
    } as unknown as BrowserContext;
    assert.equal(await authManager.validateState(emptyContext), false);

    const expiredCookiesContext = {
      cookies: async () =>
        CRITICAL_COOKIES.map((name) => ({
          name,
          value: `expired-${name}`,
          domain: ".google.com",
          path: "/",
          expires: pastSec,
        })),
    } as unknown as BrowserContext;
    assert.equal(await authManager.validateCookiesExpiry(expiredCookiesContext), false);

    const corruptPath = path.join(stateDir, "corrupt.json");
    fs.writeFileSync(corruptPath, "{corrupt", "utf-8");
    assert.equal(await authManager.loadAuthState(loadedContext, corruptPath), false);
  });
});

test("SessionManager rejects missing or invalid notebook URLs and tracks empty session stats", async () => {
  await withTempConfigDirs(async () => {
    const authManager = new AuthManager();
    const sessionManager = new SessionManager(authManager);

    const stats = sessionManager.getStats();
    assert.equal(stats.active_sessions, 0);
    assert.equal(stats.total_messages, 0);
    assert.equal(sessionManager.getSession("missing"), null);
    assert.equal(await sessionManager.closeSession("missing"), false);

    await assert.rejects(
      () => sessionManager.getOrCreateSession("s1", ""),
      /Notebook URL is required/i
    );

    await assert.rejects(
      () => sessionManager.getOrCreateSession("s1", "not-an-http-url"),
      /Notebook URL must be an absolute URL/i
    );

    await sessionManager.closeAllSessions();
  });
});

test("ToolHandlers manages notebook library CRUD and session lookup errors safely", async () => {
  await withTempConfigDirs(async () => {
    const authManager = new AuthManager();
    const sessionManager = new SessionManager(authManager);
    const library = new NotebookLibrary();
    const handlers = new ToolHandlers(sessionManager, authManager, library);

    const addRes = await handlers.handleAddNotebook({
      url: "https://notebooklm.google.com/notebook/test-123",
      name: "Test Notebook",
      description: "Verification notebook",
      topics: ["testing", "architecture"],
    });
    assert.equal(addRes.success, true);
    const addedId = addRes.data?.notebook.id;
    assert.ok(addedId);

    const getRes = await handlers.handleGetNotebook({ id: addedId });
    assert.equal(getRes.success, true);
    assert.equal(getRes.data?.notebook.name, "Test Notebook");

    const selectRes = await handlers.handleSelectNotebook({ id: addedId });
    assert.equal(selectRes.success, true);
    assert.equal(selectRes.data?.notebook.id, addedId);

    const searchRes = await handlers.handleSearchNotebooks({ query: "architecture" });
    assert.equal(searchRes.success, true);
    assert.equal(searchRes.data?.notebooks.length, 1);

    const listSessionsRes = await handlers.handleListSessions();
    assert.equal(listSessionsRes.success, true);
    assert.equal(listSessionsRes.data?.active_sessions, 0);

    const closeMissingRes = await handlers.handleCloseSession({ session_id: "unknown" });
    assert.equal(closeMissingRes.success, false);
    assert.match(closeMissingRes.error ?? "", /Session unknown not found/);

    const removeRes = await handlers.handleRemoveNotebook({ id: addedId });
    assert.equal(removeRes.success, true);
    assert.equal(library.listNotebooks().length, 0);
  });
});

test("shouldSyncSavedState injects state.json on empty profiles and newer imports without clobbering rotated cookies", () => {
  assert.equal(
    shouldSyncSavedState({
      stateMtimeMs: 1_000,
      cookiesDbMtimeMs: 5_000,
      lastLoadedStateMtimeMs: null,
      contextCreatedAtMs: 5_000,
      hasValidContextCookies: false,
      isReuse: false,
    }),
    true
  );

  assert.equal(
    shouldSyncSavedState({
      stateMtimeMs: 10_000,
      cookiesDbMtimeMs: 5_000,
      lastLoadedStateMtimeMs: null,
      contextCreatedAtMs: 11_000,
      hasValidContextCookies: true,
      isReuse: false,
    }),
    true
  );

  assert.equal(
    shouldSyncSavedState({
      stateMtimeMs: 5_000,
      cookiesDbMtimeMs: 10_000,
      lastLoadedStateMtimeMs: null,
      contextCreatedAtMs: 11_000,
      hasValidContextCookies: true,
      isReuse: false,
    }),
    false
  );

  assert.equal(
    shouldSyncSavedState({
      stateMtimeMs: 15_000,
      cookiesDbMtimeMs: null,
      lastLoadedStateMtimeMs: 10_000,
      contextCreatedAtMs: 11_000,
      hasValidContextCookies: true,
      isReuse: true,
    }),
    true
  );

  assert.equal(
    shouldSyncSavedState({
      stateMtimeMs: 10_000,
      cookiesDbMtimeMs: null,
      lastLoadedStateMtimeMs: 10_000,
      contextCreatedAtMs: 11_000,
      hasValidContextCookies: false,
      isReuse: true,
    }),
    false
  );
});

test("BrowserSession.init rescues sign-in redirect via loadAuthState when unsynced, and fast-fails when already synced", async () => {
  const notebookUrl = "https://notebook.google.com/notebook/test-nb";

  async function runScenario(initiallySynced: boolean) {
    let currentUrl = "about:blank";
    let synced = initiallySynced;
    let loadCalls = 0;
    let reloadCalls = 0;
    const gotoCalls: string[] = [];
    let hasValidAuth = false;

    const fakePage = {
      url: () => currentUrl,
      isClosed: () => false,
      close: async () => undefined,
      evaluate: async () => undefined,
      goto: async (url: string) => {
        gotoCalls.push(url);
        currentUrl = hasValidAuth
          ? url
          : "https://accounts.google.com/v3/signin/identifier?continue=" + encodeURIComponent(url);
      },
      reload: async () => {
        reloadCalls += 1;
      },
      waitForSelector: async () => ({}) as unknown,
    };

    const fakeContext = {
      newPage: async () => fakePage,
    } as unknown as BrowserContext;

    const fakeSharedContext = {
      getOrCreateContext: async () => fakeContext,
      hasSyncedStateForCurrentContext: () => synced,
      markStateSynced: () => {
        synced = true;
      },
    } as unknown as SharedContextManager;

    const fakeAuth = {
      getValidStatePath: async () => "C:\\fake\\state.json",
      loadAuthState: async () => {
        loadCalls += 1;
        hasValidAuth = true;
        return true;
      },
      validateCookiesExpiry: async () => hasValidAuth,
      loadSessionStorage: async () => null,
    } as unknown as AuthManager;

    const testConfig = {
      ...CONFIG,
      stealthEnabled: false,
      autoLoginEnabled: false,
    };
    const session = new BrowserSession("test-sess", fakeSharedContext, fakeAuth, notebookUrl, testConfig);
    return {
      init: () => session.init(testConfig),
      counts: () => ({ loadCalls, reloadCalls, gotoCalls, synced }),
    };
  }

  const rescued = await runScenario(false);
  await rescued.init();
  assert.equal(rescued.counts().loadCalls, 1);
  assert.equal(rescued.counts().reloadCalls, 0);
  assert.deepEqual(rescued.counts().gotoCalls, [notebookUrl, notebookUrl]);
  assert.equal(rescued.counts().synced, true);

  const rejected = await runScenario(true);
  await assert.rejects(rejected.init(), /Google session is not active/i);
  assert.equal(rejected.counts().loadCalls, 0);
  assert.equal(rejected.counts().gotoCalls.length, 1);
});
