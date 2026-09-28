#set document(
  title: "Simón Dolan — Planificación de los Recursos Humanos",
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
          Simón Dolan · *Unidad 1: Planificación Estratégica*
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
  #text(fill: c-primary, weight: "bold", size: 15pt)[#it.body]
  #v(3pt)
  #line(length: 100%, stroke: 1.5pt + c-secondary)
  #v(8pt)
]

#show heading.where(level: 2): it => [
  #v(10pt)
  #text(fill: c-secondary, weight: "bold", size: 12pt)[#it.body]
  #v(4pt)
]

#show heading.where(level: 3): it => [
  #v(7pt)
  #text(fill: c-accent, weight: "bold", size: 10.5pt)[#it.body]
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
  #text(size: 17pt, weight: "bold", fill: c-primary)[
    Simón Dolan — Planificación de los Recursos Humanos
  ] \
  #v(2pt)
  #text(size: 11pt, weight: "medium", fill: c-secondary)[
    La Gestión de los Recursos Humanos (Capítulo 3: Planificación de Recursos Humanos, McGraw-Hill)
  ]
  #v(4pt)
  #line(length: 60%, stroke: 1pt + c-accent)
]

#v(8pt)

#callout(title: "Ficha Técnica del Documento", icon: "📋")[
  - *Autor:* Simón L. Dolan et al. (Referente internacional en Dirección de Personas y Psicología Organizacional).
  - *Unidad Temática:* Unidad 1 — Planificación Estratégica de Recursos Humanos.
  - *Aporte Central:* La doble dimensión de la PRHH (cuantitativa y cualitativa); la "Paradoja de Dolan" (100% vs 16%); balance entre Oferta y Demanda de personal; ecuación de Necesidades Netas; las cuatro fases del proceso y el rol del Sistema de Información de Recursos Humanos (SIRH).
]

= 1. Concepto y Fines de la Planificación de RRHH (PRHH)

Simón Dolan define la *Planificación de los Recursos Humanos (PRHH)* como:

#callout(title: "Definición Central de Dolan")[
  _El proceso formal de elaborar e implantar planes y programas para asegurarse de que estén disponibles el número apropiado (cuantitativo) y el tipo apropiado (cualitativo: aptitudes, competencias y calificaciones) de personas, en el momento oportuno y en el lugar adecuado, traduciendo los objetivos corporativos en requerimientos efectivos de plantilla._
]

== Los Cuatro Fines Principales de la PRHH
1. *Reducir costos corrigiendo desequilibrios:* Prevenir y mitigar tanto las carencias críticas de personal como los excesos de plantilla que generan costos ociosos.
2. *Optimizar las aptitudes y capacidades del personal:* Asignar a los colaboradores en puestos acordes a su máximo potencial.
3. *Mejorar la planificación global de la empresa:* Aportar al directorio proyecciones realistas sobre la viabilidad laboral de los planes de expansión.
4. *Evaluar las políticas y programas de gestión humana:* Monitorear el retorno de inversión en selección, capacitación y compensaciones.

= 2. La "Paradoja o Conflicto" de la PRHH según Dolan

Un punto medular destacado reiteradamente por la cátedra en sus clases:
- *El 100% de los directivos y profesionales* encuestados reconoce que la planificación estratégica del personal es de importancia vital.
- Sin embargo, en la práctica empírica, *apenas un 16% de las organizaciones* ejecuta una planificación formal y rigurosa.
- *Causas señaladas:* Las urgencias de la coyuntura diaria, la complejidad técnica de los modelos matemáticos y la falta de un *Sistema de Información de RRHH (SIRH/HRIS)* fidedigno.

= 3. El Balance de Personal: Oferta vs. Demanda

El núcleo operativo de la PRHH consiste en contrastar sistemáticamente los requerimientos futuros con las disponibilidades:

#align(center)[
  #rect(fill: rgb("#edf2f7"), stroke: 0.5pt + c-secondary, radius: 4pt, inset: 10pt)[
    #text(weight: "bold", size: 10pt, fill: c-primary)[
      Necesidades Netas = Previsión de la Demanda - Previsión de la Oferta Interna
    ]
  ]
]

#grid(
  columns: (1fr, 1fr),
  gutter: 8pt,
  rect(fill: rgb("#f7fafc"), stroke: 0.5pt + rgb("#cbd5e0"), radius: 4pt, inset: 8pt)[
    #text(weight: "bold", size: 9pt, fill: c-secondary)[A. Previsión de la Demanda]\
    #v(3pt)
    #text(size: 8.5pt)[
      - *Cualitativos:* Estimación de gerentes de línea, técnica Delphi (panel anónimo de expertos) y grupo nominal. \
      - *Cuantitativos:* Regresión lineal simple/múltiple, curvas de aprendizaje y ratios de productividad.
    ]
  ],
  rect(fill: rgb("#f7fafc"), stroke: 0.5pt + rgb("#cbd5e0"), radius: 4pt, inset: 8pt)[
    #text(weight: "bold", size: 9pt, fill: c-secondary)[B. Previsión de la Oferta]\
    #v(3pt)
    #text(size: 8.5pt)[
      - *Oferta Interna:* Inventario de habilidades, cuadros de reemplazo / matrices de sustitución y Cadenas de Markov. \
      - *Oferta Externa:* Análisis demográfico, egresos universitarios y mercado de trabajo regional.
    ]
  ]
)

== Estrategias de Ajuste según el Saldo:
- *Si Demanda > Oferta (Déficit de Personal):* Reclutamiento externo, capacitación acelerada, horas extras y subcontratación.
- *Si Oferta > Demanda (Superávit de Personal):* Congelamiento de vacantes, retiros voluntarios, traslados, reducción de jornada o despidos planificados.

= 4. Las Cuatro Etapas del Proceso de PRHH

Dolan sistematiza el ciclo de planificación en cuatro fases secuenciales:

#grid(
  columns: (1fr, 1fr, 1fr, 1fr),
  gutter: 4pt,
  rect(fill: rgb("#edf2f7"), stroke: 0.5pt + c-secondary, radius: 3pt, inset: 5pt)[
    #text(weight: "bold", size: 8pt, fill: c-primary)[Fase 1: Diagnóstico]\
    #text(size: 7.5pt)[Recopilación, análisis, balance oferta/demanda y presupuesto.]
  ],
  rect(fill: rgb("#edf2f7"), stroke: 0.5pt + c-secondary, radius: 3pt, inset: 5pt)[
    #text(weight: "bold", size: 8pt, fill: c-primary)[Fase 2: Objetivos]\
    #text(size: 7.5pt)[Metas de dotación alineadas a la estrategia corporativa.]
  ],
  rect(fill: rgb("#edf2f7"), stroke: 0.5pt + c-secondary, radius: 3pt, inset: 5pt)[
    #text(weight: "bold", size: 8pt, fill: c-primary)[Fase 3: Programación]\
    #text(size: 7.5pt)[Planes de acción: selección, formación, redistribución.]
  ],
  rect(fill: rgb("#edf2f7"), stroke: 0.5pt + c-secondary, radius: 3pt, inset: 5pt)[
    #text(weight: "bold", size: 8pt, fill: c-primary)[Fase 4: Control]\
    #text(size: 7.5pt)[Auditoría de desvíos y actualización del SIRH.]
  ]
)

= 5. Aporte a la Planificación Estratégica de RRHH

- *El personal como inversión capitalizable:* Dolan combate la visión decimonónica del personal como "gasto variable"; demuestra que las erogaciones en captación y desarrollo generan retorno financiero medible.
- *Rigor métrico:* Dota al área de un arsenal analítico (Markov, curvas de aprendizaje, regresión) para fundamentar sus pedidos presupuestarios.
- *El SIRH como columna vertebral:* Establece que la planificación estratégica no puede prosperar sin bases de datos automatizadas y fidedignas.

= 6. Énfasis de Cátedra y Clases Desgrabadas (Tips de Examen Parcial)

El análisis de las clases desgrabadas ubica a Dolan como el autor preferido por los docentes para evaluar la consistencia cuantitativa y operativa de la PERH:

#tip-catedra(title: "Concepto de Doble Dimensión (Cualitativa vs. Cuantitativa)")[
  La cátedra exige remarcar que la PERH no consiste meramente en "contar cabezas":
  - *Dimensión Cuantitativa:* El volumen numérico preciso de personas requeridas.
  - *Dimensión Cualitativa:* El perfil técnico, competencias específicas, habilidades conductuales y nivel educativo adecuado para cada puesto en el momento oportuno.
]

#alerta-parcial(title: "La Paradoja de Dolan o 'Doble Mensaje' (Pregunta Típica de Parcial)")[
  - *Pregunta clásica de examen:* _¿Cuál es la contradicción que evidencia Dolan respecto de la importancia asignada a la planificación de RRHH y su aplicación real?_
  - *Respuesta esperada:* El *100% de los profesionales* coincide en que es imprescindible y estratégica, pero solo el *16% de las organizaciones* la aplica efectivamente.
  - *Explicación del docente en clase:* La mayoría de las empresas posterga la planificación por falta de tiempo frente a los incendios del día a día, por el costo financiero de los estudios y por carecer de sistemas informáticos integrados (SIRH).
]

#tip-catedra(title: "El Cálculo de Necesidades Netas (Ejercicio Práctico de Parcial)")[
  El alumno debe dominar la lógica de cálculo:
  #align(center)[
    #rect(fill: rgb("#edf2f7"), stroke: 0.5pt + c-secondary, radius: 4pt, inset: 7pt)[
      #text(weight: "bold", size: 10pt, fill: c-primary)[
        Necesidades Netas = Demanda Proyectada - Oferta Interna Disponible
      ]
    ]
  ]

  - *Previsión de la Demanda:* Todo el personal que hace falta incorporar para cumplir las metas del negocio.
  - *Previsión de la Oferta:* La plantilla interna actual ajustada por jubilaciones, promociones y bajas estimadas, más la disponibilidad en el mercado de trabajo.
  - Si el resultado es positivo (Demanda > Oferta): se activan planes de selección y capacitación. Si es negativo (Oferta > Demanda): congelamiento de ingresos y reconversión de puestos.
]

#tip-catedra(title: "Las Cuatro Fases Secuenciales de Dolan")[
  Saber explicar el encadenamiento: Fase 1 (Diagnóstico y pronósticos) $->$ Fase 2 (Fijación de metas y políticas) $->$ Fase 3 (Programación táctica y ajuste) $->$ Fase 4 (Control de gestión y retroalimentación en el SIRH).
]
