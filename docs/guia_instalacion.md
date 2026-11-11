# 📘 Guía de Configuración de NotebookLM MCP para Antigravity IDE

Esta guía detalla los prerrequisitos necesarios, los pasos secuenciales para instalar y levantar el servidor MCP de NotebookLM (`notebooklm-research-mcp`), y un catálogo de resolución de problemas frecuentes.

---

## 🛠️ 1. Requisitos Previos (Prerrequisitos)

Antes de comenzar con la instalación del servidor MCP, asegúrate de tener instalados los siguientes programas:

1. **Antigravity IDE:** El editor donde conectarás tu agente al servidor MCP.
2. **Node.js (versión LTS reciente):** Requerido para compilar y ejecutar este servidor MCP en TypeScript y el importador `scripts/import_cookies.js`.
3. **Google Chrome o Navegador Chromium compatible:** Necesario para iniciar sesión en NotebookLM / Gemini Notebook y extraer la sesión.
4. **Python 3.10+ (`uv` / `pip`, opcional):** Solo si deseas utilizar utilidades legacy como `scripts/auth_helper.py`.

---

## 🚀 2. Pasos para Levantar y Configurar el Servidor

### Paso A: Instalar dependencias y compilar el servidor MCP
En la raíz del proyecto ejecuta:
```powershell
npm install
npm run build
```

### Paso B: Obtener e Importar la Sesión de Google

#### ⚡ Opción 1: Con la Extensión Chrome v2.0 (Recomendado)
Preserva dominios reales (`google.com`, `accounts.google.com`, `notebook.google.com`, `notebooklm.google.com`), rutas y flags (`httpOnly`, `secure`, `sameSite`), evitando bloqueos de `CookieMismatch`.

1. Abre en Chrome: `chrome://extensions`.
2. Activa el **Modo de desarrollador** (arriba a la derecha).
3. Haz clic en **Cargar descomprimida** y selecciona la carpeta `chrome_extension` de este proyecto.
4. Entra a [Gemini Notebook / NotebookLM](https://notebook.google.com) (o `https://notebooklm.google.com`) con tu sesión activa y pulsa el icono azul **NotebookLM Sync** (v2.0).
   * Al abrirlo copia automáticamente `state.json` al portapapeles (o puedes pulsar **Guardar `state.json`**).
5. En tu terminal dentro del proyecto ejecuta:
   ```powershell
   node scripts/import_cookies.js --clipboard
   ```
   *(O si guardaste el archivo descargado: `node scripts/import_cookies.js ruta/al/state.json`.)*

#### 🖥️ Opción 2: Login Asistido Directo en Navegador (`setup_auth`)
1. Desde Antigravity pide al agente ejecutar la herramienta MCP `setup_auth` (con `show_browser: true`).
2. Inicia sesión manualmente en la ventana de Chrome que se abrirá; `AuthManager` guardará el perfil persistente y `state.json` al llegar a `notebooklm.google.com` o `notebook.google.com`.

#### 📝 Opción 3: Modo Manual desde DevTools (Fallback Legacy)
1. Abre [NotebookLM / Gemini Notebook](https://notebook.google.com) y presiona **F12** -> pestaña **Network** (Red).
2. Recarga (**F5**), selecciona una petición a `batchexecute` y copia el valor del header **`cookie:`**.
3. Pega la línea en `cookies.txt` en la raíz del proyecto y ejecuta `node scripts/import_cookies.js` (o `python scripts/auth_helper.py --auto` si usas el helper Python).
   *(Nota: al copiar solo una cabecera plana sin dominios por cookie, Google puede rechazar algunas sesiones modernas con `CookieMismatch`; en ese caso usa la Opción 1 o 2.)*

### Paso C: Verificar el Registro en Antigravity
El archivo `.agents/mcp_config.json` ya apunta al servidor compilado:
```json
{
  "mcpServers": {
    "notebooklm": {
      "command": "node",
      "args": ["dist/index.js"]
    }
  }
}
```
Asegúrate de haber ejecutado `npm run build` (`dist/` actualizado), guarda la configuración y haz clic en **Refresh** en la pestaña MCP de Antigravity.

---

## 🔍 3. Guía de Errores Comunes y Soluciones

| Error / Síntoma | Causa | Solución |
| :--- | :--- | :--- |
| **Redirección a `accounts.google.com/CookieMismatch`** | El `state.json` se generó desde una cadena plana de `cookies.txt` adivinando dominios/flags de cookies `__Host-*`. | Usa la extensión **NotebookLM Sync v2.0** exportando `state.json` completo (`node scripts/import_cookies.js --clipboard`) o ejecuta `setup_auth`. |
| **"Authentication expired"** (a pesar de tener cookies previas) | Expiraron las cookies o el estado guardado superó las 24h en disco. | Recarga NotebookLM, haz clic en **NotebookLM Sync v2.0** y reimporta con `node scripts/import_cookies.js --clipboard` (o ejecuta `re_auth`). |
| **Procesos bloqueados / Error al lanzar Chrome** | Instancias colgadas de Chrome bloquean el perfil persistente. | Cierra tus ventanas de Chrome o ejecuta `taskkill /F /IM chrome.exe` y reintenta `setup_auth`. |
| **`Required cookies are missing: ['HSID', 'SSID']`** | Se intentó extraer cookies con `document.cookie` en consola JS (bloqueado para cookies `HttpOnly`). | Usa **NotebookLM Sync v2.0** (permiso `chrome.cookies`) o copia el header desde DevTools -> Network -> `Request Headers`. |
