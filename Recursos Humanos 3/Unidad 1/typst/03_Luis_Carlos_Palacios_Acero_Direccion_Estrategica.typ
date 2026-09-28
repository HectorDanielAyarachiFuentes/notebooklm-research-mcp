#set document(
  title: "Luis Carlos Palacios Acero — Dirección Estratégica",
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
          Palacios Acero · *Unidad 1: Planificación Estratégica*
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
    Luis Carlos Palacios Acero — Dirección Estratégica
  ] \
  #v(2pt)
  #text(size: 11pt, weight: "medium", fill: c-secondary)[
    Dirección Estratégica: Fundamentos, Instrumental y Evolución Empresarial (Ecoe Ediciones)
  ]
  #v(4pt)
  #line(length: 60%, stroke: 1pt + c-accent)
]

#v(8pt)

#callout(title: "Ficha Técnica del Documento", icon: "📋")[
  - *Autor:* Luis Carlos Palacios Acero (Especialista en Gerencia y Dirección Estratégica).
  - *Unidad Temática:* Unidad 1 — Planificación Estratégica de Recursos Humanos.
  - *Aporte Central:* Evolución de la empresa (Máquina $->$ Sistémica $->$ Social); niveles institucionales de decisión; perspectiva de Aprendizaje y Crecimiento en el Balanced Scorecard (BSC); articulación de estrategias deliberadas y emergentes.
]

= 1. Concepto de Dirección Estratégica

Luis Carlos Palacios Acero concibe la *Dirección Estratégica* como un proceso integral de liderazgo organizacional:

#callout(title: "Definición de Dirección Estratégica")[
  _El arte y la ciencia de poner en práctica y desarrollar todo el potencial de la organización para asegurar su supervivencia y sostenibilidad a largo plazo, elevando continuamente su competitividad, eficacia, eficiencia y productividad en entornos dinámicos e inciertos._
]

La dirección estratégica supera la simple planificación estática de escritorio: es un proceso gerencial continuo que enlaza el diagnóstico del entorno con la capacidad operativa y humana para ejecutar, aprender y transformar.

= 2. Evolución Histórica de los Estados Empresariales

Palacios Acero describe cómo ha evolucionado la concepción de la empresa y del factor humano a lo largo de las distintas etapas de la administración:

#table(
  columns: (1fr, 1.5fr, 1.5fr),
  fill: (col, row) => if row == 0 { rgb("#edf2f7") } else if calc.odd(row) { rgb("#f7fafc") } else { white },
  stroke: 0.5pt + rgb("#cbd5e0"),
  inset: 6pt,
  [*Modelo de Empresa*], [*Concepción del Trabajador*], [*Características de Gestión*],
  [1. Empresa Máquina], [Mero engranaje mecánico sustituible sin iniciativa.], [Taylorismo / Fayolismo: control coercitivo, división fragmentada del trabajo, esquemas piramidales cerrados y relaciones autoritarias.],
  [2. Empresa Sistémica], [Operador tecnificado dentro de un subsistema interdependiente.], [Teoría General de Sistemas: organización como sistema abierto que intercambia información y recursos con el entorno; procesos formalizados.],
  [3. Empresa Social\ *(Paradigma Actual)*], [*Artífice primordial de la innovación* y ventaja competitiva sustentable.], [Organismo vivo: el eje se desplaza hacia la salud integral, seguridad, clima laboral, desarrollo continuo, motivación y bienestar humano.]
)

= 3. Modelo Dinámico de Formación de Estrategias

Palacios Acero propone un ciclo continuo y adaptativo donde interactúan cuatro componentes esenciales:

#align(center)[
  #rect(fill: rgb("#f7fafc"), stroke: 0.5pt + c-accent, radius: 4pt, inset: (x: 10pt, y: 7pt))[
    #text(size: 9pt, weight: "bold", fill: c-primary)[
      Análisis Estratégico $arrow.l.r$ Formulación Estratégica $arrow.l.r$ Planificación $arrow.l.r$ Implantación y Control
    ]
  ]
]

== Estrategias Deliberadas vs. Estrategias Emergentes
El autor adopta la perspectiva de Henry Mintzberg: la estrategia real ejecutada por una firma no es únicamente lo que se planificó originalmente en el papel (*estrategia deliberada o planeada*), sino la síntesis que surge cuando el plan interactúa con los imprevistos, oportunidades y aprendizajes del terreno cotidiano (*estrategias emergentes*).

= 4. Niveles de Prospectiva y Decisión Empresarial

La dirección estratégica opera simultáneamente en tres niveles jerárquicos y temporales:

#table(
  columns: (1.2fr, 1fr, 1.8fr, 1.2fr),
  fill: (col, row) => if row == 0 { rgb("#edf2f7") } else if calc.odd(row) { rgb("#f7fafc") } else { white },
  stroke: 0.5pt + rgb("#cbd5e0"),
  inset: 6pt,
  [*Nivel Jerárquico*], [*Horizonte*], [*Foco Principal*], [*Responsable*],
  [Institucional / Estratégico], [Largo Plazo (3 a 5+ años)], [Misión global, posicionamiento de mercado, diversificación y cultura.], [Directorio y Alta Dirección.],
  [Táctico / Funcional], [Mediano Plazo (1 a 3 años)], [Coordinación y asignación de recursos por áreas (RRHH, Finanzas, Operaciones).], [Gerentes de Departamento.],
  [Operacional], [Corto Plazo (Día a día)], [Ejecución de rutinas, cronogramas de tareas y estándares de calidad.], [Supervisores y Jefes.]
)

= 5. Instrumental de Planeación y Gestión

Palacios Acero presenta un amplio instrumental metodológico:
- *Balanced Scorecard (BSC / Cuadro de Mando Integral):* Traduce la visión y estrategia en cuatro perspectivas: Financiera, Clientes, Procesos Internos, y *Aprendizaje y Crecimiento (donde reside el talento humano)*.
- *Matriz DOFA / FODA:* Cruce sistemático de factores internos y externos.
- *Diagrama de Ishikawa (Espina de Pescado):* Análisis de causas raíces en fallas operativas.
- *Gráficas de Gantt y Redes PERT/CPM:* Programación y secuenciación de actividades críticas.
- *Metodología TRIZ:* Teoría de resolución inventiva de problemas sin duplicar costos.

= 6. Aporte a la Planificación Estratégica de RRHH

- *El talento como activo de diferenciación:* En la *Empresa Social*, la tecnología y las máquinas se pueden copiar o comprar, pero el conocimiento tácito, las competencias distintivas y el compromiso del personal son inimitables.
- *Perspectiva de Aprendizaje en el BSC:* Sitúa al factor humano en la base de la cadena causal de valor: el personal capacitado y motivado es el único capaz de optimizar los procesos internos y satisfacer a los usuarios.

= 7. Énfasis de Cátedra y Clases Desgrabadas (Tips de Examen Parcial)

El cotejo exhaustivo con las desgrabadas de las clases teóricas y prácticas arroja una advertencia fundamental para la preparación del estudiante:

#alerta-parcial(title: "¡Aviso Crítico de Cátedra para el Examen Parcial!")[
  - *Estado del texto para el parcial:* El equipo docente aclaró expresamente en el aula que el texto de Luis Carlos Palacios Acero *NO se llegó a impartir por restricciones de tiempo en el cronograma y NO entra en los temas evaluables del examen parcial*.
  - *Alcance para el Examen Final:* Su lectura se reserva para aquellos estudiantes que rindan la materia en condición regular o libre en las mesas de examen final de la carrera.
]

#tip-catedra(title: "Conceptos Clave para la Instancia de Examen Final")[
  Si este autor es evaluado en el examen final, los docentes priorizan los siguientes ejes temáticos:
  1. *Evolución de la Empresa:* Diferenciar con claridad la *Empresa Máquina* (taylorista, hombre-herramienta sustituible), la *Empresa Sistémica* (intercambio funcional de insumos) y la *Empresa Social* (salud integral, compromiso y desarrollo humano).
  2. *Balanced Scorecard y Factor Humano:* Explicar por qué la perspectiva de _Aprendizaje y Crecimiento_ (competencias del personal, clima laboral, sistemas de información) es el cimiento indispensable de todo el cuadro de mando.
  3. *Estrategias Deliberadas vs. Emergentes:* Demostrar que en la gestión de recursos humanos la estrategia real es una síntesis continua entre lo programado y lo que emerge en las relaciones de trabajo cotidianas.
]
