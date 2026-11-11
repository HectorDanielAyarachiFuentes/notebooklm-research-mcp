export const CORE_GOOGLE_COOKIE_NAMES = ["SID", "HSID", "SSID", "APISID", "SAPISID"];

export const NOTEBOOKLM_COOKIE_NAMES = ["OSID", "__Secure-OSID"];

export const SECURE_SESSION_COOKIE_NAMES = ["__Secure-1PSID", "__Secure-3PSID"];

export const CRITICAL_COOKIE_NAMES = [
  ...CORE_GOOGLE_COOKIE_NAMES,
  ...NOTEBOOKLM_COOKIE_NAMES,
  ...SECURE_SESSION_COOKIE_NAMES,
];

/**
 * Map Chrome `chrome.cookies` sameSite enum values to Playwright's `SameSite` enum.
 * Chromium rejects `SameSite=None` cookies unless `secure` is true.
 */
export function mapSameSiteToPlaywright(sameSite, secure) {
  switch (sameSite) {
    case "strict":
    case "Strict":
      return "Strict";
    case "no_restriction":
    case "None":
      return secure ? "None" : "Lax";
    case "lax":
    case "Lax":
    case "unspecified":
    default:
      return "Lax";
  }
}

/**
 * Return true if a Chrome or Playwright cookie has an explicit expiration in the past.
 */
export function isExpiredCookie(cookie, nowSeconds = Date.now() / 1000) {
  if (!cookie || cookie.session === true) {
    return false;
  }
  const expires =
    typeof cookie.expirationDate === "number"
      ? cookie.expirationDate
      : typeof cookie.expires === "number"
        ? cookie.expires
        : -1;
  if (expires === -1) {
    return false;
  }
  return expires < nowSeconds;
}

/**
 * Filter invalid/expired cookies and deduplicate by `(domain, path, name)`.
 */
export function dedupeChromeCookies(cookies, nowSeconds = Date.now() / 1000) {
  const byScope = new Map();
  for (const cookie of cookies ?? []) {
    if (!cookie || !cookie.name || typeof cookie.value !== "string") {
      continue;
    }
    if (isExpiredCookie(cookie, nowSeconds)) {
      continue;
    }
    const domain = cookie.domain ?? "";
    const cookiePath = cookie.path || "/";
    const scopeKey = `${domain}|${cookiePath}|${cookie.name}`;
    byScope.set(scopeKey, cookie);
  }
  return Array.from(byScope.values());
}

/**
 * Convert a single Chrome cookie into Playwright `storageState` / `addCookies` format.
 */
export function toPlaywrightCookie(cookie) {
  const secure = Boolean(cookie.secure);
  const expires =
    cookie.session || typeof cookie.expirationDate !== "number" ? -1 : cookie.expirationDate;
  return {
    name: cookie.name,
    value: cookie.value,
    domain: cookie.domain,
    path: cookie.path || "/",
    expires,
    httpOnly: Boolean(cookie.httpOnly),
    secure,
    sameSite: mapSameSiteToPlaywright(cookie.sameSite, secure),
  };
}

/**
 * Build a full Playwright `storageState` object preserving domain, path, and security flags.
 */
export function toPlaywrightStorageState(cookies, nowSeconds = Date.now() / 1000) {
  const deduped = dedupeChromeCookies(cookies, nowSeconds);
  return {
    cookies: deduped.map(toPlaywrightCookie),
    origins: [],
  };
}

/**
 * Build a legacy flat `Cookie:` header string, preferring NotebookLM host cookies over `.google.com`.
 */
export function toCookieHeader(cookies, nowSeconds = Date.now() / 1000) {
  const deduped = dedupeChromeCookies(cookies, nowSeconds);
  const byName = new Map();
  const isNotebookDomain = (domain = "") =>
    domain.includes("notebooklm.google.com") || domain.includes("notebook.google.com");

  const sorted = [...deduped].sort((a, b) => {
    const aNb = isNotebookDomain(a.domain) ? 1 : 0;
    const bNb = isNotebookDomain(b.domain) ? 1 : 0;
    return aNb - bNb;
  });

  for (const cookie of sorted) {
    byName.set(cookie.name, cookie.value);
  }

  return Array.from(byName.entries(), ([name, value]) => `${name}=${value}`).join("; ");
}

/**
 * Evaluate whether extracted cookies contain a complete, non-expired NotebookLM Google session.
 */
export function validateExtractedCookies(cookies, nowSeconds = Date.now() / 1000) {
  const deduped = dedupeChromeCookies(cookies, nowSeconds);
  const presentNames = new Set(deduped.map((c) => c.name));

  const missingCore = CORE_GOOGLE_COOKIE_NAMES.filter((name) => !presentNames.has(name));
  const hasCoreGoogleAuth = missingCore.length === 0;
  const hasNotebookLmCookies = NOTEBOOKLM_COOKIE_NAMES.some((name) => presentNames.has(name));
  const presentCritical = CRITICAL_COOKIE_NAMES.filter((name) => presentNames.has(name));
  const missingCritical = CRITICAL_COOKIE_NAMES.filter((name) => !presentNames.has(name));

  return {
    totalCookies: deduped.length,
    uniqueNames: presentNames.size,
    hasCoreGoogleAuth,
    hasNotebookLmCookies,
    hasAllCritical: missingCritical.length === 0,
    isReadyForNotebookLm: hasCoreGoogleAuth && hasNotebookLmCookies,
    missingCore,
    presentCritical,
    missingCritical,
  };
}

