import type {
  AddNotebookInput,
  LibraryStats,
  NotebookEntry,
  UpdateNotebookInput,
} from "../../library/types.js";
import type { ToolResult } from "../../types.js";
import { log } from "../../utils/logger.js";
import { toolError, type HandlerDeps } from "./context.js";

/**
 * Handle add_notebook tool.
 */
export async function handleAddNotebook(
  deps: HandlerDeps,
  args: AddNotebookInput
): Promise<ToolResult<{ notebook: NotebookEntry }>> {
  log.info(`🔧 [TOOL] add_notebook called`);
  log.info(`  Name: ${args.name}`);

  try {
    const notebook = deps.library.addNotebook(args);
    log.success(`✅ [TOOL] add_notebook completed: ${notebook.id}`);
    return { success: true, data: { notebook } };
  } catch (error) {
    return toolError("add_notebook", error);
  }
}

/**
 * Handle list_notebooks tool.
 */
export async function handleListNotebooks(
  deps: HandlerDeps
): Promise<ToolResult<{ notebooks: NotebookEntry[] }>> {
  log.info(`🔧 [TOOL] list_notebooks called`);

  try {
    const notebooks = deps.library.listNotebooks();
    log.success(`✅ [TOOL] list_notebooks completed (${notebooks.length} notebooks)`);
    return { success: true, data: { notebooks } };
  } catch (error) {
    return toolError("list_notebooks", error);
  }
}

/**
 * Handle get_notebook tool.
 */
export async function handleGetNotebook(
  deps: HandlerDeps,
  args: { id: string }
): Promise<ToolResult<{ notebook: NotebookEntry }>> {
  log.info(`🔧 [TOOL] get_notebook called`);
  log.info(`  ID: ${args.id}`);

  try {
    const notebook = deps.library.getNotebook(args.id);
    if (!notebook) {
      log.warning(`⚠️  [TOOL] Notebook not found: ${args.id}`);
      return { success: false, error: `Notebook not found: ${args.id}` };
    }

    log.success(`✅ [TOOL] get_notebook completed: ${notebook.name}`);
    return { success: true, data: { notebook } };
  } catch (error) {
    return toolError("get_notebook", error);
  }
}

/**
 * Handle select_notebook tool.
 */
export async function handleSelectNotebook(
  deps: HandlerDeps,
  args: { id: string }
): Promise<ToolResult<{ notebook: NotebookEntry }>> {
  log.info(`🔧 [TOOL] select_notebook called`);
  log.info(`  ID: ${args.id}`);

  try {
    const notebook = deps.library.selectNotebook(args.id);
    log.success(`✅ [TOOL] select_notebook completed: ${notebook.name}`);
    return { success: true, data: { notebook } };
  } catch (error) {
    return toolError("select_notebook", error);
  }
}

/**
 * Handle update_notebook tool.
 */
export async function handleUpdateNotebook(
  deps: HandlerDeps,
  args: UpdateNotebookInput
): Promise<ToolResult<{ notebook: NotebookEntry }>> {
  log.info(`🔧 [TOOL] update_notebook called`);
  log.info(`  ID: ${args.id}`);

  try {
    const notebook = deps.library.updateNotebook(args);
    log.success(`✅ [TOOL] update_notebook completed: ${notebook.name}`);
    return { success: true, data: { notebook } };
  } catch (error) {
    return toolError("update_notebook", error);
  }
}

/**
 * Handle remove_notebook tool.
 */
export async function handleRemoveNotebook(
  deps: HandlerDeps,
  args: { id: string }
): Promise<ToolResult<{ removed: boolean; closed_sessions: number }>> {
  log.info(`🔧 [TOOL] remove_notebook called`);
  log.info(`  ID: ${args.id}`);

  try {
    const notebook = deps.library.getNotebook(args.id);
    if (!notebook) {
      log.warning(`⚠️  [TOOL] Notebook not found: ${args.id}`);
      return { success: false, error: `Notebook not found: ${args.id}` };
    }

    const removed = deps.library.removeNotebook(args.id);
    if (!removed) {
      log.warning(`⚠️  [TOOL] Notebook not found: ${args.id}`);
      return { success: false, error: `Notebook not found: ${args.id}` };
    }

    const closedSessions = await deps.sessionManager.closeSessionsForNotebook(notebook.url);
    log.success(`✅ [TOOL] remove_notebook completed`);
    return { success: true, data: { removed: true, closed_sessions: closedSessions } };
  } catch (error) {
    return toolError("remove_notebook", error);
  }
}

/**
 * Handle search_notebooks tool.
 */
export async function handleSearchNotebooks(
  deps: HandlerDeps,
  args: { query: string }
): Promise<ToolResult<{ notebooks: NotebookEntry[] }>> {
  log.info(`🔧 [TOOL] search_notebooks called`);
  log.info(`  Query: "${args.query}"`);

  try {
    const notebooks = deps.library.searchNotebooks(args.query);
    log.success(`✅ [TOOL] search_notebooks completed (${notebooks.length} results)`);
    return { success: true, data: { notebooks } };
  } catch (error) {
    return toolError("search_notebooks", error);
  }
}

/**
 * Handle get_library_stats tool.
 */
export async function handleGetLibraryStats(deps: HandlerDeps): Promise<ToolResult<LibraryStats>> {
  log.info(`🔧 [TOOL] get_library_stats called`);

  try {
    const stats = deps.library.getStats();
    log.success(`✅ [TOOL] get_library_stats completed`);
    return { success: true, data: stats };
  } catch (error) {
    return toolError("get_library_stats", error);
  }
}
