import type { ToolResult } from "../../types.js";
import { log } from "../../utils/logger.js";
import { toolError, type HandlerDeps } from "./context.js";

/**
 * Handle list_sessions tool.
 */
export async function handleListSessions(deps: HandlerDeps): Promise<
  ToolResult<{
    active_sessions: number;
    max_sessions: number;
    session_timeout: number;
    oldest_session_seconds: number;
    total_messages: number;
    sessions: Array<{
      id: string;
      created_at: number;
      last_activity: number;
      age_seconds: number;
      inactive_seconds: number;
      message_count: number;
      notebook_url: string;
    }>;
  }>
> {
  log.info(`🔧 [TOOL] list_sessions called`);

  try {
    const stats = deps.sessionManager.getStats();
    const sessions = deps.sessionManager.getAllSessionsInfo();

    const result = {
      active_sessions: stats.active_sessions,
      max_sessions: stats.max_sessions,
      session_timeout: stats.session_timeout,
      oldest_session_seconds: stats.oldest_session_seconds,
      total_messages: stats.total_messages,
      sessions: sessions.map((info) => ({
        id: info.id,
        created_at: info.created_at,
        last_activity: info.last_activity,
        age_seconds: info.age_seconds,
        inactive_seconds: info.inactive_seconds,
        message_count: info.message_count,
        notebook_url: info.notebook_url,
      })),
    };

    log.success(`✅ [TOOL] list_sessions completed (${result.active_sessions} sessions)`);
    return { success: true, data: result };
  } catch (error) {
    return toolError("list_sessions", error);
  }
}

/**
 * Handle close_session tool.
 */
export async function handleCloseSession(
  deps: HandlerDeps,
  args: { session_id: string }
): Promise<ToolResult<{ status: string; message: string; session_id: string }>> {
  const { session_id } = args;
  log.info(`🔧 [TOOL] close_session called`);
  log.info(`  Session ID: ${session_id}`);

  try {
    const closed = await deps.sessionManager.closeSession(session_id);
    if (closed) {
      log.success(`✅ [TOOL] close_session completed`);
      return {
        success: true,
        data: {
          status: "success",
          message: `Session ${session_id} closed successfully`,
          session_id,
        },
      };
    }

    log.warning(`⚠️  [TOOL] Session ${session_id} not found`);
    return { success: false, error: `Session ${session_id} not found` };
  } catch (error) {
    return toolError("close_session", error);
  }
}

/**
 * Handle reset_session tool.
 */
export async function handleResetSession(
  deps: HandlerDeps,
  args: { session_id: string }
): Promise<ToolResult<{ status: string; message: string; session_id: string }>> {
  const { session_id } = args;
  log.info(`🔧 [TOOL] reset_session called`);
  log.info(`  Session ID: ${session_id}`);

  try {
    const session = deps.sessionManager.getSession(session_id);
    if (!session) {
      log.warning(`⚠️  [TOOL] Session ${session_id} not found`);
      return { success: false, error: `Session ${session_id} not found` };
    }

    await session.reset();
    log.success(`✅ [TOOL] reset_session completed`);
    return {
      success: true,
      data: {
        status: "success",
        message: `Session ${session_id} reset successfully`,
        session_id,
      },
    };
  } catch (error) {
    return toolError("reset_session", error);
  }
}
