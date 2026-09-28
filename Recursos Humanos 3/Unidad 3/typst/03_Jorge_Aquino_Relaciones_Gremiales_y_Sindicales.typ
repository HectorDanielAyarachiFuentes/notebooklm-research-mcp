#set document(
  title: "Jorge Aquino y cols. — Relaciones Gremiales y Sindicales",
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
          Jorge Aquino y cols. · *Unidad 3: Relaciones Humanas y Sociales*
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
    Jorge Aquino y cols. — Relaciones Gremiales y Sindicales
  ] \
  #v(2pt)
  #text(size: 10.5pt, weight: "medium", fill: c-secondary)[
    Recursos Humanos (Capítulo 8: "Relaciones Gremiales", Ediciones Macchi)
  ]
  #v(4pt)
  #line(length: 60%, stroke: 1pt + c-accent)
]

#v(6pt)

#callout(title: "Ficha Técnica del Documento", icon: "📋")[
  - *Autores:* Jorge A. Aquino y equipo de colaboradores.
  - *Unidad Temática:* Unidad 3 — Relaciones Humanas y Sociales.
  - *Aporte Central:* Singularidades constitutivas de las relaciones gremiales; funciones sindicales (auditoría, voz y negociación); contraste de políticas de RRHH ("Dueño" autoritario vs. "Asesor" participativo); cooperación sindicato-gerencia y la regla de incompatibilidad de Douglas McGregor; y el ideal de la Doble Lealtad.
]

= 1. Concepto y Singularidades de las Relaciones Gremiales

Jorge Aquino define las *Relaciones Gremiales* como el conjunto estructurado de interacciones, comunicaciones y negociaciones que se entablan de forma formal entre los representantes del colectivo laboral (sindicatos, comisiones internas de delegados) y los representantes de la dirección de la empresa para *tramitar quejas, reclamaciones y acuerdos recíprocos*.

== Las Cinco Características Singulares
1. *Trato entre Representantes:* Quienes negocian defienden intereses de terceros. Poseen una visión global de la empresa de la cual carecen las bases, existiendo el riesgo de que los delegados queden aislados si no comunican las conclusiones.
2. *Proyección Temporal:* Los convenios trascienden a las personas que los firmaron y perduran a lo largo de los años. Por ello, se exige fijar *cláusulas explícitas de vigencia y caducidad*.
3. *Relación de Poder y Tensión Estructural:* Escenario de confrontación legítima donde la patronal persigue *flexibilidad y productividad*, mientras que el sindicato procura *restringir la discrecionalidad patronal y tutelar el empleo*.
4. *Resolución sin Consenso Pleno:* Rara vez se arriba a una votación unánime. Se zanja por mayorías gremiales y el principio de autoridad ejecutiva.
5. *Complicaciones Intersindicales:* Disputas entre centrales obreras o fisuras internas entre la comisión de delegados de fábrica y la cúpula central del sindicato.

= 2. Las Tres Funciones de la Representación Gremial

#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 6pt,
  rect(fill: rgb("#ebf8ff"), stroke: 0.5pt + c-border-callout, radius: 3pt, inset: 6pt)[
    #text(weight: "bold", size: 8.5pt, fill: c-secondary)[1. AUDITORÍA]\
    #text(size: 8pt)[Fiscalizar el cumplimiento riguroso de leyes laborales, CCT, reglamentos internos y usos y costumbres de planta.]
  ],
  rect(fill: rgb("#e8f5e9"), stroke: 0.5pt + rgb("#388e3c"), radius: 3pt, inset: 6pt)[
    #text(weight: "bold", size: 8.5pt, fill: rgb("#1b5e20"))[2. VOZ Y CANAL]\
    #text(size: 8pt)[Órgano de resonancia para canalizar dudas, evacuar temores ante cambios tecnológicos y expresar reclamos de la base.]
  ],
  rect(fill: rgb("#fffaf0"), stroke: 0.5pt + c-border-warn, radius: 3pt, inset: 6pt)[
    #text(weight: "bold", size: 8.5pt, fill: c-border-warn)[3. NEGOCIACIÓN]\
    #text(size: 8pt)[Crear o actualizar condiciones de trabajo, paritarias salariales, categorías profesionales y adicionales por productividad.]
  ]
)

= 3. Dos Estilos de Gestión desde Recursos Humanos

#align(center)[
  #table(
    columns: (1.4fr, 2.3fr, 2.3fr),
    fill: (col, row) => if row == 0 { rgb("#edf2f7") } else if calc.even(row) { rgb("#f7fafc") } else { none },
    stroke: 0.5pt + rgb("#cbd5e0"),
    inset: (x: 6pt, y: 5pt),
    [*Criterio*], [*Política de Liderazgo (Autoritaria)*], [*Política Legalista (Participativa)*],
    [*Rol de RRHH*], [*El "Dueño":* Monopoliza el trato gremial y despoja a los jefes de línea de la conducción del personal.], [*El "Asesor":* Capacita y acompaña a los jefes de línea para que ellos mismos lideren y negocien.],
    [*Modalidad*], [Acuerdos verbales de palabra, casuísticos y cerrados sin actas para no sentar precedentes.], [Negociaciones formales y regladas con actas minuciosas que sientan precedentes transparentes.],
    [*Fundamentación*], [Subjetiva, basada en el carisma, astucia o presión del negociador.], [Objetiva, sustentada en la ley laboral, el CCT y datos técnicos demostrables.],
    [*Línea Operativa*], [Nula: Los supervisores se enteran a posteriori y pierden autoridad.], [Activa: Los jefes participan de las paritarias y son corresponsables del pacto.]
  )
]

= 4. Douglas McGregor y la Cooperación Sindicato-Gerencia

Aquino recurre al modelo de Douglas McGregor sobre las tres etapas de maduración psicológica:
1. *Etapa de Lucha y Sospecha:* Conflicto abierto, desconfianza militante y beligerancia destructiva.
2. *Etapa de Negociación Fructuosa:* Neutralidad armada; reconocimiento mutuo y transacciones concertadas.
3. *Etapa de Cooperación Genuina:* Madurez institucional; unión de esfuerzos para resolver problemas que comprometen la viabilidad de la fuente de trabajo.

#alerta-parcial(title: "La Regla de Incompatibilidad Simultánea (Principio Cardinal)")[
  - *Negociación Colectiva (Distributiva):* Esencialmente competitiva ("repartir la torta"). Se juega con _"las cartas pegadas al pecho"_ (reserva de información).
  - *Cooperación (Integrativa):* Asociativa sobre metas compartidas ("agrandar la torta": seguridad, calidad, capacitación). Se juega con _"las cartas descubiertas sobre la mesa"_.
  - *La Regla:* *Un mismo tema no puede ser simultáneamente objeto de negociación colectiva y de cooperación*. Si se mezclan en la misma mesa, el recelo destruye la cooperación.
]

= 5. Modelo Gráfico y el Ideal de la Doble Lealtad

El objetivo superior de unas relaciones laborales profesionales no es debilitar al sindicato ni forzar al obrero a elegir entre su empresa y su gremio, sino alcanzar la *Doble Lealtad*: el trabajador experimenta un sólido compromiso productivo con su empleador, al tiempo que se siente legítimamente representado por su organización sindical.

= 6. Énfasis de Cátedra y Clases Desgrabadas (Tips de Examen Oral)

A partir de las desgrabaciones oficiales de las clases de las docentes María Laura Cabezas y Débora:

#tip-catedra(title: "Preguntas Fijas de Examen Oral sobre Aquino")[
  - *Las 3 Funciones del Sindicato:* Explicar Auditoría, Voz y Negociación.
  - *El Rol de RRHH: ¿Dueño o Asesor?:* Explicar por qué la cátedra reprueba el estilo de "Dueño" (anula la autoridad de los supervisores de línea) y promueve el estilo de "Asesor" (fortalecimiento del mando medio).
  - *La Regla de Incompatibilidad de McGregor:* Justificar por qué no se puede negociar y cooperar sobre un mismo tema al mismo tiempo.
  - *Doble Lealtad:* Definición y valor para la paz organizacional.
]
