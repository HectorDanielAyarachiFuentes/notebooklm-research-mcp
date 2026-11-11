import type { AuthManager } from "../../auth/auth-manager.js";
import type { NotebookLibrary } from "../../library/notebook-library.js";
import type { BrowserSession } from "../../session/browser-session.js";
import type { SessionManager } from "../../session/session-manager.js";
import {
  applyBrowserOptions,
  resolveOverrideHeadless,
  type BrowserOptions,
  type Config,
} from "../../config.js";
import type { ToolResult } from "../../types.js";
import { log } from "../../utils/logger.js";

export interface HandlerDeps {
  sessionManager: SessionManager;
  authManager: AuthManager;
  library: NotebookLibrary;
}

export type NotebookSessionArgs = {
  session_id?: string;
  notebook_id?: string;
  notebook_url?: string;
  show_browser?: boolean;
  browser_options?: BrowserOptions;
};

/**
 * Format and log a uniform failure ToolResult for caught handler exceptions.
 */
export function toolError<T = never>(toolName: string, error: unknown): ToolResult<T> {
  const errorMessage = error instanceof Error ? error.message : String(error);
  log.error(`❌ [TOOL] ${toolName} failed: ${errorMessage}`);
  return { success: false, error: errorMessage };
}

/**
 * Resolve a notebook URL from explicit URL, library notebook ID, or active notebook.
 */
export function resolveNotebookUrl(
  library: NotebookLibrary,
  notebookId?: string,
  notebookUrl?: string
): string | undefined {
  if (notebookUrl) return notebookUrl;
  if (notebookId) {
    const nb = library.getNotebook(notebookId);
    if (!nb) throw new Error(`Notebook not found in library: ${notebookId}`);
    return nb.url;
  }
  const active = library.getActiveNotebook();
  return active?.url;
}

/**
 * Run a session-backed tool call with uniform notebook lookup, isolated per-call
 * effective browser config (no global CONFIG mutation), and uniform error handling.
 */
export async function withNotebookSession<T>(
  deps: HandlerDeps,
  toolName: string,
  args: NotebookSessionArgs,
  fn: (session: BrowserSession, effectiveConfig: Config) => Promise<ToolResult<T>>
): Promise<ToolResult<T>> {
  const effectiveConfig = applyBrowserOptions(args.browser_options, args.show_browser);
  const overrideHeadless = resolveOverrideHeadless(args.browser_options, args.show_browser);

  try {
    const url = resolveNotebookUrl(deps.library, args.notebook_id, args.notebook_url);
    const session = await deps.sessionManager.getOrCreateSession(
      args.session_id,
      url,
      overrideHeadless,
      effectiveConfig
    );
    return await fn(session, effectiveConfig);
  } catch (error) {
    return toolError(toolName, error);
  }
}
