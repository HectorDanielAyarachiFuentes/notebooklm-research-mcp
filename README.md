# 🚀 NotebookLM Antigravity AI Research Suite

[![TypeScript](https://img.shields.io/badge/TypeScript-5.x-blue.svg)](https://www.typescriptlang.org/)
[![MCP](https://img.shields.io/badge/MCP-Protocol-green.svg)](https://modelcontextprotocol.io/)
[![Google Antigravity](https://img.shields.io/badge/Google-Antigravity%20IDE-orange.svg)](https://antigravity.google)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](./LICENSE)

Integración completa entre **Google NotebookLM** y **Google Antigravity IDE** mediante el protocolo **MCP (Model Context Protocol)**. Convierte tus cuadernos de NotebookLM en una estación de investigación profunda para agentes de IA: ingesta de PDFs locales y videos de YouTube, detección de contradicciones entre fuentes, análisis de vacíos de conocimiento, generación de podcasts de audio y exportación de dossiers completos en Markdown con bibliografía en BibTeX y APA.

---

## 📁 Estructura del Proyecto

```text
notebooklm-mcp/
├── .agents/                      # Configuración nativa para Google Antigravity IDE
│   ├── mcp_config.json           # Registro automático del servidor MCP
│   ├── rules/
│   │   └── notebooklm.md         # Regla maestra de comportamiento para el agente
│   └── skills/
│       └── using-notebooklm-mcp/
│           └── SKILL.md          # Skill paso a paso para tareas de investigación
├── chrome_extension/             # Extensión de Chrome para sincronizar sesión en 1 clic
│   ├── manifest.json
│   ├── popup.html
│   └── popup.js
├── docs/                         # Documentación completa y guías
│   ├── guia_instalacion.md       # Instalación, prerrequisitos y conexión
│   ├── catalogo_herramientas.md  # Referencia de las 26 herramientas MCP
│   ├── solucion_problemas.md     # Resolución de errores comunes
│   └── tutoriales/               # Material de referencia, capturas y transcripciones
│       ├── Ejemplo-cookie.jpeg
│       ├── Tutorial.txt
│       └── VIdeo.txt
├── scripts/                      # Scripts de utilidad y validación
│   └── auth_helper.py            # Helper en Python para importar y verificar cookies
├── src/                          # Código fuente TypeScript del servidor MCP
│   ├── auth/                     # Gestión de perfiles y sesiones de Google
│   ├── browser/                  # Watchdog y prevención de procesos huérfanos
│   ├── library/                  # Biblioteca local de cuadernos
│   ├── notebooklm/               # Selectores, extracción RAG y streaming
│   ├── session/                  # Gestor de sesiones paralelas y memoria
│   ├── tools/                    # Definiciones y manejadores de herramientas MCP
│   └── utils/                    # Extractor de PDFs/texto, logger y limpieza
├── dist/                         # Servidor compilado listo para ejecutar
├── package.json
└── tsconfig.json
```

---

## ⚡ Inicio Rápido (3 Pasos)

### 1. Compilar el Servidor MCP
En la terminal de este proyecto ejecuta:
```powershell
npm install
npm run build
```

### 2. Conectar tu Cuenta de Google (Elige un método)
* **Opción A (Extensión de Chrome en 1 Clic - Recomendada):**
  1. Ve a `chrome://extensions` en Chrome y activa el **Modo de desarrollador**.
  2. Haz clic en **Cargar descomprimida** y selecciona la carpeta [`chrome_extension`](file:///c:/Users/Ramoncito/Downloads/notebooklm-mcp-main/chrome_extension) de este proyecto.
  3. Entra a [NotebookLM](https://notebooklm.google.com) y haz 1 clic en el icono **`N`** para copiar tus credenciales.
  4. En Antigravity dile al asistente: *"Conéctate a NotebookLM"* o ejecuta `python scripts/auth_helper.py --auto`.
* **Opción B (Login Asistido):**
  Llama a la herramienta `setup_auth` desde Antigravity para abrir una ventana de navegador donde iniciar sesión directamente.

### 3. ¡A Investigar!
El archivo [`.agents/mcp_config.json`](file:///c:/Users/Ramoncito/Downloads/notebooklm-mcp-main/.agents/mcp_config.json) ya registra este servidor en tu espacio de trabajo de Antigravity. Simplemente pídele al agente en lenguaje natural:
> *"Investiga sobre este tema en NotebookLM, sube estos papers y compárame las fuentes buscando contradicciones."*

---

## 🔬 Capacidades de Investigación Destacadas

| Capacidad | Herramienta | Qué Hace |
| :--- | :--- | :--- |
| **Ingesta de PDFs y Archivos** | `add_source` | Lee archivos locales (`.pdf`, `.md`, `.txt`, `.csv`) extrayendo el texto automáticamente. |
| **Ingesta de YouTube** | `add_source` | Ingesta enlaces de videos de YouTube indexando sus subtítulos oficiales. |
| **Carga en Lote** | `add_sources_batch` | Carga múltiples enlaces, videos y documentos simultáneamente sin demoras manuales. |
| **Detección de Contradicciones** | `find_contradictions` | Cruza las fuentes para hallar discrepancias de datos o posturas opuestas con citas exactas. |
| **Análisis de Vacíos (Gaps)** | `identify_knowledge_gaps` | Identifica qué preguntas clave aún no están respondidas por las fuentes y qué buscar después. |
| **Exportación de Dossier** | `export_research_dossier` | Genera un archivo Markdown (`.md`) estructurado con todas las preguntas, respuestas y citas. |
| **Citas Académicas** | `export_citations` | Genera bibliografía formateada en estándares **BibTeX** y **APA 7ma edición**. |
| **Podcasts de Audio** | `generate_audio` | Dispara y descarga los "Deep Dive Audio Overviews" (conversación de 2 locutores). |

---

## 📖 Documentación Adicional

* 📘 [Guía de Instalación y Primeros Pasos](file:///c:/Users/Ramoncito/Downloads/notebooklm-mcp-main/docs/guia_instalacion.md)
* 🛠️ [Catálogo de las 26 Herramientas MCP](file:///c:/Users/Ramoncito/Downloads/notebooklm-mcp-main/docs/catalogo_herramientas.md)
* 🔧 [Solución de Problemas Frecuentes](file:///c:/Users/Ramoncito/Downloads/notebooklm-mcp-main/docs/solucion_problemas.md)
* 🎓 [Tutoriales y Material de Referencia](file:///c:/Users/Ramoncito/Downloads/notebooklm-mcp-main/docs/tutoriales)
