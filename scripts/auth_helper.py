"""
NotebookLM Auth Helper
Herramienta CLI para configurar y actualizar las cookies de autenticación de NotebookLM MCP
de forma automática (portapapeles o cookies.txt) o manual (pegado en terminal).
"""

import json
import os
import re
import subprocess
import sys
import time
import urllib.error
import urllib.request
from pathlib import Path

# Añadir posibles rutas del entorno uv de notebooklm-mcp si está disponible para reutilizar sus librerías
appdata = os.environ.get("APPDATA", "")
possible_site_packages = [
    Path(appdata) / "uv" / "tools" / "notebooklm-mcp-server" / "Lib" / "site-packages" if appdata else None,
    Path(r"C:\Users\Ramoncito\AppData\Roaming\uv\tools\notebooklm-mcp-server\Lib\site-packages"),
]
for p in possible_site_packages:
    if p and p.exists() and str(p) not in sys.path:
        sys.path.insert(0, str(p))

REQUIRED_COOKIES = [
    "SID", "HSID", "SSID", "APISID", "SAPISID",
    "__Secure-1PSID", "__Secure-3PSID",
    "__Secure-1PAPISID", "__Secure-3PAPISID",
]

ESSENTIAL_COOKIES = [
    "SID", "HSID", "SSID", "APISID", "SAPISID",
    "__Secure-1PSID", "__Secure-3PSID",
    "__Secure-1PAPISID", "__Secure-3PAPISID",
    "OSID", "__Secure-OSID",
    "__Secure-1PSIDTS", "__Secure-3PSIDTS",
    "SIDCC", "__Secure-1PSIDCC", "__Secure-3PSIDCC",
    "NID", "__Secure-ENID",
]


def get_cache_path() -> Path:
    """Ruta donde NotebookLM MCP almacena los tokens de autenticación."""
    cache_dir = Path.home() / ".notebooklm-mcp"
    cache_dir.mkdir(exist_ok=True)
    return cache_dir / "auth.json"


def get_clipboard_text() -> str:
    """Obtiene el contenido del portapapeles usando PowerShell (nativo en Windows)."""
    try:
        cmd = ["powershell", "-NoProfile", "-Command", "Get-Clipboard"]
        result = subprocess.run(cmd, capture_output=True, text=True, timeout=5)
        return result.stdout.strip()
    except Exception:
        return ""


def parse_cookie_string(raw: str) -> dict[str, str]:
    """Extrae las cookies en un diccionario clave-valor de forma tolerante a formatos variados."""
    cookies: dict[str, str] = {}
    if not raw:
        return cookies

    cleaned = raw.strip()

    # Quitar comillas envolventes si las tiene
    if (cleaned.startswith('"') and cleaned.endswith('"')) or (cleaned.startswith("'") and cleaned.endswith("'")):
        cleaned = cleaned[1:-1].strip()

    # Quitar posibles prefijos como 'cookie:' o 'Cookie:' o flags cURL (-H 'Cookie: ...')
    if cleaned.lower().startswith("-h "):
        cleaned = cleaned[3:].strip().strip("'\"")
    if cleaned.lower().startswith("cookie:"):
        cleaned = cleaned[7:].strip()

    # Reemplazar saltos de línea por punto y coma para soportar texto multilinea
    cleaned = cleaned.replace("\r", "").replace("\n", ";")

    for item in cleaned.split(";"):
        item = item.strip()
        if "=" in item:
            key, val = item.split("=", 1)
            k = key.strip().strip("'\"")
            v = val.strip().strip("'\"")
            if k:
                cookies[k] = v
    return cookies


def is_valid_google_cookies(cookies: dict[str, str]) -> bool:
    """Verifica si contiene las cookies mínimas requeridas de una sesión de Google."""
    matches = sum(1 for req in REQUIRED_COOKIES if req in cookies)
    has_primary = any(
        k in cookies
        for k in ("SID", "SAPISID", "__Secure-1PSID", "__Secure-1PAPISID", "__Secure-3PSID")
    )
    return matches >= 2 and has_primary


def save_tokens(cookies: dict[str, str], csrf_token: str = "", session_id: str = "") -> Path:
    """Guarda las cookies y metadatos en el formato JSON esperado por NotebookLM MCP."""
    cache_file = get_cache_path()
    
    # Conservamos todas las cookies útiles provistas para evitar descartar tokens regionales
    payload = {
        "cookies": cookies,
        "csrf_token": csrf_token,
        "session_id": session_id,
        "extracted_at": time.time(),
    }
    with open(cache_file, "w", encoding="utf-8") as f:
        json.dump(payload, f, indent=2)
    return cache_file


def test_authentication(cookies: dict[str, str]) -> tuple[bool, str, str, str]:
    """
    Prueba si las credenciales funcionan contra los servidores de NotebookLM.
    Retorna: (éxito: bool, mensaje: str, csrf_token: str, session_id: str)
    """
    csrf_token = ""
    session_id = ""

    # Método 1: Intentar usar el cliente oficial de notebooklm_mcp si está instalado
    try:
        from notebooklm_mcp.api_client import NotebookLMClient  # type: ignore

        client = NotebookLMClient(cookies=cookies)
        csrf_token = getattr(client, "csrf_token", "")
        session_id = getattr(client, "_session_id", "")
        notebooks = client.list_notebooks()
        return True, f"Conexión exitosa via MCP Client. Se encontraron {len(notebooks)} cuadernos en tu cuenta.", csrf_token, session_id
    except ImportError:
        pass  # Fallback a verificación HTTP nativa
    except Exception as e:
        # Si falló la llamada API, registrar error
        err_str = str(e)
        if "Authentication expired" in err_str or "401" in err_str:
            return False, f"Las credenciales expiraron o no tienen acceso: {err_str}", "", ""
        # Si fue otro error (ej. gRPC), intentar verificación HTTP como doble chequeo

    # Método 2: Verificación HTTP nativa (sin dependencias externas)
    try:
        cookie_header = "; ".join(f"{k}={v}" for k, v in cookies.items())
        headers = {
            "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36",
            "Cookie": cookie_header,
            "Accept": "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8",
            "Accept-Language": "es-419,es;q=0.9,en;q=0.8",
        }
        req = urllib.request.Request("https://notebooklm.google.com/", headers=headers)
        
        with urllib.request.urlopen(req, timeout=12) as resp:
            final_url = resp.geturl()
            if "accounts.google.com" in final_url:
                return False, "La sesión fue redirigida al login de Google (cookies expiradas o inválidas).", "", ""
            
            html_text = resp.read().decode("utf-8", errors="ignore")
            csrf_match = re.search(r'"SNlM0e":"([^"]+)"', html_text)
            sid_match = re.search(r'"FdrFJe":"([^"]+)"', html_text)

            if csrf_match:
                csrf_token = csrf_match.group(1)
            if sid_match:
                session_id = sid_match.group(1)

            if csrf_token or "LabsTailwindUi" in html_text or "notebooklm" in html_text.lower():
                return True, "Conexión validada exitosamente con notebooklm.google.com.", csrf_token, session_id
            else:
                return True, "Página de NotebookLM alcanzada pero no se pudo extraer el token CSRF.", csrf_token, session_id

    except urllib.error.HTTPError as e:
        return False, f"Error HTTP {e.code}: {e.reason}", "", ""
    except Exception as e:
        return False, f"Error al verificar conexión: {e}", "", ""


def main():
    print("\n" + "=" * 60)
    print(" 🚀 NotebookLM MCP - Asistente de Autenticación Rápida")
    print("=" * 60 + "\n")

    raw_cookies = ""
    source_found = ""
    cookies_to_save: dict[str, str] = {}

    # 1. Intentar leer desde cookies.txt (en el directorio actual o en la carpeta del script)
    candidate_paths = [
        Path("cookies.txt"),
        Path(__file__).parent / "cookies.txt",
        Path(__file__).resolve().parent.parent / "cookies.txt",
        Path("herramientas/notebooklm/scripts/cookies.txt"),
    ]
    txt_path = next((p for p in candidate_paths if p.exists()), None)
    if txt_path:
        try:
            content = txt_path.read_text(encoding="utf-8", errors="ignore").strip()
            parsed = parse_cookie_string(content)
            if is_valid_google_cookies(parsed):
                raw_cookies = content
                source_found = f"archivo '{txt_path}'"
        except Exception:
            pass

    # 2. Intentar leer desde el portapapeles si no se encontró en archivo
    if not raw_cookies:
        clip_content = get_clipboard_text()
        parsed_clip = parse_cookie_string(clip_content)
        if is_valid_google_cookies(parsed_clip):
            raw_cookies = clip_content
            source_found = "el portapapeles de Windows"

    is_auto = "--auto" in sys.argv or "--clipboard" in sys.argv

    # Si se detectó automáticamente
    if raw_cookies:
        parsed = parse_cookie_string(raw_cookies)
        print(f"✨ ¡Cookies de Google detectadas automáticamente desde {source_found}!")
        print(f"   - Total de cookies encontradas: {len(parsed)}")
        present_keys = [k for k in REQUIRED_COOKIES if k in parsed]
        print(f"   - Claves esenciales encontradas: {', '.join(present_keys)}")
        print()
        if is_auto:
            cookies_to_save = parsed
        else:
            choice = input("¿Deseas guardar y probar estas credenciales? [S/n]: ").strip().lower()
            if choice in ("", "s", "si", "y", "yes"):
                cookies_to_save = parsed
            else:
                raw_cookies = ""
    elif is_auto:
        print("❌ Error: No se encontraron cookies válidas en el portapapeles ni en cookies.txt.")
        sys.exit(1)

    # 3. Modo Manual (si no se detectó o el usuario prefirió ingresar manualmente)
    if not raw_cookies and not is_auto:
        print("📋 Modo Manual:")
        print("1. En tu navegador abre https://notebooklm.google.com con tu sesión iniciada.")
        print("2. Abre DevTools (F12) -> pestaña Network (Red) -> Recarga (F5).")
        print("3. Clic en una petición (ej. 'batchexecute') -> Request Headers -> Copia el valor de 'cookie:'.\n")
        
        user_input = input("👉 Pega el valor de la cookie aquí y presiona Enter:\n> ").strip()
        parsed_input = parse_cookie_string(user_input)

        if not parsed_input:
            print("\n❌ Error: No se ingresaron cookies válidas.")
            sys.exit(1)

        if not is_valid_google_cookies(parsed_input):
            print("\n⚠️ Advertencia: No se encontraron todas las cookies esenciales (SID, SAPISID, etc.).")
            proceed = input("¿Deseas continuar de todos modos? [s/N]: ").strip().lower()
            if proceed not in ("s", "si", "y", "yes"):
                sys.exit(1)
        
        cookies_to_save = parsed_input

    if not cookies_to_save:
        print("\n❌ No se obtuvieron cookies para guardar.")
        sys.exit(1)

    # 4. Probar autenticación y extraer tokens CSRF / Session ID
    print("\n🔍 Verificando acceso con los servidores de NotebookLM...")
    ok, msg, csrf_token, session_id = test_authentication(cookies_to_save)

    # 5. Guardar credenciales en auth.json con tokens actualizados
    cache_path = save_tokens(cookies_to_save, csrf_token=csrf_token, session_id=session_id)
    print(f"💾 Credenciales guardadas correctamente en:\n   {cache_path}")

    if ok:
        print(f"\n✅ {msg}")
        if csrf_token:
            print(f"   - Token CSRF extraído: {csrf_token[:12]}...")
        if session_id:
            print(f"   - Session ID extraído: {session_id[:12]}...")
        print("\n🎉 ¡NotebookLM MCP está 100% configurado y listo para usarse!")
    else:
        print(f"\n⚠️ Advertencia durante la verificación: {msg}")
        print("   Nota: Si tus cookies son muy recientes, prueba usar las herramientas MCP directamente.")


if __name__ == "__main__":
    main()
