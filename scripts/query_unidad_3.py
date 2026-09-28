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
    "sobre la Unidad 3: Relaciones Humanas y Sociales en el Trabajo. "
    "Menciona específicamente a cada autor y tema: "
    "1) Francisco Longo (Gestión de las relaciones humanas y sociales, Servicio Civil, dimensión colectiva, clima, relaciones laborales y políticas sociales), "
    "2) Idalberto Chiavenato (Capítulo 11: Prestaciones y Beneficios Sociales, clasificación, Maslow/Herzberg; Capítulo 12: Higiene, Seguridad y Calidad de Vida Laboral CVT, actos vs condiciones inseguras, ergonomía; Capítulo 13: Relaciones con Empleados y Sindicatos, las 4 políticas patronales frente a sindicatos), "
    "3) Jorge Aquino y cols. (Relaciones gremiales y sindicales, singularidades, funciones sindicales de auditoría/voz/negociación, rol de RRHH como dueño vs asesor, cooperación y la regla de incompatibilidad de McGregor). "
    "Incluye qué preguntas de examen parcial o final suele hacer el docente, advertencias de corrección, "
    "ejemplos reales dados en clase por las profesoras, qué textos entran o no al parcial, y conceptos que hay que saber sí o sí."
)

print("Enviando consulta sobre Unidad 3 a NotebookLM...", flush=True)
res = client.query(notebook_id, q)
if res:
    print("RESPUESTA UNIDAD 3:")
    print(res.get("answer"))
else:
    print("No se recibió respuesta.")
