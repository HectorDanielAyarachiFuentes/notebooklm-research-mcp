#set document(
  title: "Jorge Hintze — Control y Evaluación de Gestión y Resultados",
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
          Jorge Hintze · *Unidad 2: Auditoría y Control de RRHH*
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

#let alerta-parcial(title: "¡Alerta Clave de Examen!", body) = [
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
    Jorge Hintze — Control y Evaluación de Gestión y Resultados
  ] \
  #v(2pt)
  #text(size: 10.5pt, weight: "medium", fill: c-secondary)[
    Control y evaluación de gestión y resultados de gestión (Documentos TOP, 1999)
  ]
  #v(4pt)
  #line(length: 60%, stroke: 1pt + c-accent)
]

#v(6pt)

#callout(title: "Ficha Técnica del Documento", icon: "📋")[
  - *Autor:* Jorge Hintze (Especialista en Tecnologías de Organización Pública, Director de TOP).
  - *Unidad Temática:* Unidad 2 — Control y Auditoría de Recursos Humanos.
  - *Aporte Central:* Distinción epistemológica entre Información, Control y Evaluación; delimitación de los tres objetos de gestión (Resultados, Procesos, Organización); y conceptualización del SICE como metasistema nervioso regulador.
]

= 1. Distinciones Conceptuales Fundamentales

Jorge Hintze inicia su marco teórico estableciendo una delimitación rigurosa entre tres conceptos que suelen superponerse en la práctica administrativa: *Información*, *Control* y *Evaluación*.

== A. Información
- *Definición:* Es la representación simbólica y estructurada de la realidad mediante algún tipo de lenguaje formal (escrito, gráfico, numérico o computarizado).
- *Datos vs. Información:* Los *datos* constituyen registros directos, primarios, aislados y desprovistos de contexto o intencionalidad analítica (ej. el registro aislado de una fichada biométrica o el número nominal "8 agentes"). La *información*, en cambio, surge cuando esos datos son clasificados, ordenados, procesados y contextualizados para un decisor determinado. La información reduce la incertidumbre y habilita la toma de decisiones.

== B. Control
- *Definición:* Consiste en verificar los hechos registrados por la información, comparándolos objetivamente contra un *patrón técnico de referencia preestablecido* (norma técnica, especificación reglamentaria, estándar de rendimiento o procedimiento estandarizado).
- *Naturaleza Objetiva y Técnica:* Es una operación neutral que no emite juicios morales ni axiológicos. El control no juzga si una meta es "justa"; simplemente constata si el hecho real se adecúa o se desvía del parámetro técnico fijado. Puede actuar de forma continua: preventiva (*ex ante*), concurrente (*durante el proceso*) o inmediata posterior (*ex post*).

== C. Evaluación
- *Definición:* Implica formular *juicios de valor* (explícitos o implícitos) al contrastar la información y los desvíos registrados con *patrones de referencia valorativos*, mandatos políticos, expectativas ciudadanas o criterios de bien común.
- *Naturaleza Calificativa:* Concluye si un resultado es *favorable o desfavorable*, si un servicio es *satisfactorio o deficiente*, o si la organización cumple con su misión pública. Habitualmente se lleva a cabo al finalizar un ciclo de gestión.

= 2. Los Tres Objetos de Información, Control y Evaluación

Hintze plantea que en cualquier entidad existen tres ámbitos estructurales donde recae la mirada de gestión:

#align(center)[
  #table(
    columns: (1.2fr, 1.8fr, 2fr, 2fr),
    fill: (col, row) => if row == 0 { rgb("#edf2f7") } else if calc.even(row) { rgb("#f7fafc") } else { none },
    stroke: 0.5pt + rgb("#cbd5e0"),
    inset: (x: 6pt, y: 5pt),
    [*Objeto de Gestión*], [*Nivel de Información*], [*Nivel de Control (Técnico)*], [*Nivel de Evaluación (Valorativo)*],
    [*1. Resultados*\ _(Hacia afuera)_],
    [Registros de bienes y servicios entregados a usuarios/ciudadanos.],
    [Comparación contra metas físicas de producción y estándares pactados.],
    [Juicio sobre el impacto social, satisfacción ciudadana y efectividad global.],
    [*2. Procesos*\ _(Hacia adentro)_],
    [Registros de tiempos, secuencias operativas e insumos consumidos.],
    [Comparación contra las *"reglas del arte"* y procedimientos estándar.],
    [Juicio sobre la razonabilidad económica, productividad y erradicación del despilfarro.],
    [*3. Organización*\ _(Hacia adentro)_],
    [Inventario de la capacidad instalada: dotación, cargos, organigrama y TIC.],
    [Comparación contra normas de dotación óptima y perfiles profesiográficos.],
    [Juicio sobre la idoneidad institucional, flexibilidad y salud del clima laboral.]
  )
]

= 3. Evolución Institucional de las Prácticas de Control

Las organizaciones recorren cuatro fases históricas en el desarrollo de sus sistemas de fiscalización:

1. *Fase Inicial (Control Jerárquico Individual):* Ejercido de forma directa, visual y discrecional por los jefes y supervisores de línea. Alta dependencia de la presencia física.
2. *Fase Intermedia Jerárquica (Diferenciación de Especialistas):* Creación de oficinas específicas dedicadas al control (auditoría interna, inspección general). Los especialistas reportan directamente a la cúpula.
3. *Fase Intermedia Participativa (Transversalidad y Colegiación):* Incorporación de comités paritarios, evaluación entre pares, audiencias públicas y rendición periódica de cuentas.
4. *Fase Avanzada (Sistemas Institucionales de Control y Evaluación - SICE):* Metasistema integrado que articula tecnología digital con una cultura de autorregulación y aprendizaje continuo.

= 4. Sistemas de Gestión (SG) vs. SICE

Hintze recurre a una ilustrativa *analogía biológica*:
- *Sistemas de Gestión (SG):* Equivalen a los *músculos, huesos y órganos* del cuerpo humano. Son los procesos operativos reales que transforman insumos y prestan servicios.
- *Sistemas de Información, Control y Evaluación (SICE):* Constituyen el *sistema nervioso central* (un *metasistema*). No operan directamente; captan estímulos, miden desvíos homeostáticos respecto a los parámetros de equilibrio, emiten alertas tempranas y coordinan las respuestas para preservar la supervivencia y eficiencia de la entidad.

= 5. Articulación entre Niveles de Planificación y Control

#grid(
  columns: (1fr, 1fr),
  gutter: 8pt,
  rect(fill: rgb("#edf2f7"), stroke: 0.5pt + c-secondary, radius: 3pt, inset: 6pt)[
    #text(weight: "bold", size: 8.5pt, fill: c-primary)[Nivel Político / Estratégico]\
    #text(size: 8pt)[Se aplica la *Evaluación de Impacto y Efectividad Social*, midiendo el valor público entregado a la sociedad y el cumplimiento de la misión institucional.]
  ],
  rect(fill: rgb("#edf2f7"), stroke: 0.5pt + c-secondary, radius: 3pt, inset: 6pt)[
    #text(weight: "bold", size: 8.5pt, fill: c-primary)[Nivel Operativo / Tareas]\
    #text(size: 8pt)[Se aplica el *Control Técnico de Procesos y Productos*, fiscalizando la eficacia física, la eficiencia de insumos y el respeto irrestricto a las "reglas del arte".]
  ]
)

= 6. Énfasis de Cátedra y Clases Desgrabadas (Tips de Examen)

El análisis del cuaderno de clases desgrabadas de las docentes María Laura Cabezas y Débora aporta especificaciones concretas sobre este texto:

#alerta-parcial(title: "Estado del Texto en el Calendario de Exámenes (¡Aviso Vital!)")[
  - *Condición para el Primer Parcial:* Las docentes aclararon de forma expresa que el texto de Jorge Hintze (Texto 15) *no se llegó a desarrollar íntegramente en las clases sincrónicas del cuatrimestre, por lo cual NO ingresa en la evaluación del Primer Parcial*.
  - *Condición para el Examen Final:* *SÍ ENTRA OBLIGATORIAMENTE EN LA MESA DEL EXAMEN FINAL.* Todos los alumnos que rindan la materia en condición regular o libre deben dominar exhaustivamente sus definiciones conceptuales.
]

#tip-catedra(title: "El Ejemplo del Auto Roto: Control Técnico vs. Evaluación Subjetiva")[
  Para erradicar la confusión común entre control y evaluación, las profesoras explican:
  - *La Evaluación del Conductor:* Si a una persona se le descompone el automóvil en la ruta, emite un juicio subjetivo y valorativo: _"El auto es pésimo, no sirve más, me dejó a pata"_.
  - *El Control del Mecánico:* Cuando el vehículo ingresa al taller, el mecánico aplica un *control técnico basado en parámetros objetivos*: conecta el escáner computarizado, mide la compresión del motor, revisa voltajes y diagnostica: _"Falló el sensor de cigüeñal o se cortó el cable de embrague"_.
]

#tip-catedra(title: "El Ejemplo Médico de los Parámetros Técnicos")[
  En clase se remarcó que el médico aplica *controles objetivos*: mide la tensión arterial (parámetro estándar: 120/80 mmHg), toma el pulso y analiza glucemia en sangre. No emite opiniones intuitivas sobre si el paciente parece sano; contrasta datos contra estándares científicos.
]

#tip-catedra(title: "Conceptos 'Sí o Sí' que Exige la Cátedra")[
  1. *Diferencia estricta entre Dato e Información:* El dato es una unidad primaria sin sentido analítico; la información es el dato procesado que sustenta decisiones.
  2. *Las 'Reglas del Arte' en Procesos:* En la auditoría de procesos de RRHH se verifica que los concursos, entrevistas y liquidaciones se ejecuten respetando las normas y protocolos técnicos del oficio.
  3. *El Personal como Capacidad Instalada:* Auditar el área de personas implica examinar si la dotación y competencias existentes responden a las necesidades estructurales de la organización.
]
