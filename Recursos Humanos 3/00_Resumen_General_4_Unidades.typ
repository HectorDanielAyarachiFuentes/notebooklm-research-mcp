#set document(
  title: "Gestión de Recursos Humanos III — Programa General",
  author: "Cátedra GRH III"
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
          Gestión de Recursos Humanos III · *Programa General de la Materia*
        ],
        text(size: 8.5pt, fill: rgb("#718096"), font: "Liberation Sans")[
          Ciclo 2025
        ]
      )
      #v(-2pt)
      #line(length: 100%, stroke: 0.5pt + rgb("#cbd5e0"))
    ]
  },
  footer: context [
    #line(length: 100%, stroke: 0.5pt + rgb("#e2e8f0"))
    #v(2pt)
    #grid(
      columns: (1fr, auto),
      align: (left, right),
      text(size: 8pt, fill: rgb("#a0aec0"))[
        Facultad de Ciencias Económicas · Cátedra GRH III
      ],
      text(size: 8.5pt, fill: rgb("#4a5568"), weight: "bold")[
        #counter(page).display("1 / 1", both: true)
      ]
    )
  ]
)

#set text(
  font: ("Liberation Sans", "DejaVu Sans", "Arial"),
  size: 10.5pt,
  lang: "es",
  fill: rgb("#2d3748")
)

#set par(justify: true, leading: 0.75em)

#let c-primary = rgb("#1a365d")
#let c-secondary = rgb("#2b6cb0")
#let c-accent = rgb("#319795")

#let unit-card(number: "", title: "", eje: "", autores: ()) = [
  #v(10pt)
  #rect(
    width: 100%,
    fill: rgb("#f7fafc"),
    stroke: 1pt + rgb("#cbd5e0"),
    radius: 5pt,
    inset: 12pt
  )[
    #text(weight: "bold", size: 12pt, fill: c-primary)[#number: #title] \
    #v(4pt)
    #text(weight: "bold", size: 9.5pt, fill: c-secondary)[Eje Temático:] \
    #text(size: 9.5pt, fill: rgb("#4a5568"))[#eje] \
    #v(6pt)
    #text(weight: "bold", size: 9.5pt, fill: c-accent)[Autores y Bibliografía Obligatoria:] \
    #list(..autores.map(a => text(size: 9pt, fill: rgb("#2d3748"))[#a]))
  ]
  #v(8pt)
]

#align(center)[
  #v(0.8cm)
  #text(size: 20pt, weight: "bold", fill: c-primary)[
    Gestión de Recursos Humanos III
  ] \
  #v(4pt)
  #text(size: 13pt, weight: "medium", fill: c-secondary)[
    Estructura Oficial del Programa — Síntesis de las 4 Unidades y Autores
  ] \
  #v(4pt)
  #text(size: 9.5pt, style: "italic", fill: rgb("#718096"))[
    Año Académico 2025 · Cátedra de Recursos Humanos
  ]
  #v(10pt)
  #line(length: 100%, stroke: 1.5pt + c-secondary)
]

#v(10pt)

#unit-card(
  number: "Unidad 1",
  title: "Planificación Estratégica de Recursos Humanos",
  eje: "Planificación en el marco de la Gestión por Resultados (GpR). Definición de Misión, Visión, Objetivos e Indicadores. Articulación de la Planificación Estratégica Institucional (PEE) con la Planificación de RRHH (PERRHH). Enfoques tradicional, situacional y prospectivo. Diagnóstico situacional, análisis FODA y balance de oferta vs. demanda de personal.",
  autores: (
    "Marianela Armijo (CEPAL, 2009): Manual de Planificación estratégica e indicadores de desempeño en el sector público.",
    "Alfredo Ossorio (FLACSO, 2003): Planeamiento estratégico.",
    "Luis Carlos Palacios Acero: Dirección estratégica (2ª Edición).",
    "Martín Iglesias, Cecilia Pagola y Washington Uranga (UNLP, 2012): Enfoques de planificación.",
    "Simón Dolan y otros (1999): La Gestión de los RRHH (Capítulo 3: Planificación de los recursos humanos).",
    "Darcy Mendoza Fernández, Dany López Juvinao y Edwin Salas Solano (2015): Planificación estratégica de recursos humanos."
  )
)

#unit-card(
  number: "Unidad 2",
  title: "Auditoría y Control de Recursos Humanos",
  eje: "Información, control y evaluación de gestión. El control estratégico, factores críticos y monitoreo del entorno. Sistemas de Información de RRHH (SIA / SIRH): diferencia entre datos e información. Auditoría de RRHH: objetivos, preparación, perfil del auditor, áreas auditables, fuentes de información, técnicas de investigación y elaboración del informe final.",
  autores: (
    "Jorge Hintze (Documentos TOP, 1999): Control y evaluación de gestión y resultados de gestión.",
    "Remberto Naranjo Pérez, María Antonieta Mesa Espinosa y José Solera Salas: El control estratégico. Lo que no debemos obviar.",
    "Idalberto Chiavenato: Administración de RRHH (Capítulo 16: Sistema de información de RRHH).",
    "Vladimir Vega Falcón, Sharon Álvarez Gómez, Daylin Medina Nogueira y Wilson Salas Álvarez: Auditoría de Recursos Humanos."
  )
)

#pagebreak()

#unit-card(
  number: "Unidad 3",
  title: "Relaciones Humanas y Sociales",
  eje: "El subsistema de relaciones laborales: articulación y puntos críticos. Calidad de Vida en el Trabajo (CVT), ergonomía, higiene, seguridad y bienestar laboral. Gestión de conflictos, negociación colectiva y políticas laborales. Relaciones gremiales y sindicales: voz, comunicación, estilos de políticas patronales y modelos de diagnóstico de relaciones laborales.",
  autores: (
    "Francisco Longo: Marco Analítico para el Diagnóstico Institucional de Sistemas de Servicio Civil (Págs. 42 a 45).",
    "Idalberto Chiavenato: Administración de RRHH (Capítulo 12: Calidad de vida en el trabajo).",
    "Idalberto Chiavenato: Administración de RRHH (Capítulo 13: Relaciones con las personas).",
    "Jorge Aquino y otros: Recursos Humanos (Capítulo 8: Relaciones Sindicales / Gremiales)."
  )
)

#unit-card(
  number: "Unidad 4",
  title: "Perspectiva Actual de la Gestión de RRHH",
  eje: "Desafíos contemporáneos en la gestión del talento. Impacto y aplicaciones de la Inteligencia Artificial (IA) en la selección, evaluación y desarrollo del personal. Gobernanza ética de algoritmos, diversidad, inclusión, respeto y rendición de cuentas (accountability) según los estándares de la OIT.",
  autores: (
    "Peter Cappelli y Nikolai Rogovsky (OIT): Inteligencia artificial en la gestión de recursos humanos: ¿un desafío para la agenda centrada en el ser humano?",
    "Organización Internacional del Trabajo (OIT): Consejo de Administración 353° Reunión: Informe relativo a la Estrategia de RRHH 2022-2025.",
    "Organización Internacional del Trabajo (OIT, 2016): Human Resources and Management."
  )
)

#v(15pt)
#align(center)[
  #text(size: 9pt, style: "italic", fill: rgb("#718096"))[
    Dossier de Cátedra · Gestión de Recursos Humanos III (2025)
  ]
]
