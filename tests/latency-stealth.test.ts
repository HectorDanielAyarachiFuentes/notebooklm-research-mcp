import test from "node:test";
import assert from "node:assert/strict";
import type { Page } from "patchright";
import { CONFIG, applyBrowserOptions, resolveBrowserLocaleOptions } from "../src/config.js";
import { NotebookLibrary } from "../src/library/notebook-library.js";
import { waitForStableAnswer } from "../src/notebooklm/chat.js";
import { Selectors } from "../src/notebooklm/selectors.js";
import type { AuthManager } from "../src/auth/auth-manager.js";
import type { SessionManager } from "../src/session/session-manager.js";
import { ToolHandlers } from "../src/tools/handlers.js";
import { humanType, randomDelay, type StealthConfig } from "../src/utils/stealth-utils.js";

function makeStealthConfig(overrides: Partial<StealthConfig> = {}): StealthConfig {
  return {
    stealthEnabled: CONFIG.stealthEnabled,
    stealthRandomDelays: CONFIG.stealthRandomDelays,
    stealthHumanTyping: CONFIG.stealthHumanTyping,
    stealthMouseMovements: CONFIG.stealthMouseMovements,
    typingWpmMin: CONFIG.typingWpmMin,
    typingWpmMax: CONFIG.typingWpmMax,
    minDelayMs: CONFIG.minDelayMs,
    maxDelayMs: CONFIG.maxDelayMs,
    viewport: { ...CONFIG.viewport },
    ...overrides,
  };
}

test("randomDelay returns immediately when stealth or random delays are disabled", async () => {
  const startNoStealth = Date.now();
  await randomDelay(2000, 3000, makeStealthConfig({ stealthEnabled: false }));
  await randomDelay(2000, 3000, makeStealthConfig({ stealthRandomDelays: false }));
  const elapsed = Date.now() - startNoStealth;

  assert.ok(elapsed < 100, `Expected immediate return without sleep, got ${elapsed}ms`);
});

test("humanType preserves full Unicode text using fast fill or bounded bursts", async () => {
  const fillsFast: string[] = [];
  const fakePageFast = {
    fill: async (_sel: string, value: string) => {
      fillsFast.push(value);
    },
    click: async () => {},
  } as unknown as Page;

  const sampleLong =
    "Analizá cómo impacta la Liquidación II en las organizaciones públicas 🚀 y comparalo con el módulo anterior paso a paso.";

  await humanType(fakePageFast, "textarea", sampleLong, {
    config: makeStealthConfig({ stealthHumanTyping: false }),
  });
  assert.deepEqual(fillsFast, [sampleLong]);

  const fillsBurst: string[] = [];
  const fakePageBurst = {
    fill: async (_sel: string, value: string) => {
      fillsBurst.push(value);
    },
    click: async () => {},
  } as unknown as Page;

  await humanType(fakePageBurst, "textarea", sampleLong, {
    wpm: 5000,
    withTypos: false,
    config: makeStealthConfig({ stealthRandomDelays: false, stealthHumanTyping: true }),
  });

  assert.equal(fillsBurst[fillsBurst.length - 1], sampleLong);
  // Expect opening clear + < length fills thanks to burst chunking after prefix.
  assert.ok(
    fillsBurst.length < sampleLong.length * 0.7,
    `Expected burst chunking to slash fill calls, got ${fillsBurst.length} for ${sampleLong.length} chars`
  );
});

test("resolveBrowserLocaleOptions honors env overrides and strips BCP-47 -u extensions", () => {
  const prevLocale = process.env.BROWSER_LOCALE;
  const prevTz = process.env.BROWSER_TIMEZONE;

  try {
    process.env.BROWSER_LOCALE = "es-AR-u-hc-h23";
    process.env.BROWSER_TIMEZONE = "America/Argentina/Buenos_Aires";
    assert.deepEqual(resolveBrowserLocaleOptions(), {
      locale: "es-AR",
      timezoneId: "America/Argentina/Buenos_Aires",
    });

    delete process.env.BROWSER_LOCALE;
    delete process.env.BROWSER_TIMEZONE;
    const osDefaults = resolveBrowserLocaleOptions();
    assert.ok(osDefaults.locale.length >= 2 && !osDefaults.locale.includes("-u-"));
    assert.ok(osDefaults.timezoneId.length >= 3);
  } finally {
    if (prevLocale === undefined) delete process.env.BROWSER_LOCALE;
    else process.env.BROWSER_LOCALE = prevLocale;

    if (prevTz === undefined) delete process.env.BROWSER_TIMEZONE;
    else process.env.BROWSER_TIMEZONE = prevTz;
  }
});

test("applyBrowserOptions exposes faster default stealth speeds without mutating CONFIG", () => {
  assert.ok(CONFIG.typingWpmMin >= 260);
  assert.ok(CONFIG.typingWpmMax >= 420);
  const custom = applyBrowserOptions({ stealth: { human_typing: false, random_delays: false } });
  assert.equal(custom.stealthHumanTyping, false);
  assert.equal(custom.stealthRandomDelays, false);
  assert.equal(CONFIG.stealthHumanTyping, true);
});

test("waitForStableAnswer falls back to answerText when :last-child has trailing UI nodes and fails fast on sign-in redirect", async () => {
  const answerText = "Respuesta completa del cuaderno sobre planeamiento público.";
  const fakeFallbackPage = {
    url: () => "https://notebook.google.com/notebook/abc",
    evaluate: async () => 1,
    locator: (sel: string) => ({
      count: async () => (sel === Selectors.chat.latestAnswerText ? 0 : 1),
      last: () => ({
        innerText: async () => answerText,
      }),
    }),
  } as unknown as Page;

  const ans = await waitForStableAnswer(fakeFallbackPage, {
    question: "Resume el cuaderno",
    pollIntervalMs: 10,
    stablePolls: 2,
    timeoutMs: 1000,
  });
  assert.equal(ans, answerText);

  const redirectedPage = {
    url: () => "https://accounts.google.com/v3/signin/identifier",
    evaluate: async () => 1,
    locator: () => ({
      count: async () => 0,
      last: () => ({ innerText: async () => "" }),
    }),
  } as unknown as Page;

  await assert.rejects(
    waitForStableAnswer(redirectedPage, {
      question: "Test",
      pollIntervalMs: 10,
      timeoutMs: 1000,
    }),
    /Google session is not active/i
  );
});

test("handleAskQuestion reuses notebookUrl from an existing session_id even when library is empty", async () => {
  const sessionUrl = "https://notebook.google.com/notebook/existing-session-url";
  const seenUrls: Array<string | undefined> = [];

  const fakeSessionManager = {
    getSession: (id: string) =>
      id === "sess-1"
        ? { sessionId: "sess-1", notebookUrl: sessionUrl }
        : null,
    getOrCreateSession: async (sessionId?: string, notebookUrl?: string) => {
      seenUrls.push(notebookUrl);
      return {
        sessionId: sessionId ?? "sess-1",
        notebookUrl: notebookUrl ?? "",
        history: [],
        ask: async () => "ok",
        extractCitations: async (raw: string) => ({ citations: [], formattedAnswer: raw }),
        getInfo: () => ({ age_seconds: 1, message_count: 1, last_activity: Date.now() }),
      };
    },
  } as unknown as SessionManager;

  const fakeEmptyLibrary = {
    getActiveNotebook: () => null,
    incrementUseCount: () => null,
  } as unknown as NotebookLibrary;

  const handlers = new ToolHandlers(
    fakeSessionManager,
    {} as AuthManager,
    fakeEmptyLibrary
  );
  const res = await handlers.handleAskQuestion({
    question: "Seguimiento",
    session_id: "sess-1",
  });

  assert.equal(res.success, true);
  assert.deepEqual(seenUrls, [sessionUrl]);
});


