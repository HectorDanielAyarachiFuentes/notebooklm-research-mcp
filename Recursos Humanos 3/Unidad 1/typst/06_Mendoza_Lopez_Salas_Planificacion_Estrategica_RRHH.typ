#set document(
  title: "Mendoza, López y Salas — Planificación Estratégica de Recursos Humanos",
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
          Mendoza, López y Salas · *Unidad 1: Planificación Estratégica*
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
    Mendoza, López y Salas — Planificación Estratégica de RRHH
  ] \
  #v(2pt)
  #text(size: 11pt, weight: "medium", fill: c-secondary)[
    Planificación estratégica de recursos humanos: Efectiva forma de identificar necesidades de personal
  ]
  #v(4pt)
  #line(length: 60%, stroke: 1pt + c-accent)
]

#v(8pt)

#callout(title: "Ficha Técnica del Documento", icon: "📋")[
  - *Autores:* Darcy Mendoza Fernández, Dany López Juvinao y Edwin Salas Solano (Revista Económicas CUC, 2015).
  - *Unidad Temática:* Unidad 1 — Planificación Estratégica de Recursos Humanos.
  - *Aporte Central:* La metáfora de la «Función Sombrilla» de la PERHH; el Análisis y Descripción de Puestos como piedra angular; los tres pilares de necesidad estratégica (Milkovich y Boudreau); el modelo de seis fases secuenciales.
]

= 1. Concepto de Planificación Estratégica de RRHH (PERHH)

Mendoza, López y Salas definen la *Planificación Estratégica de Recursos Humanos (PERHH)* como:

#callout(title: "Definición Central de los Autores")[
  _El proceso directivo, dinámico y proactivo mediante el cual una organización analiza sistemáticamente sus necesidades presentes y futuras de talento humano en función de un entorno cambiante, con el fin de situar al número adecuado de personas capacitadas, con las competencias requeridas, en los puestos correctos y en el momento preciso._
]

== La «Función Sombrilla» de la PERHH
Los autores introducen la sugerente metáfora de la *función sombrilla*:
- La PERHH no es un simple trámite administrativo aislado de selección o liquidación salarial.
- Funciona como un *gran paraguas integrador* que cobija, articula y orienta todas las políticas, prácticas, normativas y la filosofía de gestión de personas.
- Conecta el planeamiento corporativo con los subsistemas de selección, inducción, formación, evaluación de desempeño y planes de carrera.

= 2. La Piedra Angular: El Análisis y Descripción de Puestos

Para los autores, ningún modelo de planificación estratégica puede prosperar sin bases técnicas sólidas:
- *El Análisis y Descripción de Puestos es el cimiento insoslayable* de la PERHH.
- Determina con exactitud los deberes, responsabilidades, condiciones de trabajo y los *requisitos o competencias mínimas* requeridas para cada posición.
- Sirve como patrón objetivo indispensable para:
  1. El perfil de búsqueda en el reclutamiento.
  2. La evaluación objetiva del desempeño y la detección de brechas formativas.
  3. La equidad salarial interna y la competitividad externa.

= 3. Razones de Importancia Estratégica

Mendoza et al. destacan tres motivos críticos por los cuales las organizaciones modernas deben implementar la PERHH:

1. *Retención en Calidad y Cantidad:* Evita la fuga de talento calificado en un mercado laboral altamente disputado y previene tanto el déficit como la sobrepoblación de personal.
2. *Previsión del Desfase Temporal (Lead Time):* Entre el momento en que se detecta una vacante y el momento en que el nuevo colaborador está efectivamente seleccionado, contratado y operando con productividad plena transcurre un período considerable. La PERHH anticipa esta ventana de tiempo.
3. *Reducción de la Rotación y el Ausentismo:* Diseña planes de acogida, motivación y desarrollo que disminuyen drásticamente los costosos índices de rotación no deseada.

= 4. Fases Integradas del Proceso de PERHH

Los autores articulan las propuestas clásicas en un esquema estructurado de seis fases:

#table(
  columns: (1.2fr, 2.8fr),
  fill: (col, row) => if row == 0 { rgb("#edf2f7") } else if calc.odd(row) { rgb("#f7fafc") } else { white },
  stroke: 0.5pt + rgb("#cbd5e0"),
  inset: 6pt,
  [*Fase*], [*Acciones y Metodología*],
  [1. Análisis], [Diagnóstico integral, inventario de competencias y **análisis/descripción de puestos (la base)**.],
  [2. Previsión], [Estimación de las demandas cualitativas y cuantitativas futuras de personal.],
  [3. Programación], [Diseño de metodologías específicas de reclutamiento, formación, redistribución y retención.],
  [4. Realización], [Ejecución práctica de las actividades programadas en el terreno.],
  [5. Control], [Monitoreo continuo de desvíos frente a las metas pautadas.],
  [6. Presentación de Resultados], [Rendición de cuentas e informes ejecutivos de gestión a la alta dirección.]
)

= 5. Aporte a la Planificación Estratégica de RRHH

- *Gestión por Competencias y Planes de Carrera:* Demuestran que la planificación de personal no busca simplemente "llenar casilleros vacíos", sino gestionar de forma integral las competencias y el desarrollo profesional de los colaboradores.
- *Transformación del Rol de RRHH:* El área de talento humano deja de ser una gestoría de sueldos reactiva para erigirse en un *socio estratégico del negocio*.
- *Aplicabilidad Mixta:* Su modelo metodológico resulta igualmente operativo para empresas del sector privado como para organismos del sector público.

= 6. Énfasis de Cátedra y Clases Desgrabadas (Tips de Examen Parcial)

El análisis pedagógico de las clases de la cátedra resalta los siguientes ejes críticos para la evaluación:

#tip-catedra(title: "La PERH como 'Horizonte Institucional'")[
  La docente remarca con énfasis que la planificación estratégica de personal no debe concebirse jamás como un evento puntual o aislado, sino como una *práctica permanente y un compromiso de aprendizaje continuo en toda la organización*.
]

#tip-catedra(title: "Capacidad de Anticipación Integral de Movimientos")[
  La PERH debe gestionar preventivamente los dos grandes flujos de personal:
  - *Flujos Internos:* Planes de carrera, promociones verticales, transferencias horizontales y programas de reconversión laboral.
  - *Flujos Externos:* Estrategias de captación de talento en el mercado, desvinculaciones planificadas y planes de retiro/jubilación ordenados.
]

#alerta-parcial(title: "Los Tres Pilares de Importancia (Pregunta Clásica de Parcial)")[
  La cátedra suele pedir explicar por qué planificar evita el caos operativo:
  1. *Retener el Talento en Cantidad y Calidad:* La docente remarca que la retención no se logra únicamente con aumentos salariales coyunturales, sino estructurando planes de desarrollo profesional, buen clima laboral y desafíos motivantes.
  2. *Anticipar el Desfase Temporal (Lead Time):* El docente remarca en clase que contratar a un profesional calificado lleva meses (búsqueda, entrevistas, inducción, curva de aprendizaje). Sin planificación, el puesto queda vacante y paraliza la operación.
  3. *Controlar y Disminuir la Rotación Innecesaria:* La rotación caótica de personal destruye el capital intelectual y encarece los costos operativos. Una organización con alta rotación denota falta de previsión estratégica.
]

#tip-catedra(title: "Estructura de las 6 Fases (Pregunta de Desarrollo)")[
  Memorizar y saber justificar la secuencia: Análisis $->$ Previsión $->$ Programación $->$ Realización $->$ Control $->$ Presentación de Resultados, destacando que el *Análisis y Descripción de Puestos* es la piedra angular sobre la que se edifica todo el modelo.
]
