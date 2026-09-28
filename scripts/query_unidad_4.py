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
    "sobre la Unidad 4: Perspectiva Actual de la Gestión de Recursos Humanos e Inteligencia Artificial / Nuevas Tendencias. "
    "Menciona específicamente a cada texto y autor: "
    "1) Disrupción tecnológica en la gestión del talento / Cappelli, Tambe y Rogovsky (IA en selección, sesgos algorítmicos, algoritmos de salvaguarda, sistemas salvajes shadow IT, agenda de IA centrada en el ser humano IACH, human-ai teaming), "
    "2) Las 5 tendencias tecnológicas que revolucionarán RRHH (Bejerman / Thomson Reuters: Libro de Sueldo Digital, Liquidación Cloud, People Analytics, Autogestión, Evaluación de desempeño digital), "
    "3) OIT: Estrategia de recursos humanos 2022-2025 (Diversidad, rendición de cuentas, las 4 competencias transversales, teletrabajo, tutorías inversas reverse mentoring). "
    "Aclara expresamente qué entra al Segundo Parcial oral y qué queda relegado para el Examen Final "
    "(menciona si el informe de la OIT queda excluido del parcial y solo entra al final), "
    "preguntas de examen, advertencias de corrección y ejemplos reales dados en clase por las docentes."
)

print("Enviando consulta sobre Unidad 4 a NotebookLM...", flush=True)
res = client.query(notebook_id, q)
if res:
    print("RESPUESTA UNIDAD 4:")
    print(res.get("answer"))
else:
    print("No se recibió respuesta.")
