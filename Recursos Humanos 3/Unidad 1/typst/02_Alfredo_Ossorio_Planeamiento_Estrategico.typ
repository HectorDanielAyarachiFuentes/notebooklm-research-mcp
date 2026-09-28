#set document(
  title: "Alfredo Ossorio — Planeamiento Estratégico y Planificación Situacional",
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
          Alfredo Ossorio · *Unidad 1: Planificación Estratégica*
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
    Alfredo Ossorio — Planeamiento Estratégico y Planificación Situacional
  ] \
  #v(2pt)
  #text(size: 11pt, weight: "medium", fill: c-secondary)[
    Planeamiento Estratégico (Dirección Nacional de Estudios e Investigaciones, INAP / FLACSO)
  ]
  #v(4pt)
  #line(length: 60%, stroke: 1pt + c-accent)
]

#v(8pt)

#callout(title: "Ficha Técnica del Documento", icon: "📋")[
  - *Autor:* Alfredo Ossorio (Docente e Investigador en Gestión Pública, INAP / FLACSO Argentina).
  - *Unidad Temática:* Unidad 1 — Planificación Estratégica de Recursos Humanos.
  - *Aporte Central:* Distinción etimológica y teórica entre Plan y Estrategia; ruptura con la planificación tradicional mediante la Planificación Estratégica Situacional (PES de Carlos Matus); el Triángulo de Gobierno y los Cuatro Momentos de la acción planificada.
]

= 1. Concepto Central: Distinción entre Plan y Estrategia

Alfredo Ossorio establece una diferencia conceptual clave que estructura todo su pensamiento metodológico:

- *El Plan:* Es una toma anticipada de decisiones orientada a un fin. Es un método formal de reflexión previa y concomitante con la acción humana, formulado para alcanzar un estado futuro deseado.
- *La Estrategia:* Es un *estilo y método de pensamiento dinámico* sobre la acción. A diferencia del plan formal, la estrategia reconoce que la realidad está compuesta por *múltiples actores sociales con distintas voluntades, intereses y cuotas de poder*, que interactúan en escenarios de colaboración, negociación o conflicto.

#callout(title: "Cita Clave de Ossorio")[
  _«La estrategia es el arte de conducir operaciones en un contexto donde otros juegan y tienen capacidad de incidir o bloquear nuestros propios planes.»_
]

= 2. La Ruptura Epistemológica: Planificación Tradicional vs. Situacional

Ossorio adopta la crítica formulada por Carlos Matus sobre la incapacidad de la planificación tecnocrática clásica para transformar la realidad:

#table(
  columns: (1.2fr, 1.4fr, 1.4fr),
  fill: (col, row) => if row == 0 { rgb("#edf2f7") } else if calc.odd(row) { rgb("#f7fafc") } else { white },
  stroke: 0.5pt + rgb("#cbd5e0"),
  inset: 6pt,
  [*Dimensión*], [*Planificación Tradicional (Normativa)*], [*Planificación Estratégica Situacional (PES)*],
  [Sujeto Planificador], [Técnico o experto externo que observa la realidad "desde afuera" como un objeto.], [Actor social *situado*, inmerso dentro de la misma realidad que pretende transformar.],
  [Monopolio del Plan], [Se asume que solo el Estado o la Dirección planifica.], [*Múltiples actores planifican simultáneamente* con intereses divergentes.],
  [Certeza del Futuro], [Supone un futuro predecible con diagnósticos únicos basados en certezas ("plan libro").], [Reconoce la *incertidumbre dura* y la existencia de múltiples escenarios posibles.],
  [Explicación Real], [Existe un único diagnóstico verdadero (técnico-económico).], [Existen *múltiples explicaciones situacionales* según el punto de vista del actor.],
  [Viabilidad], [Asume que lo que es técnicamente deseable es automáticamente viable.], [La *viabilidad política, económica y social* debe ser construida activamente.]
)

= 3. El Triángulo de Gobierno (Carlos Matus)

Ossorio retoma el esquema de Carlos Matus para explicar que la efectividad de cualquier conducción o gestión estratégica reside en la articulación armónica de tres vértices:

#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 6pt,
  rect(fill: rgb("#edf2f7"), stroke: 0.5pt + c-secondary, radius: 4pt, inset: 8pt)[
    #text(weight: "bold", size: 9pt, fill: c-primary)[1. Proyecto de Gobierno (PG)]\
    #v(3pt)
    #text(size: 8.5pt)[Define los objetivos, políticas, programas y transformaciones sustantivas que se buscan realizar.]
  ],
  rect(fill: rgb("#edf2f7"), stroke: 0.5pt + c-secondary, radius: 4pt, inset: 8pt)[
    #text(weight: "bold", size: 9pt, fill: c-primary)[2. Gobernabilidad (G)]\
    #v(3pt)
    #text(size: 8.5pt)[Relación entre las variables que el decisor controla y las que no controla (sindicatos, presiones del entorno).]
  ],
  rect(fill: rgb("#edf2f7"), stroke: 0.5pt + c-secondary, radius: 4pt, inset: 8pt)[
    #text(weight: "bold", size: 9pt, fill: c-primary)[3. Capacidad de Gobierno (CG)]\
    #v(3pt)
    #text(size: 8.5pt)[El acervo de pericia técnica, métodos organizacionales, destrezas y recursos humanos calificados.]
  ]
)

= 4. Los Cuatro Momentos de la Planificación Situacional

La PES no concibe etapas cronológicas cerradas, sino *cuatro momentos interdependientes y continuos* que se retroalimentan constantemente:

1. *Momento Explicativo («Fue, Es y Tiende a Ser»):* Diagnóstico situacional donde se construye el Árbol de Problemas (causas y efectos) y se mapean los actores sociales (aliados, oponentes y neutros).
2. *Momento Normativo («Debe Ser»):* Diseño de la situación objetivo o utopía viable: definición de la Misión, Visión, árbol de objetivos y metas deseadas.
3. *Momento Estratégico («Puede Ser»):* Es el puente crucial que conecta el _«Debe Ser»_ con el _«Puede Ser»_. Analiza las restricciones de poder y recursos, tejiendo alianzas y tácticas para vencer resistencias.
4. *Momento Táctico-Operacional («Hacer y Recalcular»):* Es el momento de la ejecución cotidiana. La agenda del decisor se confronta con la coyuntura y se aplica el *recálculo constante* para corregir el rumbo frente a imprevistos.

= 5. Aporte a la Planificación Estratégica de RRHH

- *El área de RRHH como actor situado:* Quien lidera Recursos Humanos no es un burócrata neutral; es un actor inmerso en el mapa de poder corporativo o institucional.
- *Políticas de personal con viabilidad política:* Las reestructuraciones y cambios de escalafón requieren *construir consensos y negociar viabilidad* con sindicatos, directivos de línea y delegados.
- *El personal como base de la Capacidad de Gobierno:* Para que cualquier proyecto institucional se concrete, Recursos Humanos debe proveer y desarrollar el talento y la motivación que nutren la *Capacidad de Gobierno (CG)*.

= 6. Énfasis de Cátedra y Clases Desgrabadas (Tips de Examen Parcial)

El análisis directo de las desgrabaciones revela los conceptos teóricos y distinciones que el docente evalúa rigurosamente en parciales:

#tip-catedra(title: "Etimología Conceptual (Pregunta Clásica de Parcial)")[
  La cátedra suele evaluar el origen lingüístico para comprobar comprensión conceptual profunda:
  - *Plan:* Deriva del latín referente al _plano_ o trazado fundacional de una edificación (el dibujo técnico previo antes de levantar el edificio). Aplicado a la gestión: _toma anticipada de decisiones para dominar la incertidumbre y no quedar a merced del azar_.
  - *Estrategia:* Proviene del ámbito militar griego (_estratega_, general o conductor del ejército). Hace alusión a la destreza de mando, intuición, lectura del terreno y capacidad de anticipar las jugadas del oponente en un escenario competitivo.
]

#tip-catedra(title: "Los Cinco Atributos del Plan")[
  El docente exige enumerar y fundamentar los cinco atributos constitutivos de todo plan:
  1. *Reflexión previa:* Pensar antes de actuar.
  2. *Reducción del azar:* Acotar las contingencias y riesgos desestabilizadores.
  3. *Anticipación de decisiones:* Prever soluciones antes de que los problemas estallen en la coyuntura.
  4. *Selección de opciones:* Evaluar alternativas y elegir fundadamente la trayectoria más conveniente.
  5. *Previsión temporal y flexibilidad:* Fijar plazos y cronogramas, pero manteniendo margen de maniobra para el ajuste.
]

#tip-catedra(title: "Atributos Clave de la Estrategia")[
  Para Ossorio y la cátedra, la estrategia reúne tres características indispensables:
  - Es *consciente:* Nace de un diagnóstico analítico metódico, no de la impulsividad.
  - Es *adaptativa:* Posee la elasticidad para pivotar frente a crisis y modificaciones imprevistas del entorno.
  - Es *condicional:* Sus logros están subordinados a las reacciones y jugadas de los demás actores involucrados.
]

#alerta-parcial(title: "Superación del 'Plan Libro'")[
  El mayor error conceptual penalizado en el examen es definir al plan como un recetario rígido y encuadernado. El planeamiento situacional exige entender que la realidad muta permanentemente y que el plan se valida y ajusta en el *recálculo constante del momento táctico-operacional*.
]
