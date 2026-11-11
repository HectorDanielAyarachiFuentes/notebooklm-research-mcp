/**
 * MCP Tool Handlers
 *
 * Thin facade delegating to domain-specific handler modules under `./handlers/`.
 */

import type { AuthManager } from "../auth/auth-manager.js";
import type { NotebookLibrary } from "../library/notebook-library.js";
import type { SessionManager } from "../session/session-manager.js";
import type { ProgressCallback } from "../types.js";
import { log } from "../utils/logger.js";
import {
  handleAskQuestion,
  handleFindContradictions,
  handleIdentifyKnowledgeGaps,
  type AskQuestionArgs,
} from "./handlers/ask.js";
import {
  handleCleanupData,
  handleGetHealth,
  handleReAuth,
  handleSetupAuth,
  type AuthSetupArgs,
} from "./handlers/auth.js";
import type { HandlerDeps } from "./handlers/context.js";
import { handleExportCitations, handleExportResearchDossier } from "./handlers/export.js";
import {
  handleAddNotebook,
  handleGetLibraryStats,
  handleGetNotebook,
  handleListNotebooks,
  handleRemoveNotebook,
  handleSearchNotebooks,
  handleSelectNotebook,
  handleUpdateNotebook,
} from "./handlers/notebooks.js";
import { handleCloseSession, handleListSessions, handleResetSession } from "./handlers/sessions.js";
import {
  handleAddSource,
  handleAddSourcesBatch,
  handleDownloadAudio,
  handleGenerateAudio,
  handleGetAudioStatus,
  handleListSources,
} from "./handlers/sources.js";

export {
  formatCitationsReport,
  formatResearchDossier,
  type DossierTurn,
  type FormatDossierInput,
} from "./handlers/export.js";

/**
 * MCP Tool Handlers facade preserving backwards-compatible method signatures.
 */
export class ToolHandlers {
  private readonly deps: HandlerDeps;

  constructor(sessionManager: SessionManager, authManager: AuthManager, library: NotebookLibrary) {
    this.deps = { sessionManager, authManager, library };
  }

  handleAskQuestion(args: AskQuestionArgs, sendProgress?: ProgressCallback) {
    return handleAskQuestion(this.deps, args, sendProgress);
  }

  handleListSessions() {
    return handleListSessions(this.deps);
  }

  handleCloseSession(args: Parameters<typeof handleCloseSession>[1]) {
    return handleCloseSession(this.deps, args);
  }

  handleResetSession(args: Parameters<typeof handleResetSession>[1]) {
    return handleResetSession(this.deps, args);
  }

  handleGetHealth() {
    return handleGetHealth(this.deps);
  }

  handleSetupAuth(args: AuthSetupArgs, sendProgress?: ProgressCallback) {
    return handleSetupAuth(this.deps, args, sendProgress);
  }

  handleReAuth(args: AuthSetupArgs, sendProgress?: ProgressCallback) {
    return handleReAuth(this.deps, args, sendProgress);
  }

  handleAddNotebook(args: Parameters<typeof handleAddNotebook>[1]) {
    return handleAddNotebook(this.deps, args);
  }

  handleListNotebooks() {
    return handleListNotebooks(this.deps);
  }

  handleGetNotebook(args: Parameters<typeof handleGetNotebook>[1]) {
    return handleGetNotebook(this.deps, args);
  }

  handleSelectNotebook(args: Parameters<typeof handleSelectNotebook>[1]) {
    return handleSelectNotebook(this.deps, args);
  }

  handleUpdateNotebook(args: Parameters<typeof handleUpdateNotebook>[1]) {
    return handleUpdateNotebook(this.deps, args);
  }

  handleRemoveNotebook(args: Parameters<typeof handleRemoveNotebook>[1]) {
    return handleRemoveNotebook(this.deps, args);
  }

  handleSearchNotebooks(args: Parameters<typeof handleSearchNotebooks>[1]) {
    return handleSearchNotebooks(this.deps, args);
  }

  handleGetLibraryStats() {
    return handleGetLibraryStats(this.deps);
  }

  handleCleanupData(args: Parameters<typeof handleCleanupData>[0]) {
    return handleCleanupData(args);
  }

  handleAddSource(args: Parameters<typeof handleAddSource>[1]) {
    return handleAddSource(this.deps, args);
  }

  handleAddSourcesBatch(args: Parameters<typeof handleAddSourcesBatch>[1]) {
    return handleAddSourcesBatch(this.deps, args);
  }

  handleListSources(args: Parameters<typeof handleListSources>[1]) {
    return handleListSources(this.deps, args);
  }

  handleFindContradictions(args: Parameters<typeof handleFindContradictions>[1]) {
    return handleFindContradictions(this.deps, args);
  }

  handleIdentifyKnowledgeGaps(args: Parameters<typeof handleIdentifyKnowledgeGaps>[1]) {
    return handleIdentifyKnowledgeGaps(this.deps, args);
  }

  handleExportResearchDossier(args: Parameters<typeof handleExportResearchDossier>[1]) {
    return handleExportResearchDossier(this.deps, args);
  }

  handleExportCitations(args: Parameters<typeof handleExportCitations>[1]) {
    return handleExportCitations(this.deps, args);
  }

  handleGenerateAudio(args: Parameters<typeof handleGenerateAudio>[1]) {
    return handleGenerateAudio(this.deps, args);
  }

  handleGetAudioStatus(args: Parameters<typeof handleGetAudioStatus>[1]) {
    return handleGetAudioStatus(this.deps, args);
  }

  handleDownloadAudio(args: Parameters<typeof handleDownloadAudio>[1]) {
    return handleDownloadAudio(this.deps, args);
  }

  async cleanup(): Promise<void> {
    log.info(`🧹 Cleaning up tool handlers...`);
    await this.deps.sessionManager.closeAllSessions();
    log.success(`✅ Tool handlers cleanup complete`);
  }
}
