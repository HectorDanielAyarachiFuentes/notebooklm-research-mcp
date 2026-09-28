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

q = "¿Qué preguntas de parcial, advertencias, 'tips de cátedra' o ejemplos prácticos específicos dio el docente en las clases al explicar cada uno de los autores de la Unidad 1 (Armijo, Ossorio, Iglesias/Pagola/Uranga, Dolan, Mendoza/López/Salas)? Detalla lo más posible lo que el docente remarca que 'se toma' o 'hay que saber sí o sí'."
print("Enviando consulta 2 a NotebookLM...", flush=True)
res = client.query(notebook_id, q)
if res:
    print("RESPUESTA 2:")
    print(res.get("answer"))
