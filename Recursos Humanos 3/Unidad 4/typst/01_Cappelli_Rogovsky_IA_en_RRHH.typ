#set document(
  title: "Cappelli, Tambe y Rogovsky — Disrupción Tecnológica e IA en RRHH",
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
          Cappelli, Tambe y Rogovsky · *Unidad 4: IA en RRHH*
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
    Peter Cappelli, Prasanna Tambe y Nikolai Rogovsky
  ] \
  #v(2pt)
  #text(size: 10.5pt, weight: "medium", fill: c-secondary)[
    Disrupción tecnológica en la gestión del talento: IA y toma de decisiones en RRHH
  ]
  #v(4pt)
  #line(length: 60%, stroke: 1pt + c-accent)
]

#v(6pt)

#callout(title: "Ficha Técnica del Documento", icon: "📋")[
  - *Autores:* Peter Cappelli, Prasanna Tambe y Nikolai Rogovsky (Wharton School / OIT).
  - *Unidad Temática:* Unidad 4 — Perspectiva Actual de la Gestión de Recursos Humanos e Inteligencia Artificial.
  - *Aporte Central:* Las 5 técnicas efectivas de gestión del talento digital; desmitificación de la neutralidad algorítmica y análisis de sesgos; algoritmos de salvaguarda; el fenómeno de los sistemas salvajes (*Shadow IT*); y la Agenda de IA Centrada en el Ser Humano (IACH) con esquemas de *Human-AI Teaming*.
]

= 1. El Salto Tecnológico y la Reconversión de RRHH

La incorporación de la *Inteligencia Artificial (IA)* y el *Machine Learning (ML)* en el mundo laboral marca un quiebre estructural respecto a las herramientas ofimáticas del pasado:
- *La Pandemia como Acelerador:* La crisis del COVID-19 obligó a virtualizar aceleradamente la selección, inducción y coordinación de equipos distribuidos.
- *Reconversión Estratégica:* El área de personal supera su rol burocrático e ingresa al comité directivo como *líder del cambio cultural y tecnológico*.

= 2. Las Cinco Técnicas de Gestión del Talento Digital

1. *Reclutamiento en Línea (*_Online Recruiting_*):* Motores semánticos y rastreo en redes profesionales (LinkedIn, GitHub) para atraer talento escaso.
2. *Evaluación Basada en Habilidades (*_Skill-Based Assessment_*):* Pruebas virtuales prácticas que miden destrezas reales de código o cálculo, superando la fe ciega en títulos impresos.
3. *Ajuste Cultural (*_Culture Fit_*):* Medición de compatibilidad entre los valores del postulante y la dinámica del equipo.
4. *Realidad Virtual y Aumentada (RV/RA):* Entornos inmersivos para capacitar en ocupaciones de alto riesgo o complejidad técnica.
5. *Selección Automatizada e IA:* Clasificación predictiva de CVs (*Random Forest*), chatbots de primera instancia y programación de agendas.

= 3. El Dilema Ético: Sesgos Algorítmicos vs. Algoritmos de Salvaguarda

#callout(title: "La Falacia de la Neutralidad Algorítmica")[
  _Los algoritmos de IA carecen de juicio ético propio. Si un modelo se entrena con bases de datos históricas de contratación que contienen sesgos de género, edad o procedencia, el algoritmo automatizará y amplificará matemáticamente esa discriminación a escala masiva._
]

#grid(
  columns: (1fr, 1fr),
  gutter: 8pt,
  rect(fill: rgb("#fffaf0"), stroke: 0.5pt + c-border-warn, radius: 3pt, inset: 7pt)[
    #text(weight: "bold", size: 9pt, fill: c-border-warn)[Filtros Ciegos (Ventaja)] \
    #v(2pt)
    #text(size: 8pt)[Programación que oculta género, fotografía, edad o domicilio, neutralizando prejuicios subjetivos del seleccionador humano.]
  ],
  rect(fill: rgb("#e8f5e9"), stroke: 0.5pt + rgb("#388e3c"), radius: 3pt, inset: 7pt)[
    #text(weight: "bold", size: 9pt, fill: rgb("#1b5e20"))[Algoritmos de Salvaguarda] \
    #v(2pt)
    #text(size: 8pt)[Protocolos técnicos de auditoría permanente que garantizan equidad, explicabilidad (_Explainable AI_) y rendición de cuentas legal.]
  ]
)

= 4. Sistemas Salvajes (*Shadow IT*) y Privacidad

El fenómeno de los *Sistemas Salvajes* surge cuando los líderes de línea o seleccionadores perciben que el software corporativo oficial de RRHH es excesivamente lento, burocrático o rígido. Como respuesta, crean *canales paralelos clandestinos* (planillas ocultas de cálculo, grupos informales de WhatsApp, contactos personales). Esto fractura la seguridad de la información institucional y rompe la gobernanza de datos.

= 5. La Agenda de IA Centrada en el Ser Humano (IACH) y *Human-AI Teaming*

Frente a la automatización ciega, la OIT y los autores postulan la *Agenda IACH*:
- *La IA como Complemento:* La tecnología asume tareas de cómputo repetitivo, liberando al profesional para aportar empatía, juicio crítico y discernimiento ético.
- *Human-AI Teaming (Equipos Humano-IA):* Esquema de cooperación donde la decisión final de empleo o despido jamás recae en una máquina, sino en el liderazgo humano responsable.

= 6. Énfasis de Cátedra y Clases Desgrabadas (Tips de Examen Oral)

A partir de las desgrabaciones oficiales de las clases de las profesoras María Laura Cabezas y Débora:

#alerta-parcial(title: "Estado del Texto en el Segundo Parcial (¡Lectura Obligatoria!)")[
  - *Condición en el Examen:* Este texto *ENTRA OBLIGATORIAMENTE EN EL SEGUNDO PARCIAL ORAL*.
  - Las docentes confirmaron que de la Unidad 4 entran solo este texto y el de Bejerman.
]

#tip-catedra(title: "El Caso McDonald's Analizado en Clase")[
  La docente compartió el caso real de selección en McDonald's para ilustrar el *Human-AI Teaming*:
  1. *Filtro 1:* Un *chatbot* valida requisitos excluyentes (edad, turnos).
  2. *Filtro 2:* Simulación digital interactiva de atención al cliente.
  3. *Instancia Final:* Entrevista presencial con el gerente de local y RRHH.
]

#tip-catedra(title: "Simulación Quirúrgica en la UNCo (Realidad Aumentada vs. Gamificación)")[
  Las docentes remarcaron la diferencia:
  - *Gamificación:* Mecánicas de juego (puntos, insignias) para competencias conductuales.
  - *Realidad Aumentada y Virtual:* Entornos inmersivos reales. Se citó el *centro de simulación de cirugías complejas de la Universidad Nacional del Comahue (UNCo)* para entrenamiento sin riesgo vital.
]
