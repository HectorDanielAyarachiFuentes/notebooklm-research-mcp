import fs from "fs";
import path from "path";
import type { ToolResult } from "../../types.js";
import { log } from "../../utils/logger.js";
import { resolveNotebookUrl, toolError, type HandlerDeps } from "./context.js";

export interface DossierTurn {
  timestamp: string;
  question: string;
  answer: string;
  citations?: string[];
}

export interface FormatDossierInput {
  title: string;
  sessionId: string;
  notebookUrl?: string;
  executiveSummary?: string;
  sources: string[];
  history: DossierTurn[];
  includeCitations?: boolean;
  generatedAt?: string;
}

/**
 * Handle export_research_dossier tool.
 */
export async function handleExportResearchDossier(
  deps: HandlerDeps,
  args: {
    destination_path?: string;
    title?: string;
    executive_summary?: string;
    include_citations?: boolean;
    session_id?: string;
    notebook_id?: string;
    notebook_url?: string;
  }
): Promise<
  ToolResult<{ file_path: string; word_count: number; total_turns: number; preview: string }>
> {
  log.info(`🔧 [TOOL] export_research_dossier called`);
  try {
    const url = resolveNotebookUrl(deps.library, args.notebook_id, args.notebook_url);
    const session = await deps.sessionManager.getOrCreateSession(args.session_id, url);
    const activeNotebook = deps.library.getActiveNotebook();

    const docTitle =
      args.title?.trim() ||
      (activeNotebook ? `Research Dossier: ${activeNotebook.name}` : "NotebookLM Research Dossier");
    const sources = await session.listSources().catch(() => []);

    const markdown = formatResearchDossier({
      title: docTitle,
      sessionId: session.sessionId,
      notebookUrl: url,
      executiveSummary: args.executive_summary,
      sources,
      history: session.history,
      includeCitations: args.include_citations !== false,
    });

    const defaultFilename = `research-dossier-${Date.now()}.md`;
    const targetPath = path.resolve(args.destination_path || defaultFilename);
    await fs.promises.mkdir(path.dirname(targetPath), { recursive: true });
    await fs.promises.writeFile(targetPath, markdown, "utf-8");

    const wordCount = markdown.split(/\s+/).filter(Boolean).length;
    log.success(`✅ [TOOL] Dossier exported to: ${targetPath} (${wordCount} words)`);

    return {
      success: true,
      data: {
        file_path: targetPath,
        word_count: wordCount,
        total_turns: session.history.length,
        preview: markdown.slice(0, 500) + "...",
      },
    };
  } catch (error) {
    return toolError("export_research_dossier", error);
  }
}

/**
 * Handle export_citations tool.
 */
export async function handleExportCitations(
  deps: HandlerDeps,
  args: {
    format?: "both" | "bibtex" | "apa";
    destination_path?: string;
    session_id?: string;
    notebook_id?: string;
    notebook_url?: string;
  }
): Promise<ToolResult<{ count: number; apa?: string; bibtex?: string; saved_to?: string }>> {
  log.info(`🔧 [TOOL] export_citations called`);
  try {
    const url = resolveNotebookUrl(deps.library, args.notebook_id, args.notebook_url);
    const session = await deps.sessionManager.getOrCreateSession(args.session_id, url);
    const sources = await session.listSources().catch(() => []);

    const format = args.format || "both";
    const { count, apa, bibtex, document } = formatCitationsReport(
      sources,
      format,
      session.sessionId
    );

    let saved_to: string | undefined = undefined;
    if (args.destination_path) {
      const resolved = path.resolve(args.destination_path);
      await fs.promises.mkdir(path.dirname(resolved), { recursive: true });
      await fs.promises.writeFile(resolved, document, "utf-8");
      saved_to = resolved;
      log.success(`✅ Citations written to ${resolved}`);
    }

    return {
      success: true,
      data: {
        count,
        apa: format === "bibtex" ? undefined : apa,
        bibtex: format === "apa" ? undefined : bibtex,
        saved_to,
      },
    };
  } catch (error) {
    return toolError("export_citations", error);
  }
}

/**
 * Formats a research session's metadata, sources, and Q&A turns into Markdown.
 */
export function formatResearchDossier(input: FormatDossierInput): string {
  const timestamp = input.generatedAt ?? new Date().toISOString();
  const includeCitations = input.includeCitations !== false;

  let markdown = `# ${input.title}\n\n`;
  markdown += `> **Generated on:** ${timestamp}  \n`;
  markdown += `> **Session ID:** \`${input.sessionId}\`  \n`;
  if (input.notebookUrl) markdown += `> **Notebook:** [NotebookLM Link](${input.notebookUrl})  \n`;
  markdown += `\n---\n\n`;

  if (input.executiveSummary?.trim()) {
    markdown += `## 📌 Executive Summary\n\n${input.executiveSummary.trim()}\n\n---\n\n`;
  }

  if (input.sources.length > 0) {
    markdown += `## 📚 Indexed Sources Corpus (${input.sources.length})\n\n`;
    input.sources.forEach((s, idx) => {
      markdown += `${idx + 1}. **${s}**\n`;
    });
    markdown += `\n---\n\n`;
  }

  if (input.history.length > 0) {
    markdown += `## 📑 Table of Contents\n\n`;
    input.history.forEach((entry, idx) => {
      const summary = entry.question.replace(/\s+/g, " ").trim().slice(0, 80);
      markdown += `${idx + 1}. [Turn ${idx + 1}: ${summary}](#turn-${idx + 1})\n`;
    });
    markdown += `\n---\n\n`;
  }

  markdown += `## 🔬 Research Findings & Inquiries\n\n`;

  if (input.history.length === 0) {
    markdown += `*No prior Q&A turns recorded in this active session memory yet.*\n`;
    return markdown;
  }

  input.history.forEach((entry, idx) => {
    markdown += `<a id="turn-${idx + 1}"></a>\n\n`;
    markdown += `### Turn ${idx + 1}: ${entry.question}\n\n`;
    markdown += `*Recorded at: ${entry.timestamp}*\n\n`;
    markdown += `${entry.answer}\n\n`;
    if (includeCitations && entry.citations && entry.citations.length > 0) {
      markdown += `**Citations:**\n`;
      entry.citations.forEach((c) => {
        markdown += `- ${c}\n`;
      });
      markdown += `\n`;
    }
    markdown += `---\n\n`;
  });

  return markdown;
}

function escapeBibtex(value: string): string {
  return value
    .replace(/\\/g, "\\textbackslash{}")
    .replace(/[{}]/g, "")
    .replace(/([&%#_])/g, "\\$1");
}

function parseSourceEntry(rawSource: string): {
  title: string;
  author: string;
  year: string;
  url?: string;
} {
  const trimmed = rawSource.trim();
  const currentYear = String(new Date().getFullYear());

  if (/^https?:\/\//i.test(trimmed)) {
    try {
      const parsed = new URL(trimmed);
      const host = parsed.hostname.replace(/^www\./i, "");
      const yearMatch = trimmed.match(/\b(19\d{2}|20\d{2})\b/);
      return {
        title: trimmed,
        author: host || "Web Source",
        year: yearMatch ? yearMatch[1] : currentYear,
        url: trimmed,
      };
    } catch {
      // Fall through to plain title formatting if URL parsing fails
    }
  }

  // ponytail: NotebookLM source list exposes only the display name/filename, not author metadata.
  const withoutExt = trimmed.replace(/\.(pdf|md|markdown|txt|csv|docx?)$/i, "");
  const cleanTitle = withoutExt.replace(/_/g, " ").replace(/\s+/g, " ").trim() || trimmed;
  const yearMatch = cleanTitle.match(/\b(19\d{2}|20\d{2})\b/);

  return {
    title: cleanTitle,
    author: "NotebookLM Source",
    year: yearMatch ? yearMatch[1] : currentYear,
  };
}

/**
 * Formats deduplicated NotebookLM sources into APA and BibTeX bibliography strings.
 */
export function formatCitationsReport(
  sources: string[],
  format: "both" | "bibtex" | "apa",
  sessionId: string
): { count: number; apa: string; bibtex: string; document: string } {
  const uniqueSources = Array.from(new Set(sources.map((s) => s.trim()).filter(Boolean)));
  let apa = "";
  let bibtex = "";

  uniqueSources.forEach((source, index) => {
    const entry = parseSourceEntry(source);
    const key = `notebooklm_ref_${index + 1}`;

    apa += entry.url
      ? `${index + 1}. ${entry.author}. (${entry.year}). *${entry.title}*. Retrieved from ${entry.url}\n`
      : `${index + 1}. ${entry.author}. (${entry.year}). *${entry.title}*. NotebookLM indexed source.\n`;

    bibtex += `@misc{${key},\n`;
    bibtex += `  title = {${escapeBibtex(entry.title)}},\n`;
    bibtex += `  author = {{${escapeBibtex(entry.author)}}},\n`;
    bibtex += `  year = {${entry.year}},\n`;
    if (entry.url) {
      bibtex += `  howpublished = {\\url{${entry.url}}},\n`;
      bibtex += `  url = {${entry.url}},\n`;
    }
    bibtex += `  note = {Grounded source in NotebookLM session ${escapeBibtex(sessionId)}}\n`;
    bibtex += `}\n\n`;
  });

  const document =
    format === "apa"
      ? `# APA References\n\n${apa}`
      : format === "bibtex"
        ? `% BibTeX Bibliography\n\n${bibtex}`
        : `# Academic Citations\n\n## APA 7th Edition\n\n${apa}\n## BibTeX\n\n\`\`\`bibtex\n${bibtex}\`\`\``;

  return { count: uniqueSources.length, apa, bibtex, document };
}
