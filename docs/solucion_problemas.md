# 🔧 Solución de Problemas Frecuentes

Esta guía recopila las dudas, bloqueos y soluciones habituales para NotebookLM MCP.

---

### 1. "Authentication expired" o Sesión Caída
* **Causa:** Las cookies de sesión de Google caducan periódicamente por seguridad.
* **Solución rápida:**
  1. En [NotebookLM](https://notebooklm.google.com), haz 1 clic en el icono de la extensión **`N`** (NotebookLM Sync).
  2. En el chat de Antigravity dile: *"Conéctate"* o ejecuta en tu terminal:
     ```powershell
     python scripts/auth_helper.py --auto
     ```
  3. O ejecuta la herramienta `setup_auth` desde el agente para abrir una ventana de login asistido.

---

### 2. Chromium o Chrome Bloqueado en Segundo Plano
* **Causa:** Múltiples instancias huérfanas de Chrome impiden abrir el perfil persistente.
* **Solución:**
  Cierra los procesos residuales en PowerShell:
  ```powershell
  taskkill /F /IM chrome.exe
  ```

---

### 3. Timeout en Consultas con Fuentes Muy Pesadas
* **Causa:** Cuadernos con más de 30 o 40 fuentes grandes pueden tardar más de 2 minutos en responder en Google.
* **Solución:**
  Puedes configurar la variable de entorno `ANSWER_TIMEOUT_MS=600000` (10 minutos) o pasar `browser_options: { timeout_ms: 600000 }` en la consulta de `ask_question`.

---

### 4. PDFs Escaneados o Sin Texto Seleccionable
* **Causa:** `add_source` con `type: "file"` extrae el texto nativo del PDF. Si el PDF es solo una imagen escaneada sin OCR, el texto resultará vacío.
* **Solución:** Pasa el PDF por una herramienta de OCR o súbelo directamente como imagen a NotebookLM web.
