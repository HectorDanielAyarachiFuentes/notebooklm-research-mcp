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

q = (
    "Detalla de forma exhaustiva todo lo que explica y exige el equipo docente en las clases "
    "sobre la Unidad 2: Control y Auditoría de Recursos Humanos. "
    "Menciona específicamente a cada autor: "
    "1) Jorge Hintze (Control y evaluación de gestión, desvíos, tipos de control, etc.), "
    "2) Naranjo Pérez (Control estratégico, niveles, factores clave), "
    "3) Idalberto Chiavenato (Sistemas de Información, base de datos, balance social, auditoría, criterios de control), "
    "4) Vega Falcón (Auditoría de Recursos Humanos, metodologías, fases, objetivos, alcance). "
    "Incluye qué preguntas de examen parcial o final suele hacer el docente, advertencias de corrección, "
    "ejemplos dados en clase, qué textos entran o no al parcial, y conceptos que hay que saber sí o sí."
)

print("Enviando consulta sobre Unidad 2 a NotebookLM...", flush=True)
res = client.query(notebook_id, q)
if res:
    print("RESPUESTA UNIDAD 2:")
    print(res.get("answer"))
else:
    print("No se recibió respuesta.")
