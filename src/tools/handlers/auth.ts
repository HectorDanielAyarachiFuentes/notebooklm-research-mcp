import {
  CONFIG,
  applyBrowserOptions,
  resolveOverrideHeadless,
  type BrowserOptions,
} from "../../config.js";
import type { ProgressCallback, ToolResult } from "../../types.js";
import { CleanupManager } from "../../utils/cleanup-manager.js";
import { log } from "../../utils/logger.js";
import { toolError, type HandlerDeps } from "./context.js";

export interface AuthSetupArgs {
  show_browser?: boolean;
  browser_options?: BrowserOptions;
}

export interface AuthSetupResult {
  status: string;
  message: string;
  authenticated: boolean;
  duration_seconds?: number;
}

/**
 * Handle get_health tool.
 */
export async function handleGetHealth(deps: HandlerDeps): Promise<
  ToolResult<{
    status: string;
    authenticated: boolean;
    notebook_url: string;
    active_notebook_id: string | null;
    active_notebook_name: string | null;
    total_notebooks: number;
    active_sessions: number;
    max_sessions: number;
    session_timeout: number;
    total_messages: number;
    headless: boolean;
    auto_login_enabled: boolean;
    stealth_enabled: boolean;
    troubleshooting_tip?: string;
  }>
> {
  log.info(`🔧 [TOOL] get_health called`);

  try {
    const statePath = await deps.authManager.getValidStatePath();
    const authenticated = statePath !== null;
    const stats = deps.sessionManager.getStats();
    const active = deps.library.getActiveNotebook();
    const notebookUrl = active?.url || CONFIG.notebookUrl || "not configured";

    const result = {
      status: "ok",
      authenticated,
      notebook_url: notebookUrl,
      active_notebook_id: active?.id ?? null,
      active_notebook_name: active?.name ?? null,
      total_notebooks: deps.library.getStats().total_notebooks,
      active_sessions: stats.active_sessions,
      max_sessions: stats.max_sessions,
      session_timeout: stats.session_timeout,
      total_messages: stats.total_messages,
      headless: CONFIG.headless,
      auto_login_enabled: CONFIG.autoLoginEnabled,
      stealth_enabled: CONFIG.stealthEnabled,
      ...(!authenticated && {
        troubleshooting_tip:
          "For fresh start with clean browser session: Close all Chrome instances → " +
          "cleanup_data(confirm=true, preserve_library=true) → setup_auth",
      }),
    };

    log.success(`✅ [TOOL] get_health completed`);
    return { success: true, data: result };
  } catch (error) {
    return toolError("get_health", error);
  }
}

/**
 * Handle setup_auth tool.
 */
export async function handleSetupAuth(
  deps: HandlerDeps,
  args: AuthSetupArgs,
  sendProgress?: ProgressCallback
): Promise<ToolResult<AuthSetupResult>> {
  const { show_browser, browser_options } = args;
  await sendProgress?.("Initializing authentication setup...", 0, 10);
  log.info(`🔧 [TOOL] setup_auth called`);
  if (show_browser !== undefined) log.info(`  Show browser: ${show_browser}`);

  const startTime = Date.now();
  const effectiveConfig = applyBrowserOptions(browser_options, show_browser);
  const overrideHeadless = resolveOverrideHeadless(browser_options, show_browser);

  try {
    await sendProgress?.("Preparing authentication browser...", 1, 10);
    log.info(`  🌐 Opening browser for interactive login...`);
    await sendProgress?.("Opening browser window...", 2, 10);

    const success = await deps.authManager.performSetup(
      sendProgress,
      overrideHeadless,
      effectiveConfig
    );
    const durationSeconds = (Date.now() - startTime) / 1000;

    if (success) {
      await sendProgress?.("Authentication saved successfully!", 10, 10);
      log.success(`✅ [TOOL] setup_auth completed (${durationSeconds.toFixed(1)}s)`);
      return {
        success: true,
        data: {
          status: "authenticated",
          message: "Successfully authenticated and saved browser state",
          authenticated: true,
          duration_seconds: durationSeconds,
        },
      };
    }

    log.error(`❌ [TOOL] setup_auth failed (${durationSeconds.toFixed(1)}s)`);
    return { success: false, error: "Authentication failed or was cancelled" };
  } catch (error) {
    const errorMessage = error instanceof Error ? error.message : String(error);
    const durationSeconds = (Date.now() - startTime) / 1000;
    log.error(`❌ [TOOL] setup_auth failed: ${errorMessage} (${durationSeconds.toFixed(1)}s)`);
    return { success: false, error: errorMessage };
  }
}

/**
 * Handle re_auth tool.
 */
export async function handleReAuth(
  deps: HandlerDeps,
  args: AuthSetupArgs,
  sendProgress?: ProgressCallback
): Promise<ToolResult<AuthSetupResult>> {
  const { show_browser, browser_options } = args;
  await sendProgress?.("Preparing re-authentication...", 0, 12);
  log.info(`🔧 [TOOL] re_auth called`);
  if (show_browser !== undefined) log.info(`  Show browser: ${show_browser}`);

  const startTime = Date.now();
  const effectiveConfig = applyBrowserOptions(browser_options, show_browser);
  const overrideHeadless = resolveOverrideHeadless(browser_options, show_browser);

  try {
    await sendProgress?.("Closing all active sessions...", 1, 12);
    log.info("  🛑 Closing all sessions...");
    await deps.sessionManager.closeAllSessions();
    log.success("  ✅ All sessions closed");

    await sendProgress?.("Clearing authentication data...", 2, 12);
    log.info("  🗑️  Clearing all auth data...");
    await deps.authManager.clearAllAuthData();
    log.success("  ✅ Auth data cleared");

    await sendProgress?.("Starting fresh authentication...", 3, 12);
    log.info("  🌐 Starting fresh authentication setup...");
    const success = await deps.authManager.performSetup(
      sendProgress,
      overrideHeadless,
      effectiveConfig
    );
    const durationSeconds = (Date.now() - startTime) / 1000;

    if (success) {
      await sendProgress?.("Re-authentication complete!", 12, 12);
      log.success(`✅ [TOOL] re_auth completed (${durationSeconds.toFixed(1)}s)`);
      return {
        success: true,
        data: {
          status: "authenticated",
          message:
            "Successfully re-authenticated with new account. All previous sessions have been closed.",
          authenticated: true,
          duration_seconds: durationSeconds,
        },
      };
    }

    log.error(`❌ [TOOL] re_auth failed (${durationSeconds.toFixed(1)}s)`);
    return { success: false, error: "Re-authentication failed or was cancelled" };
  } catch (error) {
    const errorMessage = error instanceof Error ? error.message : String(error);
    const durationSeconds = (Date.now() - startTime) / 1000;
    log.error(`❌ [TOOL] re_auth failed: ${errorMessage} (${durationSeconds.toFixed(1)}s)`);
    return { success: false, error: errorMessage };
  }
}

/**
 * Handle cleanup_data tool.
 */
export async function handleCleanupData(args: {
  confirm: boolean;
  preserve_library?: boolean;
}): Promise<
  ToolResult<{
    status: string;
    mode: string;
    preview?: {
      categories: Array<{
        name: string;
        description: string;
        paths: string[];
        totalBytes: number;
        optional: boolean;
      }>;
      totalPaths: number;
      totalSizeBytes: number;
    };
    result?: {
      deletedPaths: string[];
      failedPaths: string[];
      totalSizeBytes: number;
      categorySummary: Record<string, { count: number; bytes: number }>;
    };
  }>
> {
  const { confirm, preserve_library = false } = args;
  log.info(`🔧 [TOOL] cleanup_data called`);
  log.info(`  Confirm: ${confirm}`);
  log.info(`  Preserve Library: ${preserve_library}`);

  const cleanupManager = new CleanupManager();

  try {
    const mode = "deep";

    if (!confirm) {
      log.info(`  📋 Generating cleanup preview (mode: ${mode})...`);
      const preview = await cleanupManager.getCleanupPaths(mode, preserve_library);
      const platformInfo = cleanupManager.getPlatformInfo();

      log.info(
        `  Found ${preview.totalPaths.length} items (${cleanupManager.formatBytes(preview.totalSizeBytes)})`
      );
      log.info(`  Platform: ${platformInfo.platform}`);

      return {
        success: true,
        data: {
          status: "preview",
          mode,
          preview: {
            categories: preview.categories,
            totalPaths: preview.totalPaths.length,
            totalSizeBytes: preview.totalSizeBytes,
          },
        },
      };
    }

    log.info(`  🗑️  Performing cleanup (mode: ${mode})...`);
    const result = await cleanupManager.performCleanup(mode, preserve_library);

    if (result.success) {
      log.success(`✅ [TOOL] cleanup_data completed - deleted ${result.deletedPaths.length} items`);
    } else {
      log.warning(`⚠️  [TOOL] cleanup_data completed with ${result.failedPaths.length} errors`);
    }

    return {
      success: result.success,
      data: {
        status: result.success ? "completed" : "partial",
        mode,
        result: {
          deletedPaths: result.deletedPaths,
          failedPaths: result.failedPaths,
          totalSizeBytes: result.totalSizeBytes,
          categorySummary: result.categorySummary,
        },
      },
    };
  } catch (error) {
    return toolError("cleanup_data", error);
  }
}
