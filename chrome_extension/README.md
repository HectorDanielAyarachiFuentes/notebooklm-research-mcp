# ⚡ NotebookLM Sync - Chrome Extension (v2.0)

Extensión Manifest V3 para Google Chrome que extrae cookies reales de Google y NotebookLM **preservando dominio, ruta, expiración y flags (`httpOnly`, `secure`, `sameSite`)** para Playwright / Antigravity MCP, evitando errores de `CookieMismatch`.

---

## 🚀 Cómo Instalarla (o Recargarla tras actualizar)

1. En Google Chrome entra a `chrome://extensions`.
2. Activa **Modo de desarrollador** (*Developer mode*).
3. Haz clic en **Cargar descomprimida** (*Load unpacked*) y selecciona esta carpeta (`chrome_extension`).
   * Si ya la tenías instalada, haz clic en el botón **Recargar** (↻) de la tarjeta.
4. *(Recomendado)* Fija el icono azul con la **`N`** de **NotebookLM Sync** en tu barra superior.

---

## 🎯 Cómo Usarla

1. Abre e inicia sesión en [NotebookLM](https://notebooklm.google.com) (asegura que existan `OSID` / `__Secure-OSID`).
2. Haz clic en **NotebookLM Sync**:
   * Verás cuántas de las `9` cookies críticas de Google + NotebookLM están activas.
   * Por defecto copia automáticamente el **`state.json`** completo de Playwright al portapapeles (con fallback seguro si el popup aún no recibe foco).
3. Importa directamente en el MCP Node/TypeScript:
   * Desde portapapeles:
     ```bash
     node scripts/import_cookies.js --clipboard
     ```
   * O usando **Guardar `state.json`** y pasando la ruta al archivo descargado:
     ```bash
     node scripts/import_cookies.js path/to/state.json
     ```
4. También puedes usar **Copiar Header** (o cambiar el selector superior a `Cookie Header (Legacy/txt)`) si necesitas formato cabecera plano para `scripts/auth_helper.py`.
