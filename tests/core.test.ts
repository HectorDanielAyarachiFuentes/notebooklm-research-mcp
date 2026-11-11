import test from "node:test";
import assert from "node:assert/strict";
import fs from "node:fs";
import os from "node:os";
import path from "node:path";

import { CONFIG } from "../src/config.js";
import { formatAnswer } from "../src/notebooklm/citations.js";
import {
  ToolHandlers,
  formatCitationsReport,
  formatResearchDossier,
} from "../src/tools/handlers.js";
import { extractLocalFile } from "../src/utils/file-extractor.js";
import type { SessionManager } from "../src/session/session-manager.js";
import type { AuthManager } from "../src/auth/auth-manager.js";
import type { NotebookLibrary } from "../src/library/notebook-library.js";

test("extractLocalFile reads text files and rejects missing/empty/directory paths", async () => {
  const tmpDir = fs.mkdtempSync(path.join(os.tmpdir(), "nlm-mcp-test-"));
  try {
    const notePath = path.join(tmpDir, "notes.md");
    fs.writeFileSync(notePath, "# Research Note\nKey finding.", "utf-8");

    const extracted = await extractLocalFile(notePath, "Custom Title");
    assert.equal(extracted.title, "Custom Title");
    assert.equal(extracted.extension, ".md");
    assert.match(extracted.text, /Key finding\./);

    const emptyPath = path.join(tmpDir, "empty.txt");
    fs.writeFileSync(emptyPath, "   \n  ", "utf-8");
    await assert.rejects(() => extractLocalFile(emptyPath), /empty/i);

    await assert.rejects(() => extractLocalFile(tmpDir), /directory/i);
    await assert.rejects(
      () => extractLocalFile(path.join(tmpDir, "missing.txt")),
      /File not found/i
    );
  } finally {
    fs.rmSync(tmpDir, { recursive: true, force: true });
  }
});

test("formatAnswer renders inline, footnotes, json, and none citation modes", () => {
  const citations = [
    {
      marker: "[1]",
      number: 1,
      sourceName: "Paper A",
      sourceText: "Observed 42% gain.",
    },
  ];
  const answer = "Results improved [1].";

  assert.equal(formatAnswer(answer, citations, "none"), answer);
  assert.equal(formatAnswer(answer, citations, "json"), answer);
  assert.match(
    formatAnswer(answer, citations, "inline"),
    /\[1\] \(Paper A: "Observed 42% gain\."\)/
  );
  assert.match(
    formatAnswer(answer, citations, "footnotes"),
    /Sources:\n\[1\] Paper A — "Observed 42% gain\."/
  );
});

test("formatCitationsReport deduplicates sources, detects URLs/years, and escapes BibTeX", () => {
  const report = formatCitationsReport(
    [
      "2023_Climate_&_Energy_Report.pdf",
      "2023_Climate_&_Energy_Report.pdf",
      "https://example.org/2024/study",
    ],
    "both",
    "sess_1"
  );

  assert.equal(report.count, 2);
  assert.match(report.apa, /\(2023\)\. \*2023 Climate & Energy Report\*/);
  assert.match(report.apa, /example\.org\. \(2024\).*Retrieved from https:\/\/example\.org/);
  assert.match(report.bibtex, /title = \{2023 Climate \\& Energy Report\}/);
  assert.match(report.bibtex, /url = \{https:\/\/example\.org\/2024\/study\}/);
});

test("formatResearchDossier includes TOC, summary, corpus, turns, and citations", () => {
  const md = formatResearchDossier({
    title: "Test Dossier",
    sessionId: "sess_abc",
    notebookUrl: "https://notebooklm.google.com/notebook/123",
    executiveSummary: "Concise summary.",
    sources: ["Source One.pdf"],
    history: [
      {
        timestamp: "2026-11-11T00:00:00.000Z",
        question: "What is the main conclusion?",
        answer: "The conclusion is X [1].",
        citations: ['[1] Source One.pdf — "Quote"'],
      },
    ],
  });

  assert.match(md, /## 📑 Table of Contents/);
  assert.match(md, /\[Turn 1: What is the main conclusion\?\]\(#turn-1\)/);
  assert.match(md, /## 📌 Executive Summary\n\nConcise summary\./);
  assert.match(md, /\*\*Citations:\*\*\n- \[1\] Source One\.pdf/);
});

test("ToolHandlers restores CONFIG on session errors and saves citations on history", async () => {
  const tmpDir = fs.mkdtempSync(path.join(os.tmpdir(), "nlm-handlers-test-"));
  const initialHeadless = CONFIG.headless;

  try {
    const fakeSession = {
      sessionId: "sess_test",
      notebookUrl: "https://notebooklm.google.com/notebook/abc",
      history: [] as Array<{
        timestamp: string;
        question: string;
        answer: string;
        citations?: string[];
      }>,
      ask: async (question: string) => {
        const answer = "Answer [1]";
        fakeSession.history.push({ timestamp: "2026-11-11T00:00:00.000Z", question, answer });
        return answer;
      },
      extractCitations: async (rawAnswer: string) => ({
        citations: [{ marker: "[1]", number: 1, sourceName: "Doc 1", sourceText: "Snippet" }],
        formattedAnswer: `${rawAnswer}\n\nSources:\n[1] Doc 1`,
      }),
      getInfo: () => ({ age_seconds: 1, message_count: 1, last_activity: 1 }),
      listSources: async () => {
        throw new Error("boom");
      },
    };

    const fakeSessionManager = {
      getOrCreateSession: async () => fakeSession,
    } as unknown as SessionManager;
    const fakeAuthManager = {} as AuthManager;
    const fakeLibrary = {
      getActiveNotebook: () => null,
    } as unknown as NotebookLibrary;

    const handlers = new ToolHandlers(fakeSessionManager, fakeAuthManager, fakeLibrary);

    const errRes = await handlers.handleListSources({ show_browser: true });
    assert.equal(errRes.success, false);
    assert.match(errRes.error ?? "", /boom/);
    assert.equal(CONFIG.headless, initialHeadless);

    const askRes = await handlers.handleAskQuestion({
      question: "Test?",
      source_format: "footnotes",
    });
    assert.equal(askRes.success, true);
    assert.equal(fakeSession.history[0]?.citations?.length, 1);

    const dossierPath = path.join(tmpDir, "dossier.md");
    const exportRes = await handlers.handleExportResearchDossier({ destination_path: dossierPath });
    assert.equal(exportRes.success, true);
    const written = fs.readFileSync(dossierPath, "utf-8");
    assert.match(written, /\[1\] Doc 1 — "Snippet"/);
  } finally {
    CONFIG.headless = initialHeadless;
    fs.rmSync(tmpDir, { recursive: true, force: true });
  }
});

