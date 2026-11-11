import test from "node:test";
import assert from "node:assert/strict";
import { AuthManager } from "../src/auth/auth-manager.js";
import {
  CONFIG,
  applyBrowserOptions,
  resolveOverrideHeadless,
  type Config,
} from "../src/config.js";
import type { NotebookLibrary } from "../src/library/notebook-library.js";
import type { SessionManager } from "../src/session/session-manager.js";
import { SharedContextManager } from "../src/session/shared-context-manager.js";
import { ToolHandlers } from "../src/tools/handlers.js";

test("resolveOverrideHeadless prioritizes headless > show > legacyShowBrowser", () => {
  assert.equal(resolveOverrideHeadless(undefined, undefined), undefined);
  assert.equal(resolveOverrideHeadless(undefined, true), true);
  assert.equal(resolveOverrideHeadless(undefined, false), false);
  assert.equal(resolveOverrideHeadless({ show: true }, false), true);
  assert.equal(resolveOverrideHeadless({ headless: true, show: true }, true), false);
  assert.equal(resolveOverrideHeadless({ headless: false }, false), true);
});

test("applyBrowserOptions returns an isolated Config with cloned viewport without mutating global CONFIG", () => {
  const baseline = {
    headless: CONFIG.headless,
    typingWpmMin: CONFIG.typingWpmMin,
    typingWpmMax: CONFIG.typingWpmMax,
    stealthEnabled: CONFIG.stealthEnabled,
    viewportWidth: CONFIG.viewport.width,
    viewportHeight: CONFIG.viewport.height,
  };

  const effective = applyBrowserOptions(
    {
      show: true,
      stealth: { enabled: false, typing_wpm_min: 310, typing_wpm_max: 420 },
      viewport: { width: 1440, height: 900 },
    },
    false
  );

  assert.notEqual(effective, CONFIG);
  assert.notEqual(effective.viewport, CONFIG.viewport);
  assert.equal(effective.headless, false);
  assert.equal(effective.typingWpmMin, 310);
  assert.equal(effective.typingWpmMax, 420);
  assert.equal(effective.stealthEnabled, false);
  assert.deepEqual(effective.viewport, { width: 1440, height: 900 });

  effective.viewport.width = 777;
  assert.equal(CONFIG.headless, baseline.headless);
  assert.equal(CONFIG.typingWpmMin, baseline.typingWpmMin);
  assert.equal(CONFIG.typingWpmMax, baseline.typingWpmMax);
  assert.equal(CONFIG.stealthEnabled, baseline.stealthEnabled);
  assert.equal(CONFIG.viewport.width, baseline.viewportWidth);
  assert.equal(CONFIG.viewport.height, baseline.viewportHeight);
});

test("SharedContextManager.needsHeadlessModeChange handles uninitialized context with per-call config", () => {
  const manager = new SharedContextManager(new AuthManager());
  const customConfig: Config = { ...CONFIG, headless: !CONFIG.headless };

  assert.equal(manager.getCurrentHeadlessMode(), null);
  assert.equal(manager.needsHeadlessModeChange(undefined, customConfig), false);
  assert.equal(manager.needsHeadlessModeChange(true, customConfig), false);
});

test("Concurrent ToolHandlers calls pass isolated effectiveConfig and never mutate global CONFIG", async () => {
  const baselineHeadless = CONFIG.headless;
  const baselineWpmMin = CONFIG.typingWpmMin;
  const baselineViewportWidth = CONFIG.viewport.width;

  const sessionCalls: Array<{
    sessionId?: string;
    overrideHeadless?: boolean;
    effectiveConfig?: Config;
  }> = [];
  const authCalls: Array<{
    overrideHeadless?: boolean;
    effectiveConfig?: Config;
  }> = [];
  let clearedAuth = false;
  let closedAll = false;

  const fakeSessionManager = {
    getOrCreateSession: async (
      sessionId?: string,
      _notebookUrl?: string,
      overrideHeadless?: boolean,
      effectiveConfig?: Config
    ) => {
      await new Promise((resolve) => setTimeout(resolve, sessionId === "slow" ? 25 : 5));
      sessionCalls.push({ sessionId, overrideHeadless, effectiveConfig });
      return {
        sessionId: sessionId ?? "auto",
        notebookUrl: "https://notebooklm.google.com/notebook/abc",
        history: [],
        ask: async (question: string) => `Ans: ${question}`,
        extractCitations: async (rawAnswer: string) => ({
          formattedAnswer: rawAnswer,
          citations: [],
        }),
        listSources: async () => ["source-a"],
        getInfo: () => ({
          id: sessionId ?? "auto",
          created_at: 1,
          last_activity: 1,
          age_seconds: 1,
          inactive_seconds: 0,
          message_count: 1,
          notebook_url: "https://notebooklm.google.com/notebook/abc",
        }),
      };
    },
    closeAllSessions: async () => {
      closedAll = true;
    },
  } as unknown as SessionManager;

  const fakeAuthManager = {
    performSetup: async (
      _sendProgress?: unknown,
      overrideHeadless?: boolean,
      effectiveConfig?: Config
    ) => {
      await new Promise((resolve) => setTimeout(resolve, 10));
      authCalls.push({ overrideHeadless, effectiveConfig });
      return true;
    },
    clearAllAuthData: async () => {
      clearedAuth = true;
    },
  } as unknown as AuthManager;

  const fakeLibrary = {
    getActiveNotebook: () => null,
    getNotebook: () => null,
    incrementUseCount: () => null,
  } as unknown as NotebookLibrary;

  const handlers = new ToolHandlers(fakeSessionManager, fakeAuthManager, fakeLibrary);

  const [askSlow, askFast, sourcesRes, setupRes, reauthRes] = await Promise.all([
    handlers.handleAskQuestion({
      question: "Slow question",
      session_id: "slow",
      notebook_url: "https://notebooklm.google.com/notebook/abc",
      show_browser: true,
      browser_options: {
        stealth: { typing_wpm_min: 111 },
        viewport: { width: 1024, height: 768 },
      },
    }),
    handlers.handleAskQuestion({
      question: "Fast question",
      session_id: "fast",
      notebook_url: "https://notebooklm.google.com/notebook/abc",
      show_browser: false,
      browser_options: { headless: true, stealth: { typing_wpm_min: 333 } },
    }),
    handlers.handleListSources({
      session_id: "sources",
      notebook_url: "https://notebooklm.google.com/notebook/abc",
      browser_options: { show: true },
    }),
    handlers.handleSetupAuth({
      show_browser: true,
      browser_options: { stealth: { typing_wpm_min: 222 } },
    }),
    handlers.handleReAuth({
      show_browser: false,
      browser_options: { headless: false, stealth: { typing_wpm_min: 444 } },
    }),
  ]);

  assert.equal(askSlow.success, true);
  assert.equal(askFast.success, true);
  assert.equal(sourcesRes.success, true);
  assert.equal(setupRes.success, true);
  assert.equal(reauthRes.success, true);
  assert.equal(closedAll, true);
  assert.equal(clearedAuth, true);

  const slowCall = sessionCalls.find((c) => c.sessionId === "slow");
  const fastCall = sessionCalls.find((c) => c.sessionId === "fast");
  const srcCall = sessionCalls.find((c) => c.sessionId === "sources");

  assert.equal(slowCall?.overrideHeadless, true);
  assert.equal(slowCall?.effectiveConfig?.headless, false);
  assert.equal(slowCall?.effectiveConfig?.typingWpmMin, 111);
  assert.deepEqual(slowCall?.effectiveConfig?.viewport, { width: 1024, height: 768 });

  assert.equal(fastCall?.overrideHeadless, false);
  assert.equal(fastCall?.effectiveConfig?.headless, true);
  assert.equal(fastCall?.effectiveConfig?.typingWpmMin, 333);

  assert.equal(srcCall?.overrideHeadless, true);
  assert.equal(srcCall?.effectiveConfig?.headless, false);

  assert.equal(authCalls.length, 2);
  assert.ok(
    authCalls.some((c) => c.overrideHeadless === true && c.effectiveConfig?.typingWpmMin === 222)
  );
  assert.ok(
    authCalls.some((c) => c.overrideHeadless === true && c.effectiveConfig?.typingWpmMin === 444)
  );

  assert.equal(CONFIG.headless, baselineHeadless);
  assert.equal(CONFIG.typingWpmMin, baselineWpmMin);
  assert.equal(CONFIG.viewport.width, baselineViewportWidth);
});
