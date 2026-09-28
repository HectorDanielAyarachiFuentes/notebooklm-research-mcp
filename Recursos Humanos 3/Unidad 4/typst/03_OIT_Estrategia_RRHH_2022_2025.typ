#set document(
  title: "OIT — Estrategia de Recursos Humanos 2022-2025",
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
          OIT · *Unidad 4: Estrategia de RRHH 2022-2025*
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
    Organización Internacional del Trabajo (OIT)
  ] \
  #v(2pt)
  #text(size: 10.5pt, weight: "medium", fill: c-secondary)[
    Estrategia de Recursos Humanos 2022-2025: Diversidad, Rendición de Cuentas y Respeto
  ]
  #v(4pt)
  #line(length: 60%, stroke: 1pt + c-accent)
]

#v(6pt)

#callout(title: "Ficha Técnica del Documento", icon: "📋")[
  - *Entidad Emisora:* Organización Internacional del Trabajo (OIT / ILO, Ginebra).
  - *Unidad Temática:* Unidad 4 — Perspectiva Actual de la Gestión de Recursos Humanos e Inteligencia Artificial.
  - *Aporte Central:* Modelo estratégico multilateral de gestión del talento; las cuatro esferas transversales de competencias; inclusión, ajustes razonables y Tutorías Inversas (*Reverse Mentoring*); rendición de cuentas (*accountability*) y teletrabajo estructurado (16% tiempo global, 82% satisfacción); ética con Comité de Disciplina público; y meta del 75% de automatización de procesos.
]

= 1. Marco Institucional y Propósito Estratégico

Aprobada por el Consejo de Administración de la OIT en su 343.ª reunión, la *Estrategia de Recursos Humanos 2022-2025* define la hoja de ruta institucional para dotar al organismo de una fuerza laboral global caracterizada por los más altos niveles de *competencia, eficiencia e integridad*.

La estrategia se articula en torno a tres resultados fundamentales:
- *Resultado 1:* Fuerza de trabajo diversa y competencias para el futuro.
- *Resultado 2:* Entorno respetuoso y propicio al empoderamiento.
- *Resultado 3:* Digitalización y eficiencia operativa.

= 2. Resultado 1: Fuerza Laboral Diversa y Competencias del Futuro

== A. Las Cuatro Esferas Prioritarias Transversales de Competencias
La OIT determinó que todo su personal debe capacitarse de forma continua en cuatro ejes esenciales:
1. *Utilización de la Inteligencia Artificial:* Manejo ético y cotidiano de herramientas de IA generativa y predictiva.
2. *Análisis de Datos (*_Data Analytics_*):* Alfabetización cuantitativa y toma de decisiones fundada en evidencia empírica.
3. *Comunicación Eficaz y Estratégica:* Dominio de narrativas contemporáneas y medios digitales.
4. *Transición Ecológica y Sostenibilidad:* Integración de la sostenibilidad ambiental y la transición justa en todos los proyectos de cooperación.

== B. Inclusión Estructural y Tutorías Inversas (*Reverse Mentoring*)
- *Equilibrio Geográfico y de Género:* Políticas activas para reclutar en países subrepresentados y asegurar paridad en cargos sénior.
- *Inclusión de Personas con Discapacidad:* Pasantías financiadas y formación a evaluadores en materia de *ajustes razonables*.
- *Tutorías Inversas (*_Reverse Mentoring_*):* Funcionarios jóvenes capacitan a directivos sénior en pensamiento digital, IA y metodologías ágiles, dinamizando la cultura institucional y superando la brecha intergeneracional.

= 3. Resultado 2: Entorno Respetuoso y Empoderamiento

- *Rendición de Cuentas (*_Accountability_*):* La evaluación del desempeño se formaliza mediante el *Comité de Informes*, aplicando consecuencias formativas o desvinculación formal ante bajo rendimiento crónico.
- *Teletrabajo Híbrido Estructurado:* Establece un balance entre trabajo remoto y presencialidad mínima obligatoria. El teletrabajo representa el *16% del tiempo global de trabajo* en la Organización, alcanzando un *82% de impacto positivo en la conciliación vida-trabajo*.
- *Ética y Tolerancia Cero:* Tolerancia cero al acoso y discriminación. El *Comité de Disciplina* publica resúmenes periódicos de los casos investigados y de las sanciones impuestas.

= 4. Resultado 3: Digitalización y Eficiencia Operativa

- *Metas de Automatización:* Progresión acelerada desde el 69% en 2024 hasta la *meta del 75% de digitalización de procesos para finales de 2025*.
- *Portales de Autoservicio:* Plataformas como SHIF (reembolsos médicos autogestionados) y el archivo digital único, erradicando el papel.

= 5. Énfasis de Cátedra y Clases Desgrabadas (Tips de Examen Final)

A partir de las desgrabaciones oficiales de las clases de las profesoras María Laura Cabezas y Débora:

#alerta-parcial(title: "Estado del Texto en el Calendario Académico (¡Aviso Vital!)")[
  - *Condición para el Segundo Parcial:* Las docentes aclararon de forma taxativa que este informe de la OIT *NO INGRESA EN EL SEGUNDO PARCIAL ORAL*.
  - *Condición para el Examen Final:* *ENTRA EXCLUSIVAMENTE EN LA MESA DEL EXAMEN FINAL.* Los alumnos deben dominar sus conceptos para la instancia final de acreditación regular o libre.
]

#tip-catedra(title: "Consignas Clave para el Examen Final")[
  1. *Las Cuatro Competencias Transversales de la OIT:* IA, Analítica de Datos, Comunicación y Transición Ecológica.
  2. *El Concepto de Tutoría Inversa (*_Reverse Mentoring_*):* Explicar cómo el personal joven transfiere competencias digitales a directivos sénior.
  3. *Métricas del Teletrabajo:* Citar el 16% de tiempo global y el 82% de satisfacción en conciliación vida-trabajo.
  4. *Rendición de Cuentas y Comités:* Comité de Informes (desempeño) y Comité de Disciplina público (ética y acoso).
]
