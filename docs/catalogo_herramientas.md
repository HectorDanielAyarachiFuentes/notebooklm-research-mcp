# 🛠️ Catálogo de Herramientas: NotebookLM MCP Research Suite

Este catálogo describe las herramientas disponibles en el servidor MCP para su uso interactivo o mediante agentes de **Google Antigravity IDE**.

---

## 📚 1. Gestión de Cuadernos y Biblioteca

| Herramienta | Descripción | Parámetros Clave |
| :--- | :--- | :--- |
| `list_notebooks` | Lista todos los cuadernos registrados en tu biblioteca local con metadatos. | Ninguno |
| `get_notebook` | Obtiene los detalles y metadatos de un cuaderno específico. | `notebook_id` |
| `add_notebook` | Registra una URL de NotebookLM en tu biblioteca local. | `url`, `name`, `description`, `topics` |
| `select_notebook` | Selecciona un cuaderno como predeterminado para las siguientes consultas. | `notebook_id` |
| `update_notebook` | Actualiza metadatos de un cuaderno existente. | `id`, `name`, `description`, `topics` |
| `remove_notebook` | Elimina un cuaderno de la biblioteca local (no borra en Google). | `id` |
| `search_notebooks` | Búsqueda por texto libre en nombres y temas de cuadernos. | `query` |
| `get_library_stats` | Estadísticas agregadas de cuadernos y uso. | Ninguno |

---

## 📥 2. Ingesta de Fuentes (Multiformato y Lote)

| Herramienta | Descripción | Parámetros Clave |
| :--- | :--- | :--- |
| `add_source` | Ingesta una fuente individual. Soporta: `file` (PDFs, Markdown, TXT), `youtube` (enlaces de video), `url` (páginas web) y `text` (texto pegado). | `type`, `content`, `path`, `title` |
| `add_sources_batch` | Ingesta múltiples fuentes simultáneamente en una sola llamada dentro de la misma sesión activa. | `sources: [{ type, content, path, title }]` |
| `list_sources` | Ennumera todos los títulos de fuentes actualmente indexados en la barra lateral del cuaderno. | `session_id`, `notebook_id` |

---

## 💬 3. Consulta y Conversación RAG

| Herramienta | Descripción | Parámetros Clave |
| :--- | :--- | :--- |
| `ask_question` | Consulta conversacional fundamentada en las fuentes del cuaderno con Gemini. Devuelve `session_id` para continuar el hilo. | `question`, `session_id`, `notebook_id` |
| `list_sessions` | Lista las sesiones activas en el navegador. | Ninguno |
| `reset_session` | Limpia el historial del chat manteniendo el mismo `session_id`. | `session_id` |
| `close_session` | Cierra la pestaña del navegador y libera memoria. | `session_id` |

---

## 🔬 4. Análisis Crítico para Investigadores

| Herramienta | Descripción | Parámetros Clave |
| :--- | :--- | :--- |
| `find_contradictions` | Cruza todos los documentos del cuaderno para identificar discrepancias empíricas, contradicciones de datos y posturas opuestas con citas exactas. | `focus_topic`, `session_id` |
| `identify_knowledge_gaps` | Evalúa las fuentes contra un objetivo de investigación para descubrir vacíos de información y preguntas pendientes. | `research_goal`, `session_id` |

---

## 📄 5. Exportación y Entregables

| Herramienta | Descripción | Parámetros Clave |
| :--- | :--- | :--- |
| `export_research_dossier` | Exporta todo el historial de la sesión (preguntas, respuestas, citas y fuentes) a un archivo `.md` estructurado para Obsidian o Notion. | `destination_path`, `title`, `executive_summary` |
| `export_citations` | Extrae las fuentes del cuaderno y las formatea en estándares académicos **BibTeX** y **APA 7ma edición**. | `format` (`both`, `bibtex`, `apa`), `destination_path` |

---

## 🎙️ 6. Audio Overviews (Podcasts)

| Herramienta | Descripción | Parámetros Clave |
| :--- | :--- | :--- |
| `generate_audio` | Dispara la generación del podcast de audio de 2 locutores (asíncrono por defecto). | `custom_prompt`, `wait_for_completion` |
| `get_audio_status` | Consulta no bloqueante del estado de renderizado (`started`, `in_progress`, `ready`). | `session_id` |
| `download_audio` | Descarga el archivo de audio `.m4a` a una carpeta local cuando el estado es `ready`. | `destination_dir` |

---

## ⚙️ 7. Sistema y Autenticación

| Herramienta | Descripción | Parámetros Clave |
| :--- | :--- | :--- |
| `get_health` | Estado del servidor, autenticación y configuración. | Ninguno |
| `setup_auth` | Abre ventana de navegador para inicio de sesión en Google. | Ninguno |
| `re_auth` | Rota o repara la sesión activa de Google. | Ninguno |
| `cleanup_data` | Limpieza profunda de perfiles temporales o cookies dañadas. | `confirm: true` |
