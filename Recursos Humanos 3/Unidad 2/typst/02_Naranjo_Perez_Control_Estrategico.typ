#set document(
  title: "Naranjo Pérez y cols. — El Control Estratégico",
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
          Naranjo Pérez y cols. · *Unidad 2: Auditoría y Control de RRHH*
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
    Naranjo Pérez, Mesa Espinosa y Solera Salas — El Control Estratégico
  ] \
  #v(2pt)
  #text(size: 10.5pt, weight: "medium", fill: c-secondary)[
    El control estratégico. Lo que no debemos obviar
  ]
  #v(4pt)
  #line(length: 60%, stroke: 1pt + c-accent)
]

#v(6pt)

#callout(title: "Ficha Técnica del Documento", icon: "📋")[
  - *Autores:* Remberto Naranjo Pérez, María Antonieta Mesa Espinosa y José Solera Salas.
  - *Unidad Temática:* Unidad 2 — Control y Auditoría de Recursos Humanos.
  - *Aporte Central:* Desplazamiento del control retrospectivo al control prospectivo; subsistema de vigilancia del entorno; clasificación de las dos categorías de control (medición y regulación del comportamiento/recompensas); y articulación de los tres niveles con el factor humano como inductor primario de eficiencia.
]

= 1. Naturaleza y Génesis del Control Estratégico

Naranjo Pérez y su equipo sitúan la aparición del *Control Estratégico* como una respuesta imprescindible a la consolidación de la Dirección Estratégica en entornos de alta incertidumbre y competencia. 

Los autores sostienen que el control estratégico no puede reducirse a una mera etapa cronológica final que audita balances contables al concluir el año, sino que constituye un *proceso directivo continuo y prospectivo* que acompaña permanentemente la formulación, ejecución y reformulación de los planes en todos los niveles institucionales.

= 2. Control Tradicional vs. Control Estratégico

Para comprender el nuevo paradigma, los autores establecen una rigurosa comparación:

#align(center)[
  #table(
    columns: (1.5fr, 2.5fr, 2.5fr),
    fill: (col, row) => if row == 0 { rgb("#edf2f7") } else if calc.even(row) { rgb("#f7fafc") } else { none },
    stroke: 0.5pt + rgb("#cbd5e0"),
    inset: (x: 6pt, y: 5pt),
    [*Criterio Metodológico*], [*Control Tradicional / Operativo*], [*Control Estratégico*],
    [*Enfoque Temporal*],
    [*Retrospectivo:* Evalúa el pasado cotejando lo ejecutado frente a lo presupuestado.],
    [*Prospectivo y Preventivo:* Proyectado hacia el futuro, monitoreando tendencias y escenarios.],
    [*Variables de Análisis*],
    [Numéricas, financieras, cuantitativas y cerradas departamentalmente.],
    [Cualitativas y cuantitativas, multidimensionales y abiertas al ecosistema.],
    [*Relación con el Entorno*],
    [Organización como sistema cerrado; el entorno externo se ignora o se asume estático.],
    [Organización como sistema abierto; incorpora *vigilancia continua y alerta temprana*.],
    [*Mecanismo de Corrección*],
    [Mecanicista, órdenes jerárquicas y penalización punitiva.],
    [*Aprendizaje organizacional*, reformulación de supuestos y alineación de conductas.],
    [*Alcance Institucional*],
    [Restringido a la supervisión y a las áreas contables de auditoría.],
    [*Descentralizado y transversal:* compromete a la totalidad de los colaboradores.]
  )
]

#callout(title: "Principio Fundamental de los Autores")[
  _El control estratégico no es un instrumento de persecución burocrática, sino un dispositivo directivo para aprender del entorno y traducir la estrategia corporativa en conductas concretas de los colaboradores._
]

= 3. El Monitoreo del Entorno y la Vigilancia Estratégica

En ambientes dinámicos, las premisas sobre las que se trazó el plan pueden caducar con rapidez. Por ello, el control estratégico institucionaliza la *vigilancia del entorno*:
- *Captación de Señales Débiles:* Monitoreo temprano de modificaciones en la legislación laboral, transformaciones en la demanda de los usuarios, adelantos tecnológicos o cambios gremiales.
- *Flexibilidad Estratégica:* Habilita a la alta dirección a recalcular metas y redistribuir dotaciones antes de que los desvíos se transformen en crisis terminales.

= 4. El Perfil del Controlador Estratégico

El éxito del sistema descansa primordialmente en el liderazgo y perfil de quienes lo coordinan:
1. *Voluntad Estratégica:* Firmeza para sostener el rumbo hacia los objetivos de largo plazo frente a las presiones de la coyuntura diaria.
2. *Orientación activa al Cambio:* Capacidad para dinamizar la cultura organizativa y cuestionar las inercias burocráticas del _"siempre se hizo así"_.
3. *Tolerancia constructiva al Error:* Entender que en procesos de innovación el error no debe castigarse destructivamente, sino capitalizarse como aprendizaje institucional.

= 5. Las Dos Grandes Categorías de Control (Johnson y Scholes)

Uno de los marcos centrales adoptados por los autores (y solicitado recurrentemente en parciales) es la distinción propuesta por Gerry Johnson y Kevan Scholes:

#grid(
  columns: (1fr, 1fr),
  gutter: 8pt,
  rect(fill: rgb("#e8f5e9"), stroke: 0.5pt + rgb("#388e3c"), radius: 3pt, inset: 7pt)[
    #text(weight: "bold", size: 9pt, fill: rgb("#1b5e20"))[1. Sistemas de Información y Medición]\
    #v(2pt)
    #text(size: 8pt)[
      - Baterías de indicadores clave (Eficacia, Eficiencia, Economía y Calidad).
      - Tableros de control y balances de gestión.
      - Auditoría del grado de cumplimiento de los objetivos pactados.
    ]
  ],
  rect(fill: rgb("#fce4ec"), stroke: 0.5pt + rgb("#c2185b"), radius: 3pt, inset: 7pt)[
    #text(weight: "bold", size: 9pt, fill: rgb("#880e4f"))[2. Regulación del Comportamiento]\
    #v(2pt)
    #text(size: 8pt)[
      - Evaluación continua del esfuerzo individual y grupal.
      - *Sistemas de recompensas:* incentivos económicos, carrera y retribución.
      - Reconocimiento simbólico y conformación de una cultura participativa.
    ]
  ]
)

= 6. Tres Niveles de Diseño del Control Estratégico

- *Nivel Estratégico (Alta Dirección):* Asignación de recursos globales, definición de políticas corporativas, sustentabilidad institucional y evaluación de clima general.
- *Nivel Táctico (Gerencias Funcionales / Mandos Medios):* Coordinación interdepartamental (RRHH, Producción, Finanzas) y cumplimiento de programas de mediano plazo.
- *Nivel Operativo (Primera Línea de Supervisión):* Control administrativo frecuente (diario o semanal) orientado a fiscalizar tareas específicas y resolver desvíos de manera inmediata.

== Centros de Responsabilidad
Para erradicar la imposición verticalista de metas, la organización se segmenta en *Centros de Responsabilidad*: dependencias con autonomía para *negociar, consensuar y autogestionar sus propios indicadores de control*, generando un alto sentido de corresponsabilidad en los resultados.

= 7. Factores Clave de Éxito y el Modelo de Philippe Lorino

Para no saturar a los directivos con infinidad de datos irrelevantes (*infoxicación*), se aplica el modelo de Lorino para fijar los *Puntos Críticos de Control*:

#grid(
  columns: (1fr, 1fr, 1fr, 1fr),
  gutter: 4pt,
  rect(fill: rgb("#edf2f7"), stroke: 0.5pt + c-secondary, radius: 3pt, inset: 5pt)[
    #text(weight: "bold", size: 8pt, fill: c-primary)[1. Recopilación]\
    #text(size: 7.5pt)[Mapeo de todas las actividades institucionales.]
  ],
  rect(fill: rgb("#edf2f7"), stroke: 0.5pt + c-secondary, radius: 3pt, inset: 5pt)[
    #text(weight: "bold", size: 8pt, fill: c-primary)[2. Determinación]\
    #text(size: 7.5pt)[Identificación de procesos que agregan valor real.]
  ],
  rect(fill: rgb("#edf2f7"), stroke: 0.5pt + c-secondary, radius: 3pt, inset: 5pt)[
    #text(weight: "bold", size: 8pt, fill: c-primary)[3. Elección]\
    #text(size: 7.5pt)[Selección priorizada de los factores críticos de éxito.]
  ],
  rect(fill: rgb("#edf2f7"), stroke: 0.5pt + c-secondary, radius: 3pt, inset: 5pt)[
    #text(weight: "bold", size: 8pt, fill: c-primary)[4. Eficiencia]\
    #text(size: 7.5pt)[Batería final de indicadores sobre inductores de eficiencia.]
  ]
)

#callout(title: "El Personal como Inductor Primario de Eficiencia")[
  Los autores concluyen que las competencias, la motivación y el clima humano constituyen los verdaderos *inductores de eficiencia* que explican el éxito o fracaso de cualquier tecnología o proceso operativo.
]

= 8. Énfasis de Cátedra y Clases Desgrabadas (Tips de Examen Parcial)

El cuaderno de clases de las profesoras María Laura Cabezas y Débora aporta especificaciones concretas sobre este texto:

#alerta-parcial(title: "Estado del Texto en el Primer Parcial (¡Lectura Obligatoria!)")[
  - *Condición en el Examen:* A diferencia del texto de Hintze, el artículo de Naranjo Pérez y cols. *ENTRA OBLIGATORIAMENTE en el Primer Parcial*.
  - *Aviso del Docente:* Al tratarse de una síntesis clara y concentrada de solo 5 páginas, la cátedra suele formular al menos una consigna obligatoria sobre sus modelos.
]

#tip-catedra(title: "Pregunta Fija 1: Los Tres Niveles de Diseño del Control Estratégico")[
  En el parcial suelen pedir clasificar y diferenciar los tres niveles:
  1. *Estratégico:* Alta dirección, visión global, asignación presupuestaria y sustentabilidad.
  2. *Táctico:* Mandos medios, coordinación entre gerencias y ejecución de planes sectoriales.
  3. *Operativo:* Corto plazo, muy frecuente (diario/semanal), control directo de tareas y corrección inmediata de fallas.
]

#tip-catedra(title: "Pregunta Fija 2: Las Dos Grandes Categorías de Control")[
  La cátedra exige explicar por qué el control estratégico no se limita a métricas contables:
  - *Categoría de Información/Medición:* Indicadores de eficacia, eficiencia y economía.
  - *Categoría de Regulación de Conductas:* Destacar el papel fundamental del *sistema de recompensas* (remuneración variable, planes de carrera, reconocimiento simbólico) como mecanismo para orientar el esfuerzo de las personas hacia las metas de la organización.
]

#tip-catedra(title: "Advertencia Docente: Evitar el Lenguaje Coloquial")[
  Las profesoras enfatizaron en las devoluciones de parciales que muchos alumnos sacan bajas notas porque definen el control estratégico con palabras informales (ej. _"controlar que a la empresa le vaya bien"_). Exigen el uso riguroso del vocabulario de los autores: *vigilancia del entorno, señales débiles, centros de responsabilidad, inductores de eficiencia y regulación de conductas*.
]
