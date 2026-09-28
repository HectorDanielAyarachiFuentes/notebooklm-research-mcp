#set document(
  title: "Vega Falcón y cols. — Auditoría de Recursos Humanos",
  author: "Gestión de Recursos Humanos 3",
)

#set page(
  paper: "a4",
  margin: (top: 2.5cm, bottom: 2.5cm, left: 2.2cm, right: 2.2cm),
  header: context {
    let page_num = counter(page).get().first()
    if page_num > 1 [
      #grid(
        columns: (1fr, auto),
        align: (left, right),
        text(size: 8.5pt, fill: rgb("#4a5568"), font: "Liberation Sans", weight: "medium")[
          Vega Falcón y cols. · *Unidad 2: Auditoría y Control de RRHH*
        ],
        text(size: 8.5pt, fill: rgb("#718096"), font: "Liberation Sans")[
          Gestión de Recursos Humanos 3
        ]
      )
      #v(-2pt)
      #line(length: 100%, stroke: 0.5pt + rgb("#cbd5e0"))
    ]
  },
  footer: context {
    let page_num = counter(page).get().first()
    if page_num > 1 [
      #line(length: 100%, stroke: 0.5pt + rgb("#e2e8f0"))
      #v(2pt)
      #grid(
        columns: (1fr, auto),
        align: (left, right),
        text(size: 8pt, fill: rgb("#a0aec0"))[
          Gestión de Recursos Humanos 3
        ],
        text(size: 8.5pt, fill: rgb("#4a5568"), weight: "bold")[
          #counter(page).display("1 / 1", both: true)
        ]
      )
    ]
  }
)

#set text(
  font: ("Liberation Sans", "DejaVu Sans", "Arial"),
  size: 10pt,
  lang: "es",
  fill: rgb("#2d3748")
)

#set par(
  justify: true,
  leading: 0.75em
)

#let c-primary = rgb("#1a365d")
#let c-secondary = rgb("#2b6cb0")
#let c-accent = rgb("#319795")
#let c-bg-callout = rgb("#ebf8ff")
#let c-border-callout = rgb("#3182ce")
#let c-bg-warn = rgb("#fffaf0")
#let c-border-warn = rgb("#dd6b20")
#let c-bg-alerta = rgb("#fff5f5")
#let c-border-alerta = rgb("#e53e3e")

#let callout(title: "", body, icon: "📌") = [
  #v(6pt)
  #rect(
    width: 100%,
    fill: c-bg-callout,
    stroke: (left: 4pt + c-border-callout, rest: 0.5pt + rgb("#bee3f8")),
    radius: (right: 4pt),
    inset: (x: 12pt, y: 8pt)
  )[
    #if title != "" [
      #text(weight: "bold", size: 10pt, fill: c-secondary)[#icon #title] \
      #v(3pt)
    ]
    #text(size: 9.5pt, fill: rgb("#2d3748"))[#body]
  ]
  #v(6pt)
]

#let tip-catedra(title: "Énfasis de Cátedra / Clases Desgrabadas", body) = [
  #v(8pt)
  #rect(
    width: 100%,
    fill: c-bg-warn,
    stroke: (left: 4pt + c-border-warn, rest: 0.5pt + rgb("#fbd38d")),
    radius: (right: 4pt),
    inset: (x: 12pt, y: 9pt)
  )[
    #text(weight: "bold", size: 10pt, fill: c-border-warn)[🎓 #title] \
    #v(3pt)
    #text(size: 9.5pt, fill: rgb("#744210"))[#body]
  ]
  #v(8pt)
]

#let alerta-parcial(title: "¡Alerta Clave para el Parcial!", body) = [
  #v(8pt)
  #rect(
    width: 100%,
    fill: c-bg-alerta,
    stroke: (left: 4pt + c-border-alerta, rest: 0.5pt + rgb("#fed7d7")),
    radius: (right: 4pt),
    inset: (x: 12pt, y: 9pt)
  )[
    #text(weight: "bold", size: 10pt, fill: c-border-alerta)[⚠️ #title] \
    #v(3pt)
    #text(size: 9.5pt, fill: rgb("#742a2a"))[#body]
  ]
  #v(8pt)
]

#show heading.where(level: 1): it => [
  #v(12pt)
  #text(fill: c-primary, weight: "bold", size: 14pt)[#it.body]
  #v(3pt)
  #line(length: 100%, stroke: 1.5pt + c-secondary)
  #v(8pt)
]

#show heading.where(level: 2): it => [
  #v(10pt)
  #text(fill: c-secondary, weight: "bold", size: 11.5pt)[#it.body]
  #v(4pt)
]

#show heading.where(level: 3): it => [
  #v(7pt)
  #text(fill: c-accent, weight: "bold", size: 10pt)[#it.body]
  #v(3pt)
]

// ==========================================
// ENCABEZADO DE PORTADILLA
// ==========================================

#align(center)[
  #text(size: 8.5pt, weight: "bold", fill: rgb("#718096"), tracking: 1.5pt)[
    GESTIÓN DE RECURSOS HUMANOS 3
  ] \
  #v(4pt)
  #text(size: 16pt, weight: "bold", fill: c-primary)[
    Vega Falcón y cols. — Auditoría de Recursos Humanos
  ] \
  #v(2pt)
  #text(size: 10.5pt, weight: "medium", fill: c-secondary)[
    Auditoría de Recursos Humanos (Ecoe Ediciones / Universidad de Matanzas)
  ]
  #v(4pt)
  #line(length: 60%, stroke: 1pt + c-accent)
]

#v(6pt)

#callout(title: "Ficha Técnica del Documento", icon: "📋")[
  - *Autores:* Vladimir Vega Falcón, Sharon Álvarez Gómez, Daylin Medina Nogueira y Wilson Salas Álvarez.
  - *Unidad Temática:* Unidad 2 — Control y Auditoría de Recursos Humanos.
  - *Aporte Central:* Metodología analítica de la Auditoría de Personal; fundamentación irrestricta de su enfoque pedagógico no punitivo; tipología de los cinco enfoques de investigación; examen comparativo entre auditoría interna y externa; y segmentación del informe final en tres versiones decisorias.
]

= 1. Concepto y Enfoque No Punitivo

Los autores definen la *Auditoría de Recursos Humanos* como un proceso sistemático, analítico y técnico que evalúa las políticas, métodos y programas de gestión humana para comprobar su adecuación legal y técnica, identificando fallas procedimentales y emitiendo un diagnóstico constructivo.

#callout(title: "La Regla Suprema de Cátedra: Carácter Estrictamente No Punitivo")[
  _La auditoría de recursos humanos NO es un procedimiento policial, una cacería de brujas ni una investigación para aplicar sumarios o cesantías. Su propósito primordial es que la organización aprenda de sus propios errores, perfeccione sus procesos de trabajo y formule recomendaciones pedagógicas de mejora continua._
]

== Confluencia Interdisciplinaria
La auditoría de personal es el punto de encuentro de tres campos disciplinarios:
1. *Economía Laboral:* Costos salariales, productividad de la dotación y optimización presupuestaria.
2. *Psicología Social:* Clima laboral, estilos de supervisión, liderazgo y motivación.
3. *Sociología del Trabajo y Derecho Laboral:* Cumplimiento de convenios colectivos, diálogo sindical y prevención de juicios laborales.

= 2. Atributos y Postura del Auditor de RRHH

- *La Regla de Oro:* El auditor debe recordar que posee *"dos oídos y una sola boca"*: su labor central es escuchar activamente, observar el terreno con rigor y recabar evidencias objetivas antes de precipitar juicios.
- *Perfil Técnico y Actitudinal:* Dominio de leyes laborales, manejo de técnicas de muestreo documental y empatía interpersonal. Las actitudes fiscalizadoras, arrogantes o amenazantes generan temor en los trabajadores y llevan al ocultamiento de datos o falseamiento de planillas.

= 3. Las Tres Etapas del Proceso de Auditoría

#grid(
  columns: (1fr, 1.2fr, 1fr),
  gutter: 6pt,
  rect(fill: rgb("#ebf8ff"), stroke: 0.5pt + c-border-callout, radius: 3pt, inset: 6pt)[
    #text(weight: "bold", size: 8.5pt, fill: c-secondary)[1. Obtención de Datos]\
    #text(size: 8pt)[Cuestionarios, entrevistas y revisión de legajos. Se aplican las preguntas de oro: _¿Qué? ¿Por qué? ¿Cómo? ¿Cuándo? ¿Dónde? ¿Quién?_]
  ],
  rect(fill: rgb("#fffaf0"), stroke: 0.5pt + c-border-warn, radius: 3pt, inset: 6pt)[
    #text(weight: "bold", size: 8.5pt, fill: c-border-warn)[2. Análisis y Diagnóstico]\
    #text(size: 8pt)[Contraste contra normas legales y presupuestos. Identificación de causas primarias y diálogo preliminar con jefes de sector.]
  ],
  rect(fill: rgb("#e8f5e9"), stroke: 0.5pt + rgb("#388e3c"), radius: 3pt, inset: 6pt)[
    #text(weight: "bold", size: 8.5pt, fill: rgb("#1b5e20"))[3. Informe Final]\
    #text(size: 8pt)[Emisión del dictamen formal, cuantificación de riesgos patrimoniales y plan de recomendaciones priorizadas.]
  ]
)

= 4. Los Cinco Enfoques de Investigación en Auditoría

#align(center)[
  #table(
    columns: (1.8fr, 2.7fr, 2.5fr),
    fill: (col, row) => if row == 0 { rgb("#edf2f7") } else if calc.even(row) { rgb("#f7fafc") } else { none },
    stroke: 0.5pt + rgb("#cbd5e0"),
    inset: (x: 6pt, y: 5pt),
    [*Enfoque Metodológico*], [*Descripción Técnica*], [*Utilidad en la Práctica*],
    [*1. Comparativo*\ _(Benchmarking)_],
    [Compara la entidad con otra organización líder o similar del mismo sector de actividad.],
    [Evalúa si las tasas de rotación, ausentismo o paquetes salariales son competitivos en el mercado.],
    [*2. Consultoría Externa*],
    [Emplea como patrón de referencia los estándares fijados por consultores o normas internacionales.],
    [Útil para modernizar subsistemas o incorporar mejores prácticas de vanguardia.],
    [*3. Enfoque Estadístico*],
    [Construye series históricas, promedios e índices a partir de datos del propio Banco de Datos.],
    [Permite proyectar curvas de siniestralidad, ausentismo patológico o gastos en horas extras.],
    [*4. Retrospectivo de Logros*],
    [Audita una muestra de expedientes concluidos (legajos, contratos, recibos, actas paritarias).],
    [Verifica el estricto cumplimiento del marco legal y previene litigios judiciales.],
    [*5. Evaluación por Objetivos*],
    [Contrasta los resultados reales alcanzados frente a las metas pactadas en el Plan Estratégico.],
    [Verifica el grado de cumplimiento de los compromisos asumidos ante la Dirección General.]
  )
]

= 5. Auditoría Interna vs. Auditoría Externa

#align(center)[
  #table(
    columns: (1.5fr, 2.5fr, 2.5fr),
    fill: (col, row) => if row == 0 { rgb("#edf2f7") } else if calc.even(row) { rgb("#f7fafc") } else { none },
    stroke: 0.5pt + rgb("#cbd5e0"),
    inset: (x: 6pt, y: 5pt),
    [*Criterio*], [*Auditoría Interna*], [*Auditoría Externa*],
    [*Personal Ejecutor*], [Profesionales del propio departamento de RRHH o cuerpo de inspectores internos.], [Firmas consultoras independientes o auditores externos especializados.],
    [*Costo Económico*], [Bajo; utiliza los salarios y recursos de la estructura existente.], [Elevado; devenga honorarios profesionales externos.],
    [*Conocimiento Cultural*], [Muy alto; conocen las costumbres no escritas y los circuitos informales.], [Inicialmente bajo; requiere familiarización con el contexto institucional.],
    [*Grado de Objetividad*], [*Vulnerable:* puede sufrir "ceguera de taller", compromisos o presiones internas.], [*Máximo:* garantiza neutralidad, imparcialidad y rigor técnico.],
    [*Modalidad Operativa*], [Monitoreo continuo y rutinario ("control de los controles").], [Intervención formal con cronograma prefijado y muestreo intensivo.]
  )
]

= 6. Estructura y Segmentación del Informe Final de Auditoría

Vega Falcón y cols. rechazan el informe genérico e indiscriminado. Exigen estructurarlo en tres versiones adaptadas al nivel de decisión de cada destinatario:

1. *Informe para Gerentes de Línea:* Enfocado en la supervisión de su personal (evaluaciones, uso de horas extras, licencias y clima del equipo). Propone acciones correctivas inmediatas.
2. *Informe para Especialistas de RRHH:* Diagnóstico minucioso sobre los subsistemas de personal (reclutamiento, selección, capacitación, compensaciones) y la actitud de los jefes de sector hacia el área.
3. *Informe para la Dirección General:* Síntesis ejecutiva de impacto institucional; evalúa la salud del capital humano, alerta sobre contingencias legales de alto riesgo patrimonial y presenta un plan de inversiones priorizado.

= 7. Énfasis de Cátedra y Clases Desgrabadas (Tips de Examen Parcial)

El cuaderno de clases de las profesoras María Laura Cabezas y Débora aporta especificaciones concretas sobre este texto:

#alerta-parcial(title: "Estado del Texto en el Primer Parcial (¡Texto Clave de Auditoría!)")[
  - *Condición en el Examen:* El texto de Vega Falcón y cols. *ENTRA OBLIGATORIAMENTE EN EL PRIMER PARCIAL*.
  - *Aviso del Docente:* Es la única lectura específica sobre auditoría de personal de la Unidad 2, por lo que su dominio define la aprobación del examen.
]

#tip-catedra(title: "El Ejemplo Real de Clase: Auditoría Externa en Universidades y Hospitales")[
  Para ejemplificar la auditoría externa en el sector público, las docentes narraron el caso real:
  - Un equipo de auditores externos se instala durante 4 a 5 días hábiles en las oficinas centrales.
  - Exigen cajas completas de legajos de personal, resoluciones de designación, instructivos de equivalencias docentes y actas de exámenes.
  - Revisan exhaustivamente cada foja para comprobar que los procedimientos administrativos se ajusten a la normativa legal vigente, entrevistando a los directivos y emitiendo un informe con recomendaciones de ajuste.
]

#tip-catedra(title: "Comparación de Objetividad entre Auditoría Interna y Externa")[
  La cátedra suele preguntar por qué la auditoría interna corre el riesgo de perder objetividad (por complacencia, presiones jerárquicas o _"ceguera de taller"_) y por qué la externa garantiza la máxima neutralidad al no tener lazos afectivos ni dependencias funcionales dentro de la institución.
]

#alerta-parcial(title: "Error Eliminatorio: ¡Jamás calificar la auditoría como punitiva!")[
  Las docentes advirtieron taxativamente en clase que considerarán *gravemente desaprobado* a quien afirme en el examen que la auditoría de RRHH sirve para _"sancionar a empleados rebeldes"_ o _"iniciar sumarios administrativos"_. Su enfoque es estrictamente pedagógico, técnico y de aprendizaje organizacional.
]
