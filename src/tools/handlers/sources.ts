import type { AudioGenerationResult, DownloadAudioResult } from "../../notebooklm/audio.js";
import type {
  AddSourceInput,
  AddSourceResult,
  BatchAddSourceResult,
  SourceType,
} from "../../notebooklm/sources.js";
import type { ToolResult } from "../../types.js";
import { log } from "../../utils/logger.js";
import { withNotebookSession, type HandlerDeps, type NotebookSessionArgs } from "./context.js";

/**
 * Handle add_source tool (issue #25).
 */
export async function handleAddSource(
  deps: HandlerDeps,
  args: NotebookSessionArgs & {
    type: SourceType;
    content?: string;
    path?: string;
    title?: string;
  }
): Promise<ToolResult<{ result: AddSourceResult }>> {
  log.info(`🔧 [TOOL] add_source called (type=${args.type})`);
  return withNotebookSession(deps, "add_source", args, async (session) => {
    const result = await session.addSource({
      type: args.type,
      content: args.content || args.path || "",
      path: args.path,
      title: args.title,
    });
    return { success: result.success, data: { result } };
  });
}

/**
 * Handle add_sources_batch tool.
 */
export async function handleAddSourcesBatch(
  deps: HandlerDeps,
  args: NotebookSessionArgs & {
    sources: Array<{
      type: SourceType;
      content?: string;
      path?: string;
      title?: string;
    }>;
  }
): Promise<ToolResult<{ result: BatchAddSourceResult }>> {
  log.info(`🔧 [TOOL] add_sources_batch called (${args.sources?.length || 0} sources)`);
  return withNotebookSession(deps, "add_sources_batch", args, async (session) => {
    const inputs: AddSourceInput[] = (args.sources || []).map((s) => ({
      type: s.type,
      content: s.content || s.path || "",
      path: s.path,
      title: s.title,
    }));
    const result = await session.addSourcesBatch(inputs);
    return { success: result.success, data: { result } };
  });
}

/**
 * Handle list_sources tool.
 */
export async function handleListSources(
  deps: HandlerDeps,
  args: NotebookSessionArgs
): Promise<ToolResult<{ sources: string[]; count: number }>> {
  log.info(`🔧 [TOOL] list_sources called`);
  return withNotebookSession(deps, "list_sources", args, async (session) => {
    const sources = await session.listSources();
    return { success: true, data: { sources, count: sources.length } };
  });
}

/**
 * Handle generate_audio tool (issue #11).
 */
export async function handleGenerateAudio(
  deps: HandlerDeps,
  args: NotebookSessionArgs & {
    custom_prompt?: string;
    timeout_ms?: number;
    wait_for_completion?: boolean;
  }
): Promise<ToolResult<{ result: AudioGenerationResult }>> {
  log.info(`🔧 [TOOL] generate_audio called`);
  return withNotebookSession(deps, "generate_audio", args, async (session) => {
    const result = await session.generateAudio({
      customPrompt: args.custom_prompt,
      timeoutMs: args.timeout_ms,
      waitForCompletion: args.wait_for_completion ?? false,
    });
    const ok =
      result.status === "ready" || result.status === "started" || result.status === "in_progress";
    return { success: ok, data: { result } };
  });
}

/**
 * Handle get_audio_status tool — non-blocking poll for Audio Overview state.
 */
export async function handleGetAudioStatus(
  deps: HandlerDeps,
  args: NotebookSessionArgs
): Promise<ToolResult<{ result: AudioGenerationResult }>> {
  log.info(`🔧 [TOOL] get_audio_status called`);
  return withNotebookSession(deps, "get_audio_status", args, async (session) => {
    const result = await session.getAudioStatus();
    return { success: true, data: { result } };
  });
}

/**
 * Handle download_audio tool (issue #11).
 */
export async function handleDownloadAudio(
  deps: HandlerDeps,
  args: NotebookSessionArgs & { destination_dir: string }
): Promise<ToolResult<{ result: DownloadAudioResult }>> {
  log.info(`🔧 [TOOL] download_audio called`);
  return withNotebookSession(deps, "download_audio", args, async (session) => {
    const result = await session.downloadAudio(args.destination_dir);
    return { success: result.success, data: { result } };
  });
}
