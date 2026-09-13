---
name: using-notebooklm-mcp
description: Execute rigorous academic, technical, and scientific research using the NotebookLM MCP server. Ingest local PDFs, YouTube videos, and web sources, discover contradictions and knowledge gaps, generate Audio Overviews, and export comprehensive Markdown dossiers with BibTeX/APA citations.
---

# NotebookLM MCP Research Skill

Esta skill enseña el flujo completo de investigación utilizando el servidor MCP vitaminado de NotebookLM.

## 🚀 Flujo de Trabajo Paso a Paso

### Paso 1: Inicialización y Conexión
1. Llama a `get_health` para comprobar conectividad y autenticación.
2. Si `authenticated === false`:
   - Solicita al usuario autenticarse mediante `setup_auth` o importando sus cookies con la extensión de Chrome.
3. Lista los cuadernos con `list_notebooks` o selecciona el cuaderno activo con `select_notebook`.

### Paso 2: Ingesta de Fuentes (Carga Bibliográfica)
Para alimentar el cuaderno de investigación:
- **Archivos locales (PDFs, Markdown, Código, TXT)**:
  Llama a `add_source` con `type: "file"`, `path: "C:/mis_documentos/paper.pdf"`.
- **Videos de conferencias / YouTube**:
  Llama a `add_source` con `type: "youtube"`, `content: "https://www.youtube.com/watch?v=..."`.
- **Ingesta en Lote**:
  Llama a `add_sources_batch` pasando la lista de fuentes en `sources`:
  ```json
  {
    "sources": [
      { "type": "file", "path": "C:/papers/paper1.pdf" },
      { "type": "youtube", "content": "https://youtu.be/xyz" },
      { "type": "url", "content": "https://arxiv.org/html/..." }
    ]
  }
  ```
- Verifica las fuentes cargadas con `list_sources`.

### Paso 3: Investigación Interactiva y Rigurosa
- Usa `ask_question` para formular preguntas clave.
- **IMPORTANTE:** Guarda el `session_id` que devuelve cada respuesta y pásalo en las preguntas siguientes para mantener el hilo contextual y RAG continuo.

### Paso 4: Análisis Crítico Avanzado
- **Contradicciones**: Invoca `find_contradictions` para comparar afirmaciones entre autores o fuentes y detectar discrepancias en números o conclusiones.
- **Vacíos de Información**: Invoca `identify_knowledge_gaps` para evaluar qué preguntas o datos críticos aún faltan en el corpus de estudio.

### Paso 5: Generación de Entregables
- **Dossier Markdown**:
  Llama a `export_research_dossier` con `destination_path` para exportar el reporte completo con índice, preguntas, respuestas y citas a un archivo `.md`.
- **Bibliografía**:
  Llama a `export_citations` para generar la lista de referencias en BibTeX (para LaTeX) o formato APA (para informes).
- **Podcast de Audio**:
  Si el usuario lo solicita, llama a `generate_audio` (asíncrono), monitorea con `get_audio_status` hasta `status: "ready"`, y descarga con `download_audio`.
