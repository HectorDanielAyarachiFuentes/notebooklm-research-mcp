import test from "node:test";
import assert from "node:assert/strict";
import {
  CRITICAL_COOKIE_NAMES,
  dedupeChromeCookies,
  mapSameSiteToPlaywright,
  toCookieHeader,
  toPlaywrightStorageState,
  validateExtractedCookies,
} from "../chrome_extension/cookie-utils.js";
import { parseCookiesInput } from "../scripts/import_cookies.js";
import { isNotebookLmUrl } from "../src/auth/auth-manager.js";

const NOW_SEC = 1_800_000_000;

test("mapSameSiteToPlaywright maps Chrome enums safely to Playwright SameSite", () => {
  assert.equal(mapSameSiteToPlaywright("strict", true), "Strict");
  assert.equal(mapSameSiteToPlaywright("lax", false), "Lax");
  assert.equal(mapSameSiteToPlaywright("unspecified", true), "Lax");
  assert.equal(mapSameSiteToPlaywright("no_restriction", true), "None");
  assert.equal(mapSameSiteToPlaywright("no_restriction", false), "Lax");
});

test("dedupeChromeCookies and toPlaywrightStorageState preserve host scoping and drop expired cookies", () => {
  const raw = [
    {
      name: "__Host-GAPS",
      value: "gaps-val",
      domain: "accounts.google.com",
      path: "/",
      httpOnly: true,
      secure: true,
      sameSite: "lax",
      expirationDate: NOW_SEC + 3600,
    },
    {
      name: "OSID",
      value: "general-osid",
      domain: ".google.com",
      path: "/",
      httpOnly: true,
      secure: true,
      sameSite: "lax",
      session: true,
    },
    {
      name: "OSID",
      value: "notebook-osid",
      domain: "notebook.google.com",
      path: "/",
      httpOnly: true,
      secure: true,
      sameSite: "no_restriction",
      expirationDate: NOW_SEC + 7200,
    },
    {
      name: "EXPIRED_COOKIE",
      value: "old",
      domain: ".google.com",
      path: "/",
      httpOnly: false,
      secure: true,
      sameSite: "lax",
      expirationDate: NOW_SEC - 60,
    },
  ];

  const deduped = dedupeChromeCookies(raw, NOW_SEC);
  assert.equal(deduped.length, 3);

  const state = toPlaywrightStorageState(raw, NOW_SEC);
  assert.deepEqual(state.origins, []);
  assert.equal(state.cookies.length, 3);

  const gaps = state.cookies.find((c) => c.name === "__Host-GAPS");
  assert.equal(gaps?.domain, "accounts.google.com");
  assert.equal(gaps?.httpOnly, true);
  assert.equal(gaps?.secure, true);

  const sessionOsid = state.cookies.find((c) => c.name === "OSID" && c.domain === ".google.com");
  assert.equal(sessionOsid?.expires, -1);

  const nbOsid = state.cookies.find((c) => c.name === "OSID" && c.domain === "notebook.google.com");
  assert.equal(nbOsid?.sameSite, "None");
  assert.equal(nbOsid?.value, "notebook-osid");

  const header = toCookieHeader(raw, NOW_SEC);
  assert.match(header, /OSID=notebook-osid/);
  assert.doesNotMatch(header, /OSID=general-osid/);
});

test("validateExtractedCookies rejects partial Google sessions and checks NotebookLM OSID cookies", () => {
  const singleCookieOnly = validateExtractedCookies(
    [{ name: "SID", value: "x", domain: ".google.com", expirationDate: NOW_SEC + 100 }],
    NOW_SEC
  );
  assert.equal(singleCookieOnly.hasCoreGoogleAuth, false);
  assert.equal(singleCookieOnly.isReadyForNotebookLm, false);
  assert.ok(singleCookieOnly.missingCore.includes("SAPISID"));

  const coreWithoutOsid = validateExtractedCookies(
    ["SID", "HSID", "SSID", "APISID", "SAPISID"].map((name) => ({
      name,
      value: "v",
      domain: ".google.com",
      expirationDate: NOW_SEC + 100,
    })),
    NOW_SEC
  );
  assert.equal(coreWithoutOsid.hasCoreGoogleAuth, true);
  assert.equal(coreWithoutOsid.hasNotebookLmCookies, false);
  assert.equal(coreWithoutOsid.isReadyForNotebookLm, false);

  const fullSession = validateExtractedCookies(
    CRITICAL_COOKIE_NAMES.map((name) => ({
      name,
      value: "v",
      domain: name.includes("OSID") ? "notebook.google.com" : ".google.com",
      expirationDate: NOW_SEC + 100,
    })),
    NOW_SEC
  );
  assert.equal(fullSession.hasCoreGoogleAuth, true);
  assert.equal(fullSession.hasNotebookLmCookies, true);
  assert.equal(fullSession.hasAllCritical, true);
  assert.equal(fullSession.isReadyForNotebookLm, true);
  assert.equal(fullSession.missingCritical.length, 0);
});

test("import_cookies parseCookiesInput handles both lossless state.json and legacy Cookie header", () => {
  const jsonInput = JSON.stringify({
    cookies: [
      {
        name: "__Host-GAPS",
        value: "abc",
        domain: "accounts.google.com",
        path: "/",
        expires: NOW_SEC + 500,
        httpOnly: true,
        secure: true,
        sameSite: "Lax",
      },
    ],
    origins: [],
  });

  const parsedJson = parseCookiesInput(jsonInput, NOW_SEC);
  assert.equal(parsedJson.format, "state_json");
  assert.equal(parsedJson.stateData.cookies[0]?.domain, "accounts.google.com");
  assert.equal(parsedJson.stateData.cookies[0]?.httpOnly, true);

  const parsedHeader = parseCookiesInput("Cookie: SID=123; OSID=456", NOW_SEC);
  assert.equal(parsedHeader.format, "header");
  assert.ok(parsedHeader.stateData.cookies.some((c) => c.domain === "notebook.google.com"));

  assert.throws(() => parseCookiesInput("   ", NOW_SEC), /empty/i);
  assert.throws(() => parseCookiesInput(JSON.stringify({ cookies: [] }), NOW_SEC), /no cookies/i);
});

test("isNotebookLmUrl accepts both notebooklm.google.com and notebook.google.com", () => {
  assert.equal(isNotebookLmUrl("https://notebooklm.google.com/notebook/abc"), true);
  assert.equal(isNotebookLmUrl("https://notebook.google.com/?icid=home_maincta"), true);
  assert.equal(isNotebookLmUrl("https://accounts.google.com/v3/signin"), false);
  assert.equal(isNotebookLmUrl("https://notebook.google.com.evil.com/"), false);
  assert.equal(isNotebookLmUrl("http://notebook.google.com/"), false);
  assert.equal(isNotebookLmUrl("not-a-url"), false);
});

