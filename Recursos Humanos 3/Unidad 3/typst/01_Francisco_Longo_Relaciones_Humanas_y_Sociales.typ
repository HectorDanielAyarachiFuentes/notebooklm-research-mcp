#set document(
  title: "Francisco Longo — Relaciones Humanas y Sociales en el Servicio Civil",
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
          Francisco Longo · *Unidad 3: Relaciones Humanas y Sociales*
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
    Francisco Longo — Relaciones Humanas y Sociales en el Servicio Civil
  ] \
  #v(2pt)
  #text(size: 10.5pt, weight: "medium", fill: c-secondary)[
    Marco Analítico para el Diagnóstico Institucional de Sistemas de Servicio Civil (BID, 2002)
  ]
  #v(4pt)
  #line(length: 60%, stroke: 1pt + c-accent)
]

#v(6pt)

#callout(title: "Ficha Técnica del Documento", icon: "📋")[
  - *Autor:* Francisco Longo (Especialista en Gobernanza y Servicio Civil, ESADE / BID).
  - *Unidad Temática:* Unidad 3 — Relaciones Humanas y Sociales.
  - *Aporte Central:* Conceptualización del subsistema en el tercer nivel transversal del Servicio Civil; definición estricta de la dimensión colectiva; articulación de los tres bloques (Clima, Relaciones Laborales y Políticas Sociales); y superación de las patologías burocráticas del empleo público.
]

= 1. Ubicación Estructural y Concepto del Subsistema

Francisco Longo sitúa el *Subsistema de Gestión de las Relaciones Humanas y Sociales* en el *tercer nivel (inferior)* de su marco analítico institucional. Lejos de constituir un área burocrática aislada, posee un *carácter eminentemente transversal*: se vincula y condiciona la viabilidad de todos los demás subsistemas del Servicio Civil (Planificación, Organización del Trabajo, Gestión del Empleo, Rendimiento, Compensaciones y Desarrollo).

= 2. La Dimensión Colectiva (Eje Fundamental)

La delimitación metodológica que define este subsistema frente a otras funciones de personal descansa en su *perspectiva colectiva*:
- *Qué NO gestiona:* No se ocupa de las relaciones interpersonales individuales (antipatías, problemas de convivencia entre dos compañeros o quejas particulares de un escritorio). Esas cuestiones atañen a la supervisión operativa directa de la línea.
- *Qué SÍ gestiona:* Estructura las relaciones entre la administración pública y sus servidores cuando las políticas y prácticas adquieren una *dimensión colectiva e institucional*. El interlocutor de la dirección no es el empleado individual, sino la *totalidad de la plantilla* o colectivos socioprofesionales y sindicales organizados.

#callout(title: "Definición Medular de Longo")[
  _El subsistema gestiona las relaciones entre la organización y sus empleados cuando las políticas de personal adquieren dimensión colectiva, asegurando la cohesión institucional, la equidad de trato y la paz social necesaria para la continuidad del servicio público._
]

= 3. Los Tres Procesos Estructurales del Subsistema

#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 6pt,
  rect(fill: rgb("#e8f5e9"), stroke: 0.5pt + rgb("#388e3c"), radius: 3pt, inset: 6pt)[
    #text(weight: "bold", size: 8.5pt, fill: rgb("#1b5e20"))[1. Clima Organizativo]\
    #v(2pt)
    #text(size: 8pt)[
      - Comunicación bidireccional formal (ascendente y descendente).
      - Erradicación del secretismo jerárquico.
      - Encuestas periódicas de clima y sentido de pertenencia.
    ]
  ],
  rect(fill: rgb("#fffaf0"), stroke: 0.5pt + c-border-warn, radius: 3pt, inset: 6pt)[
    #text(weight: "bold", size: 8.5pt, fill: c-border-warn)[2. Relaciones Laborales]\
    #v(2pt)
    #text(size: 8pt)[
      - Vínculos con sindicatos y comisiones de delegados.
      - Paritarias y negociación colectiva formal.
      - Acuerdos sobre salarios y condiciones de trabajo.
    ]
  ],
  rect(fill: rgb("#fce4ec"), stroke: 0.5pt + rgb("#c2185b"), radius: 3pt, inset: 6pt)[
    #text(weight: "bold", size: 8.5pt, fill: rgb("#880e4f"))[3. Políticas Sociales]\
    #v(2pt)
    #text(size: 8pt)[
      - Salud y seguridad ocupacional (CVT).
      - Programas de bienestar no dinerarios.
      - Beneficios de asistencia familiar y ergonomía preventiva.
    ]
  ]
)

== El Cambio de Paradigma en la Comunicación Interna
Longo y el equipo docente enfatizan la necesidad de quebrar el viejo vicio burocrático donde los mandos medios retenían la información creyendo que _"la información es poder"_. El modelo moderno promueve la transparencia total mediante intranets, correos masivos, boletines informativos y buzones de sugerencias vinculantes.

= 4. Puntos Críticos y Patologías en el Sector Público

Longo diagnostica cinco tensiones estructurales en el empleo público:
1. *Déficit Crónico de Comunicación:* Aislamiento de las bases y sensación generalizada de que las decisiones directivas se transmiten con opacidad y tardanza.
2. *Reactividad de la Gerencia Pública:* Las autoridades suelen carecer de estrategia sindical; esperan a que estalle la huelga o el corte de servicios para sentarse a negociar bajo urgencia.
3. *Politización Partidaria:* Riesgo de que la patronal estatal ceda prebendas a los gremios afines por razones electorales, quebrando la meritocracia y el presupuesto.
4. *Carencia de Mecanismos de Mediación:* Falta de instancias reglamentadas de arbitraje neutral que resuelvan controversias antes de paralizar funciones esenciales.
5. *Sostenibilidad Fiscal:* Necesidad de que los beneficios y licencias cuenten con respaldo presupuestario real para no desfinanciar al Estado.

= 5. Énfasis de Cátedra y Clases Desgrabadas (Tips de Examen Oral)

A partir de las desgrabaciones oficiales de las docentes María Laura Cabezas y Débora, se destacan los siguientes núcleos evaluativos:

#alerta-parcial(title: "Dinámica del Segundo Parcial Oral (¡En Parejas y Virtual!)")[
  - *Modalidad de Examen:* El Segundo Parcial es un *examen oral sincrónico en parejas*, asignadas por orden alfabético estricto en el Siu Guaraní.
  - *Duración y Estructura:* Se formulan *5 preguntas puntuales por pareja* en un lapso de 10 a 12 minutos.
  - *Alcance:* La *Unidad 3 ENTRA COMPLETA* (Longo, Chiavenato Cap. 11, 12 y 13, y Aquino).
]

#tip-catedra(title: "Pregunta Fija de Examen: La Dimensión Colectiva en Longo")[
  Las docentes indagan expresamente: _"¿Qué gestiona este subsistema y por qué Longo insiste en que no atiende cuestiones interpersonales individuales?"_.
  - *Respuesta esperada:* Aclarar que no resuelve rencillas personales entre compañeros de oficina, sino las relaciones institucionales colectivas con la totalidad de la fuerza laboral y sus organizaciones gremiales.
]

#tip-catedra(title: "Ejemplos Reales Compartidos en Clase por las Docentes")[
  - *Caminatas y Bicicleteadas de Fin de Semana:* El caso de una responsable de RRHH que transformó un clima laboral profundamente hostil convocando a jornadas recreativas familiares los sábados, derribando jerarquías rígidas.
  - *Proyectos Solidarios Interáreas:* La articulación de abogadas, médicas y personal de servicios generales en campañas navideñas de recolección de juguetes, demostrando cómo las políticas sociales unifican la cultura institucional.
]
