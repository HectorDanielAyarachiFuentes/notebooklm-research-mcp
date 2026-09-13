# 🔬 Regla de Investigación con NotebookLM MCP

Esta regla guía al asistente de **Google Antigravity IDE** para aprovechar la suite avanzada de investigación con Google NotebookLM.

## 🎯 Cuándo Activar
Activa este flujo cuando el usuario solicite:
- Investigar un tema en profundidad basado en fuentes ("investiga sobre...", "analiza estos papers", "haz tu magia").
- Contrastar documentos buscando discrepancias o posturas contrarias.
- Ingerir fuentes (enlaces web, videos de YouTube, PDFs o documentos locales).
- Generar un informe estructurado o dossier en Markdown para Obsidian/Notion.
- Generar citas bibliográficas en BibTeX o APA.
- Generar o descargar podcasts de Audio Overview de NotebookLM.

---

## 🛠️ Protocolo de Herramientas

### 1. Comprobación de Sesión
Antes de iniciar consultas, verifica el estado del servidor:
- Usa `get_health`. Si `authenticated: false`, indica al usuario que ejecute `setup_auth` (o utilice la extensión Chrome para importar cookies).

### 2. Ingesta de Fuentes
- Para archivos locales (PDFs de papers, libros, notas `.md`):
  ```json
  { "type": "file", "path": "C:/ruta/al/documento.pdf" }
  ```
- Para conferencias o entrevistas:
  ```json
  { "type": "youtube", "content": "https://www.youtube.com/watch?v=..." }
  ```
- Para múltiples fuentes simultáneas:
  Usa `add_sources_batch` pasando la lista completa de fuentes para ahorrar tiempo.

### 3. Investigación Crítica y Profunda
- Mantén siempre el `session_id` retornado entre preguntas consecutivas para aprovechar el contexto incremental.
- Usa `find_contradictions` para detectar puntos donde los autores o documentos difieren en datos, metodologías o conclusiones.
- Usa `identify_knowledge_gaps` para evaluar vacíos temáticos y proponer los siguientes pasos de investigación.

### 4. Entregables y Cierre
- Cuando la investigación esté completa, invoca `export_research_dossier` para generar un archivo Markdown (`.md`) estructurado con índice, resumen ejecutivo, preguntas, respuestas y citas.
- Invoca `export_citations` para entregar la bibliografía formal en BibTeX o APA.
