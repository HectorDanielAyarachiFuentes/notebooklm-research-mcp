import type { Tool } from "@modelcontextprotocol/sdk/types.js";

const sharedNotebookTargeting = {
  session_id: {
    type: "string",
    description:
      "Reuse an existing browser session by id. Recommended to preserve conversation context and avoid page reload time.",
  },
  notebook_id: {
    type: "string",
    description:
      "Library notebook id (from `list_notebooks` / `search_notebooks`). Defaults to active notebook if omitted.",
  },
  notebook_url: {
    type: "string",
    description:
      "Direct NotebookLM URL (overrides `notebook_id`). Format: https://notebooklm.google.com/notebook/<uuid>.",
  },
};

export const findContradictionsTool: Tool = {
  name: "find_contradictions",
  description:
    "Performs deep cross-source analysis across all documents in the notebook to identify " +
    "contradictions, conflicting empirical data, diverging methodologies, and opposing viewpoints between sources. " +
    "Returns grounded comparisons with specific citations to each source.",
  inputSchema: {
    type: "object",
    properties: {
      focus_topic: {
        type: "string",
        description: "Optional specific topic, hypothesis, or metric to examine for conflicting claims. If omitted, checks the entire source corpus.",
      },
      show_browser: {
        type: "boolean",
        description: "Show the browser window for debugging. Default: false.",
      },
      ...sharedNotebookTargeting,
    },
  },
  annotations: {
    title: "Find Contradictions Across Sources",
    readOnlyHint: true,
    destructiveHint: false,
    idempotentHint: false,
    openWorldHint: true,
  },
};

export const identifyKnowledgeGapsTool: Tool = {
  name: "identify_knowledge_gaps",
  description:
    "Analyzes the current notebook sources against a research goal to discover blind spots, " +
    "unanswered questions, missing data, and unrepresented perspectives. " +
    "Returns a critical gap analysis and concrete recommendations on what papers or sources to ingest next.",
  inputSchema: {
    type: "object",
    properties: {
      research_goal: {
        type: "string",
        description: "The overarching research goal or question (e.g. 'Evaluating the safety and efficacy of compound X for condition Y').",
      },
      show_browser: {
        type: "boolean",
        description: "Show the browser window for debugging. Default: false.",
      },
      ...sharedNotebookTargeting,
    },
  },
  annotations: {
    title: "Identify Knowledge Gaps",
    readOnlyHint: true,
    destructiveHint: false,
    idempotentHint: false,
    openWorldHint: true,
  },
};

export const researchTools: Tool[] = [
  findContradictionsTool,
  identifyKnowledgeGapsTool,
];
