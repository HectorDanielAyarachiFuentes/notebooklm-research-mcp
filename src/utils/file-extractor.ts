import fs from "fs";
import path from "path";
import { PDFParse } from "pdf-parse";
import { log } from "./logger.js";

export interface ExtractedFile {
  text: string;
  title: string;
  extension: string;
  sizeBytes: number;
}

const SUPPORTED_TEXT_EXTENSIONS = new Set([
  ".txt",
  ".md",
  ".markdown",
  ".rst",
  ".csv",
  ".tsv",
  ".json",
  ".xml",
  ".html",
  ".htm",
  ".log",
  ".js",
  ".jsx",
  ".ts",
  ".tsx",
  ".py",
  ".java",
  ".c",
  ".cpp",
  ".h",
  ".cs",
  ".go",
  ".rs",
  ".sql",
  ".sh",
  ".bat",
  ".yaml",
  ".yml",
]);

/**
 * Extracts clean text content from a local file (PDF or text/code formats)
 * ready for ingestion into NotebookLM.
 */
export async function extractLocalFile(filePath: string, customTitle?: string): Promise<ExtractedFile> {
  const resolvedPath = path.resolve(filePath);

  if (!fs.existsSync(resolvedPath)) {
    throw new Error(`File not found: "${resolvedPath}". Please provide a valid absolute or relative path.`);
  }

  const stat = await fs.promises.stat(resolvedPath);
  if (stat.isDirectory()) {
    throw new Error(`Path is a directory, not a file: "${resolvedPath}".`);
  }

  const ext = path.extname(resolvedPath).toLowerCase();
  const defaultTitle = customTitle?.trim() || path.basename(resolvedPath);

  log.info(`📂 [file-extractor] Reading "${resolvedPath}" (${ext}, ${stat.size} bytes)`);

  if (ext === ".pdf") {
    try {
      const buffer = await fs.promises.readFile(resolvedPath);
      const parser = new PDFParse({ data: buffer });
      const textResult = await parser.getText();
      await parser.destroy();

      const text = typeof textResult === "string" ? textResult : (textResult as any)?.text || "";
      if (!text.trim()) {
        throw new Error(`PDF file "${defaultTitle}" appears to be empty or contains only scanned images (no selectable text).`);
      }

      log.success(`✅ [file-extractor] Successfully extracted ${text.length} characters from PDF "${defaultTitle}"`);
      return {
        text,
        title: defaultTitle,
        extension: ext,
        sizeBytes: stat.size,
      };
    } catch (err) {
      const msg = err instanceof Error ? err.message : String(err);
      throw new Error(`Failed to extract text from PDF "${defaultTitle}": ${msg}`);
    }
  }

  if (SUPPORTED_TEXT_EXTENSIONS.has(ext) || ext === "") {
    try {
      const text = await fs.promises.readFile(resolvedPath, "utf-8");
      if (!text.trim()) {
        throw new Error(`File "${defaultTitle}" is empty.`);
      }

      log.success(`✅ [file-extractor] Read ${text.length} characters from text file "${defaultTitle}"`);
      return {
        text,
        title: defaultTitle,
        extension: ext,
        sizeBytes: stat.size,
      };
    } catch (err) {
      const msg = err instanceof Error ? err.message : String(err);
      throw new Error(`Failed to read file "${defaultTitle}": ${msg}`);
    }
  }

  // Fallback: attempt utf-8 read
  try {
    const text = await fs.promises.readFile(resolvedPath, "utf-8");
    return {
      text,
      title: defaultTitle,
      extension: ext,
      sizeBytes: stat.size,
    };
  } catch {
    throw new Error(
      `Unsupported file type "${ext}" for "${defaultTitle}". Supported formats include PDF, TXT, MD, CSV, JSON, code files.`
    );
  }
}
