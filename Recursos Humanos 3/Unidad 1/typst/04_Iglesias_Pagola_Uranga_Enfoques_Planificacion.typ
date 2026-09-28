#set document(
  title: "Iglesias, Pagola y Uranga — Enfoques de Planificación",
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
          Iglesias, Pagola y Uranga · *Unidad 1: Planificación Estratégica*
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
    Martín Iglesias, Cecilia Pagola y Washington Uranga — Enfoques de Planificación
  ] \
  #v(2pt)
  #text(size: 11pt, weight: "medium", fill: c-secondary)[
    Enfoques de Planificación: Paradigmas, Proferencia vs. Prospectiva y Modelos de Gestión (UNLP)
  ]
  #v(4pt)
  #line(length: 60%, stroke: 1pt + c-accent)
]

#v(8pt)

#callout(title: "Ficha Técnica del Documento", icon: "📋")[
  - *Autores:* Martín Iglesias, Cecilia Pagola y Washington Uranga (UNLP / UBA).
  - *Unidad Temática:* Unidad 1 — Planificación Estratégica de Recursos Humanos.
  - *Aporte Central:* La triple dimensión de la planificación (Cognitiva, Política, Práctica); distinción epistemológica entre Proferencia y Prospectiva (Merello); comparación sistemática entre Enfoque Normativo, Situacional y Prospectivo; matriz de Kaplún.
]

= 1. La Planificación como Función de Gestión Integral

Iglesias, Pagola y Uranga definen la planificación no como una mera técnica burocrática, sino como una *fase constitutiva e ineludible de la gestión*:

#callout(title: "Definición Central")[
  _La planificación es un proceso reflexivo, analítico y sistemático que diseña los pasos orientados a intervenir sobre la realidad para transformarla, dotando de sentido y direccionalidad a la acción colectiva._
]

Los autores postulan que toda planificación articula simultáneamente tres dimensiones indisolubles:
1. *Dimensión Cognitiva:* Los saberes teóricos, métodos, marcos conceptuales y diagnósticos de información que fundamentan el análisis.
2. *Dimensión Política:* La intencionalidad transformadora, la distribución del poder, los valores en juego y la disputa por el sentido del cambio social o institucional.
3. *Dimensión Práctica / Operativa:* El conjunto de dispositivos, tácticas, cronogramas y asignación de recursos que materializan la acción.

= 2. Proferencia vs. Prospectiva (Aporte de Agustín Merello)

Siguiendo al teórico Agustín Merello, los autores diferencian dos formas radicalmente distintas de relacionarse con el porvenir:

#table(
  columns: (1.1fr, 1.4fr, 1.5fr),
  fill: (col, row) => if row == 0 { rgb("#edf2f7") } else if calc.odd(row) { rgb("#f7fafc") } else { white },
  stroke: 0.5pt + rgb("#cbd5e0"),
  inset: 6pt,
  [*Criterio*], [*Proferencia*], [*Prospectiva*],
  [Punto de Partida], [*El pasado y el presente*.], [*El futuro deseado*.],
  [Lógica Metodológica], [Extrapola tendencias estadísticas e históricas hacia adelante: _«¿Qué pasará si las cosas continúan funcionando como hasta hoy?»_], [Se instala prioritariamente en el futuro objetivo y **viaja desde el porvenir hacia el presente** para construir los caminos de acción.],
  [Enfoques Incluidos], [Planificación Normativa Clásica y Planificación Estratégica Situacional (PES).], [Planificación Prospectiva Estratégica Participativa.],
  [Rol del Futuro], [El futuro es un destino predeterminado o condicionado por el pasado.], [El futuro es un **espacio múltiple y abierto a la creación social**.]
)

= 3. Tipología de los Tres Grandes Estilos de Planificación

Los autores estructuran la evolución del pensamiento planificador en tres grandes corrientes:

1. *Planificación Normativa (Clásica / Tradicional):*
   - *Quién planifica:* Un técnico externo o equipo de expertos de gabinete cerrado (*unipersonal*).
   - *Método:* Se plasma en el **«plan libro»** encuadernado y rígido. Asume un futuro certero y predecible, apoyándose estrictamente en reglamentos, leyes y formulaciones tecnocráticas.
2. *Planificación Estratégica Situacional (PES / Carlos Matus):*
   - *Quién planifica:* Múltiples actores sociales con cuotas de poder y visiones encontradas.
   - *Método:* Parte del análisis situacional del presente real para construir viabilidad política y técnica hacia la situación deseada, gestionando alianzas, conflictos y negociaciones.
3. *Planificación Prospectiva Estratégica (Participativa):*
   - *Quién planifica:* Procesos descentralizados, colectivos y dialógicos.
   - *Método:* Diseña colectivamente escenarios futuros utópicos y viables (*«el futuro deseado»*) y traza la trayectoria desde ese horizonte hacia el presente.

= 4. Matriz de Gabriel Kaplún: Racionalidades y Actores

Los autores integran el modelo de Gabriel Kaplún que cruza el eje de los actores con el eje de la racionalidad:

#table(
  columns: (1.5fr, 2.5fr),
  fill: (col, row) => if row == 0 { rgb("#edf2f7") } else if calc.odd(row) { rgb("#f7fafc") } else { white },
  stroke: 0.5pt + rgb("#cbd5e0"),
  inset: 6pt,
  [*Cuadrante de Kaplún*], [*Características del Estilo de Planificación*],
  [Cuadrante A: Tradicional / Burocrática], [Planificación tecnocrática rígida, verticalista, centrada en normas y exclusiva de expertos.],
  [Cuadrante B: Estratégica Directiva], [Planificación moderna orientada a metas gerenciales y resultados de mercado.],
  [Cuadrante C: Asamblearia / Formal], [Espacios participativos donde se discuten tareas cotidianas pero sin rigor estratégico.],
  [Cuadrante D: Participativa Dialógica], [*Óptimo comunicacional:* directivos y colaboradores co-diseñan el rumbo institucional mediante aprendizaje colectivo.]
)

= 5. Aporte a la Planificación Estratégica de RRHH

- *La dimensión comunicacional del trabajo:* Los planes de Recursos Humanos no son esquemas fríos; son *dispositivos de comunicación social* que dotan de legitimidad, sentido y compromiso al esfuerzo de los trabajadores.
- *Integración de los saberes de los colaboradores:* Las políticas de dotación y carrera ganan efectividad cuando incorporan las opiniones prácticas y aspiraciones de los empleados.
- *Superación del "Plan Libro":* Enseña al área de RRHH a sustituir las directivas rígidas por procesos dialógicos y adaptables de planeamiento.

= 6. Énfasis de Cátedra y Clases Desgrabadas (Tips de Examen Parcial)

A partir de las clases desgrabadas, el docente sitúa a este texto como el eje central para evaluar modelos epistemológicos de planificación:

#tip-catedra(title: "Comparación de los Tres Modelos (Pregunta Obligatoria de Examen)")[
  La cátedra exige estructurar la respuesta distinguiendo taxativamente:
  1. *Enfoque Normativo (Clásico):*
     - *Actor:* **Uno solo** (planificador tecnocrático unipersonal externo a la realidad).
     - *Instrumento:* El **«plan libro»**; rígido, estructurado y ceñido a normas escritas. Concibe el futuro como una certeza previsible.
  2. *Enfoque Estratégico Situacional (Matus):*
     - *Actor:* **Múltiples actores sociales** con distintas cuotas de poder, intereses y visiones.
     - *Instrumento:* Diagnóstico del presente real para construir viabilidad política y técnica hacia la situación deseada.
  3. *Enfoque Prospectivo Estratégico:*
     - *Actor:* Procesos participativos y colectivos.
     - *Instrumento:* Se ubica prioritariamente en el **futuro deseado** y, desde allí, realiza una mirada retrospectiva hacia el presente.
]

#tip-catedra(title: "Distinción Teórica Clave: Proferencia vs. Prospectiva (Tip de Examen)")[
  Pregunta muy frecuente de parcial:
  - *Proferencia:* Mira el presente apoyándose en el **pasado**; extrapola tendencias históricas y datos preexistentes hacia adelante. Abarca tanto al modelo normativo como al situacional.
  - *Prospectiva:* Mira desde el presente hacia el **futuro deseado**; inventa el porvenir colectivo sin quedar encadenado a la inercia o fatalidad del pasado.
]

#alerta-parcial(title: "Criterio de Evaluación Pedagógica del Docente")[
  El docente aclara explícitamente en clase que **ningún enfoque debe calificarse como 'bueno o malo' en términos absolutos**. En las organizaciones reales conviven los tres enfoques; la idoneidad de cada uno depende de la urgencia del problema, la estabilidad del contexto y la cultura organizacional.
]
