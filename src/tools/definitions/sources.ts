/**
 * MCP tool definitions for source ingestion + Audio Overview (issues #25, #11).
 *
 * The cross-tool async-audio chain (generate → poll → download) is documented
 * in the server-level `instructions` string (see src/index.ts) so individual
 * descriptions stay focused on one operation each.
 */

import type { Tool } from "@modelcontextprotocol/sdk/types.js";

const sharedNotebookTargeting = {
  session_id: {
    type: "string",
    description:
      "Reuse an existing browser session by id. Recommended when you have " +
      "already called `ask_question` against the same notebook — saves the " +
      "10–15 s page-load time. Obtain from `list_sessions` or any prior " +
      "`ask_question` response (`result.session_id`).",
  },
  notebook_id: {
    type: "string",
    description:
      "Library notebook id (from `list_notebooks` / `search_notebooks`). " +
      "Defaults to the active notebook (see `select_notebook`) when omitted.",
  },
  notebook_url: {
    type: "string",
    description:
      "Direct NotebookLM URL — overrides `notebook_id`. Use for ad-hoc " +
      "notebooks not yet in your library. Format: " +
      "`https://notebooklm.google.com/notebook/<uuid>`.",
  },
};

export const addSourceTool: Tool = {
  name: "add_source",
  description:
    "Ingest a source into a NotebookLM notebook. Supports four source types:\n" +
    "  • `file` — local document (PDF, TXT, MD, CSV, etc.). Automatically extracts clean text.\n" +
    "  • `url` — website URL crawled and indexed by NotebookLM\n" +
    "  • `youtube` — YouTube video URL indexed for transcripts\n" +
    "  • `text` — paste raw text verbatim as a copied document\n\n" +
    "Returns `sourceCountBefore`/`sourceCountAfter` to verify insertion. " +
    "NotebookLM finishes indexing within 5–30 seconds, after which subsequent queries have the content in context.",
  inputSchema: {
    type: "object",
    properties: {
      type: {
        type: "string",
        enum: ["file", "url", "youtube", "text"],
        description:
          "`file` extracts text from local files (PDF/MD/TXT); `url` crawls website; `youtube` indexes video transcript; `text` ingests raw content.",
      },
      content: {
        type: "string",
        description:
          "The content payload: URL for `url`/`youtube`, text for `text`, or file path for `file` (can also use `path` parameter).",
      },
      path: {
        type: "string",
        description: "Local file path when `type === 'file'` (e.g. 'C:/papers/study.pdf'). Overrides `content` if provided.",
      },
      title: {
        type: "string",
        description:
          "Display title shown in the source list. Optional — NotebookLM " +
          "or file extractor picks a sensible default (filename or page title).",
      },
      show_browser: {
        type: "boolean",
        description: "Show the browser window for debugging. Default: false.",
      },
      ...sharedNotebookTargeting,
    },
    required: ["type"],
  },
  annotations: {
    title: "Add source to notebook",
    readOnlyHint: false,
    destructiveHint: false,
    idempotentHint: false,
    openWorldHint: true,
  },
};

export const generateAudioTool: Tool = {
  name: "generate_audio",
  description:
    "Trigger podcast-style Audio Overview generation for a notebook.\n\n" +
    "**Async by default** — returns immediately with one of:\n" +
    "  • `status: \"started\"` — generation just kicked off\n" +
    "  • `status: \"in_progress\"` — a generation was already running; " +
    "this call attached to it\n" +
    "  • `status: \"ready\"` (with `alreadyExisted: true`) — an Audio " +
    "Overview already existed; nothing was triggered\n\n" +
    "Generation typically takes 2–10 minutes. **Workflow:**\n" +
    "  1. `generate_audio` → returns immediately\n" +
    "  2. Poll `get_audio_status` every ~30 s\n" +
    "  3. When status is `ready`, call `download_audio`\n\n" +
    "Pass `wait_for_completion: true` for legacy synchronous behaviour " +
    "(blocks for up to `timeout_ms`). Audio Overview is the only Studio " +
    "output exposed in v2.0 (Video / Mindmap / Quiz / Infographic / " +
    "Datatable / Presentation are NotebookLM features but not yet wrapped).",
  inputSchema: {
    type: "object",
    properties: {
      custom_prompt: {
        type: "string",
        description:
          "Optional focus prompt for the Audio Overview, e.g. \"Focus on the " +
          "API authentication flow and skip pricing\". Passed into the " +
          "NotebookLM \"Customize\" sub-dialog before generation starts.",
      },
      wait_for_completion: {
        type: "boolean",
        description:
          "If true, block until the audio tile is ready (up to `timeout_ms`). " +
          "Default false — return immediately and let the caller poll " +
          "`get_audio_status`.",
      },
      timeout_ms: {
        type: "number",
        description:
          "Only relevant when `wait_for_completion=true`. Maximum wait for " +
          "the audio tile to appear. Default 600 000 (10 min).",
      },
      show_browser: {
        type: "boolean",
        description: "Show the browser window for debugging. Default: false.",
      },
      ...sharedNotebookTargeting,
    },
  },
  annotations: {
    title: "Generate Audio Overview",
    readOnlyHint: false,
    destructiveHint: false,
    idempotentHint: true, // Idempotent: existing audio is detected and returned as ready
    openWorldHint: true,
  },
};

export const getAudioStatusTool: Tool = {
  name: "get_audio_status",
  description:
    "Non-blocking probe for the current Audio Overview state of a notebook.\n\n" +
    "Returned `status` values:\n" +
    "  • `ready` — Audio Overview is generated and ready to download\n" +
    "  • `in_progress` — generation is currently running\n" +
    "  • `not_started` — no Audio Overview exists yet for this notebook\n\n" +
    "Safe to poll every ~30 s while waiting for `generate_audio` to finish. " +
    "When status flips to `ready`, call `download_audio` with a destination " +
    "directory.",
  inputSchema: {
    type: "object",
    properties: {
      show_browser: {
        type: "boolean",
        description: "Show the browser window for debugging. Default: false.",
      },
      ...sharedNotebookTargeting,
    },
  },
  annotations: {
    title: "Get Audio Overview status",
    readOnlyHint: true,
    openWorldHint: true,
  },
};

export const downloadAudioTool: Tool = {
  name: "download_audio",
  description:
    "Save the completed Audio Overview to disk as a `.m4a` file. **Pre-" +
    "condition:** `get_audio_status` must report `status: \"ready\"`. " +
    "Calling this before generation completes returns an error message " +
    "explaining what to do.\n\n" +
    "The file lands in `destination_dir` with NotebookLM's suggested " +
    "filename (sanitised — usually the audio's title with underscores). " +
    "The full saved path is returned in `result.filePath`.",
  inputSchema: {
    type: "object",
    properties: {
      destination_dir: {
        type: "string",
        description:
          "Absolute directory path where the file is saved (created if " +
          "missing). Example: `/Users/jane/Downloads/notebooklm` or " +
          "`/tmp/audio`. Relative paths are NOT recommended — the server " +
          "may run from a different working directory than the caller.",
      },
      show_browser: {
        type: "boolean",
        description: "Show the browser window for debugging. Default: false.",
      },
      ...sharedNotebookTargeting,
    },
    required: ["destination_dir"],
  },
  annotations: {
    title: "Download Audio Overview",
    readOnlyHint: false,
    destructiveHint: false,
    idempotentHint: true,
    openWorldHint: true,
  },
};

export const addSourcesBatchTool: Tool = {
  name: "add_sources_batch",
  description:
    "Ingest multiple sources in a single batch call into a NotebookLM notebook. " +
    "Supports URLs, YouTube videos, local files (PDF/TXT/MD), or raw texts. " +
    "Processes each item sequentially inside the active session to save setup time.",
  inputSchema: {
    type: "object",
    properties: {
      sources: {
        type: "array",
        description: "List of sources to ingest.",
        items: {
          type: "object",
          properties: {
            type: {
              type: "string",
              enum: ["file", "url", "youtube", "text"],
              description: "Source type.",
            },
            content: {
              type: "string",
              description: "URL, text content, or local file path.",
            },
            path: {
              type: "string",
              description: "Optional explicit path if type === 'file'.",
            },
            title: {
              type: "string",
              description: "Optional display title for the source.",
            },
          },
          required: ["type"],
        },
      },
      show_browser: {
        type: "boolean",
        description: "Show the browser window for debugging. Default: false.",
      },
      ...sharedNotebookTargeting,
    },
    required: ["sources"],
  },
  annotations: {
    title: "Batch add sources to notebook",
    readOnlyHint: false,
    destructiveHint: false,
    idempotentHint: false,
    openWorldHint: true,
  },
};

export const listSourcesTool: Tool = {
  name: "list_sources",
  description: "List all source titles currently indexed and present in the active NotebookLM notebook sidebar.",
  inputSchema: {
    type: "object",
    properties: {
      show_browser: {
        type: "boolean",
        description: "Show the browser window for debugging. Default: false.",
      },
      ...sharedNotebookTargeting,
    },
  },
  annotations: {
    title: "List notebook sources",
    readOnlyHint: true,
    destructiveHint: false,
    idempotentHint: true,
    openWorldHint: false,
  },
};

export const sourceTools: Tool[] = [
  addSourceTool,
  addSourcesBatchTool,
  listSourcesTool,
  generateAudioTool,
  getAudioStatusTool,
  downloadAudioTool,
];
