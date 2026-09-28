import sys
import json
from pathlib import Path

site_pkg = Path(r"C:\Users\Ramoncito\AppData\Roaming\uv\tools\notebooklm-mcp-server\Lib\site-packages")
if site_pkg.exists():
    sys.path.insert(0, str(site_pkg))

from notebooklm_mcp.api_client import NotebookLMClient

auth_path = Path.home() / ".notebooklm-mcp" / "auth.json"
data = json.loads(auth_path.read_text(encoding="utf-8"))
client = NotebookLMClient(cookies=data["cookies"])
notebook_id = "9770c7d5-f2e8-458f-ba31-52df06b3a8e8"

q = "¿Cuáles son los conceptos clave, autores y temas centrales que explica el docente en las clases sobre la Unidad 1 (Planificación Estratégica)? Menciona autores como Armijo, Ossorio, Palacios Acero, Dolan, Mendoza/López/Salas, Iglesias/Pagola/Uranga si aparecen en las clases y qué pide o enfatiza el docente."
print("Enviando consulta a NotebookLM...")
res = client.query(notebook_id, q)
if res:
    print("Respuesta recibida:")
    print(json.dumps(res, indent=2, ensure_ascii=False))
else:
    print("No se obtuvo respuesta.")
