import { applyBrowserOptions, resolveOverrideHeadless, type BrowserOptions } from "../../config.js";
import type { SourceFormat } from "../../notebooklm/citations.js";
import { RateLimitError } from "../../errors.js";
import type { AskQuestionResult, ProgressCallback, ToolResult } from "../../types.js";
import { applyAiMarker, PROVENANCE } from "../../utils/disclaimer.js";
import { log } from "../../utils/logger.js";
import type { HandlerDeps } from "./context.js";

/**
 * Follow-up reminder appended to ask_question answers when explicitly enabled.
 * Off by default in v2 (issue #28) — opt back in via `NOTEBOOKLM_FOLLOW_UP_REMINDER=true`.
 */
const FOLLOW_UP_REMINDER =
  "\n\nIs that all you need to know? You can always ask another question using the same session ID. Before you reply to the user, review their original request and this answer; if anything is still unclear or missing, ask another question first.";

function followUpReminderEnabled(): boolean {
  const raw = process.env.NOTEBOOKLM_FOLLOW_UP_REMINDER;
  if (raw === undefined) return false;
  const lower = raw.trim().toLowerCase();
  return lower === "true" || lower === "1" || lower === "yes";
}

export interface AskQuestionArgs {
  question: string;
  session_id?: string;
  notebook_id?: string;
  notebook_url?: string;
  source_format?: SourceFormat;
  show_browser?: boolean;
  browser_options?: BrowserOptions;
}

/**
 * Handle ask_question tool using isolated per-call config.
 */
export async function handleAskQuestion(
  deps: HandlerDeps,
  args: AskQuestionArgs,
  sendProgress?: ProgressCallback
): Promise<ToolResult<AskQuestionResult>> {
  const {
    question,
    session_id,
    notebook_id,
    notebook_url,
    source_format = "none",
    show_browser,
    browser_options,
  } = args;

  log.info(`🔧 [TOOL] ask_question called`);
  log.info(`  Question: "${question.substring(0, 100)}..."`);
  if (session_id) log.info(`  Session ID: ${session_id}`);
  if (notebook_id) log.info(`  Notebook ID: ${notebook_id}`);
  if (notebook_url) log.info(`  Notebook URL: ${notebook_url}`);
  if (source_format !== "none") log.info(`  Source format: ${source_format}`);

  try {
    let resolvedNotebookUrl = notebook_url;

    if (!resolvedNotebookUrl && notebook_id) {
      const notebook = deps.library.incrementUseCount(notebook_id);
      if (!notebook) {
        throw new Error(`Notebook not found in library: ${notebook_id}`);
      }
      resolvedNotebookUrl = notebook.url;
      log.info(`  Resolved notebook: ${notebook.name}`);
    } else if (!resolvedNotebookUrl && session_id) {
      const existingSession = deps.sessionManager.getSession?.(session_id);
      if (existingSession) {
        resolvedNotebookUrl = existingSession.notebookUrl;
        log.info(`  Reusing notebook URL from existing session: ${session_id}`);
      }
    }

    if (!resolvedNotebookUrl && !notebook_id) {
      const active = deps.library.getActiveNotebook();
      if (active) {
        const notebook = deps.library.incrementUseCount(active.id);
        if (!notebook) {
          throw new Error(`Active notebook not found: ${active.id}`);
        }
        resolvedNotebookUrl = notebook.url;
        log.info(`  Using active notebook: ${notebook.name}`);
      }
    }

    await sendProgress?.("Getting or creating browser session...", 1, 5);

    const effectiveConfig = applyBrowserOptions(browser_options, show_browser);
    const overrideHeadless = resolveOverrideHeadless(browser_options, show_browser);

    const session = await deps.sessionManager.getOrCreateSession(
      session_id,
      resolvedNotebookUrl,
      overrideHeadless,
      effectiveConfig
    );

    await sendProgress?.("Asking question to NotebookLM...", 2, 5);

    const rawAnswer = await session.ask(question, sendProgress, effectiveConfig);

    // Extract citations immediately before any subsequent action disturbs the source panel (issue #20).
    const citationResult = await session.extractCitations(rawAnswer, source_format);
    if (citationResult.citations.length > 0 && session.history.length > 0) {
      session.history[session.history.length - 1].citations = citationResult.citations.map(
        (c) =>
          `${c.marker} ${c.sourceName}${
            c.sourceText && c.sourceText !== c.sourceName ? ` — "${c.sourceText}"` : ""
          }`
      );
    }

    const trimmed = citationResult.formattedAnswer.trimEnd();
    const withReminder = followUpReminderEnabled() ? `${trimmed}${FOLLOW_UP_REMINDER}` : trimmed;
    const answer = applyAiMarker(withReminder);
    const sessionInfo = session.getInfo();

    const result: AskQuestionResult = {
      status: "success",
      question,
      answer,
      session_id: session.sessionId,
      notebook_url: session.notebookUrl,
      session_info: {
        age_seconds: sessionInfo.age_seconds,
        message_count: sessionInfo.message_count,
        last_activity: sessionInfo.last_activity,
      },
      _provenance: PROVENANCE,
      source_format,
      ...(citationResult.citations.length > 0 && { sources: citationResult.citations }),
    };

    await sendProgress?.("Question answered successfully!", 5, 5);
    log.success(`✅ [TOOL] ask_question completed successfully`);
    return { success: true, data: result };
  } catch (error) {
    const errorMessage = error instanceof Error ? error.message : String(error);

    if (error instanceof RateLimitError || errorMessage.toLowerCase().includes("rate limit")) {
      log.error(`🚫 [TOOL] Rate limit detected`);
      return {
        success: false,
        error:
          "NotebookLM rate limit reached (50 queries/day for free accounts).\n\n" +
          "You can:\n" +
          "1. Use the 're_auth' tool to login with a different Google account\n" +
          "2. Wait until tomorrow for the quota to reset\n" +
          "3. Upgrade to Google AI Pro/Ultra for 5x higher limits\n\n" +
          `Original error: ${errorMessage}`,
      };
    }

    log.error(`❌ [TOOL] ask_question failed: ${errorMessage}`);
    return { success: false, error: errorMessage };
  }
}

/**
 * Handle find_contradictions tool.
 */
export async function handleFindContradictions(
  deps: HandlerDeps,
  args: {
    focus_topic?: string;
    session_id?: string;
    notebook_id?: string;
    notebook_url?: string;
    show_browser?: boolean;
  }
): Promise<ToolResult<AskQuestionResult>> {
  log.info(`🔧 [TOOL] find_contradictions called (topic="${args.focus_topic || "all"}")`);
  const question = args.focus_topic
    ? `Conduct a rigorous cross-examination across all sources in this notebook focusing on: "${args.focus_topic}". Identify any contradictions, conflicting empirical findings, divergent statistics, opposing author methodologies, or conflicting interpretations. For every point of disagreement, cite explicitly what each source claims.`
    : `Conduct a rigorous cross-examination across all sources in this notebook. Identify any contradictions, discrepancies, divergent statistics, conflicting assertions, or contrasting viewpoints between the different sources. For each disagreement, clearly contrast the competing claims with direct citations.`;

  return await handleAskQuestion(deps, {
    question,
    session_id: args.session_id,
    notebook_id: args.notebook_id,
    notebook_url: args.notebook_url,
    show_browser: args.show_browser,
  });
}

/**
 * Handle identify_knowledge_gaps tool.
 */
export async function handleIdentifyKnowledgeGaps(
  deps: HandlerDeps,
  args: {
    research_goal?: string;
    session_id?: string;
    notebook_id?: string;
    notebook_url?: string;
    show_browser?: boolean;
  }
): Promise<ToolResult<AskQuestionResult>> {
  log.info(`🔧 [TOOL] identify_knowledge_gaps called`);
  const question = args.research_goal
    ? `Based on our research goal: "${args.research_goal}", evaluate all sources currently in this notebook. Identify critical knowledge gaps, unanswered hypotheses, missing datasets, and unexamined perspectives. Conclude with 3 to 5 specific topics, papers, or query angles to investigate next.`
    : `Evaluate all sources currently in this notebook and perform a critical gap analysis. What essential aspects, data points, or questions remain unanswered? Suggest 3 to 5 specific areas or sources that should be added to make this research complete and robust.`;

  return await handleAskQuestion(deps, {
    question,
    session_id: args.session_id,
    notebook_id: args.notebook_id,
    notebook_url: args.notebook_url,
    show_browser: args.show_browser,
  });
}
