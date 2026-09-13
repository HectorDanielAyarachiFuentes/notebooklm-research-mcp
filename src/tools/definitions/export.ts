import type { Tool } from "@modelcontextprotocol/sdk/types.js";

const sharedNotebookTargeting = {
  session_id: {
    type: "string",
    description: "Session ID containing research conversation history to export.",
  },
  notebook_id: {
    type: "string",
    description: "Library notebook id.",
  },
  notebook_url: {
    type: "string",
    description: "Direct NotebookLM URL.",
  },
};

export const exportResearchDossierTool: Tool = {
  name: "export_research_dossier",
  description:
    "Exports all questions, answers, source citations, and analytical findings from the current research session " +
    "into a polished, structured Markdown dossier file (.md) ready for Obsidian, Notion, or academic publishing. " +
    "Includes table of contents, executive summary, chronologically ordered research turns, and indexed citations.",
  inputSchema: {
    type: "object",
    properties: {
      destination_path: {
        type: "string",
        description:
          "Target file path on disk (e.g. './research-report.md' or 'C:/Notes/Quantum_Computing.md'). " +
          "If omitted, creates a file named 'research-dossier-[timestamp].md' in the current workspace.",
      },
      title: {
        type: "string",
        description: "Document title header for the dossier (e.g. 'State of the Art: LLM Reasoning Architectures').",
      },
      executive_summary: {
        type: "string",
        description: "Optional introductory summary or synthesis to prepend to the dossier.",
      },
      include_citations: {
        type: "boolean",
        description: "Include granular citations and source references in the exported file. Default: true.",
      },
      ...sharedNotebookTargeting,
    },
  },
  annotations: {
    title: "Export Research Dossier to Markdown",
    readOnlyHint: false,
    destructiveHint: false,
    idempotentHint: true,
    openWorldHint: true,
  },
};

export const exportCitationsTool: Tool = {
  name: "export_citations",
  description:
    "Extracts all indexed sources and cited documents in the notebook and formats them into standard " +
    "academic reference formats (BibTeX for LaTeX and APA 7th edition for reports). " +
    "Can return the text directly or save it to a .bib / .txt file on disk.",
  inputSchema: {
    type: "object",
    properties: {
      format: {
        type: "string",
        enum: ["both", "bibtex", "apa"],
        description: "Citation format to generate. Default: 'both'.",
      },
      destination_path: {
        type: "string",
        description: "Optional file path to save the generated citations (e.g. './references.bib').",
      },
      ...sharedNotebookTargeting,
    },
  },
  annotations: {
    title: "Export Citations (BibTeX & APA)",
    readOnlyHint: false,
    destructiveHint: false,
    idempotentHint: true,
    openWorldHint: true,
  },
};

export const exportTools: Tool[] = [
  exportResearchDossierTool,
  exportCitationsTool,
];
