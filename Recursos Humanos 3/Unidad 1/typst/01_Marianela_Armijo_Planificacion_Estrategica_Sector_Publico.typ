#set document(
  title: "Marianela Armijo — Planificación Estratégica en el Sector Público",
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
          Marianela Armijo · *Unidad 1: Planificación Estratégica*
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
    Marianela Armijo — Planificación Estratégica en el Sector Público
  ] \
  #v(2pt)
  #text(size: 11pt, weight: "medium", fill: c-secondary)[
    Manual de Planificación Estratégica e Indicadores de Desempeño en el Sector Público (ILPES / CEPAL)
  ]
  #v(4pt)
  #line(length: 60%, stroke: 1pt + c-accent)
]

#v(8pt)

#callout(title: "Ficha Técnica del Documento", icon: "📋")[
  - *Autora:* Marianela Armijo (Consultora Área de Políticas Presupuestarias y Gestión Pública, ILPES/CEPAL).
  - *Unidad Temática:* Unidad 1 — Planificación Estratégica de Recursos Humanos.
  - *Aporte Central:* Metodología de Gestión por Resultados (GpR), articulación entre metas y presupuesto fiscal, tipología de cuatro indicadores de desempeño y encadenamiento de valor público.
]

= 1. Concepto y Enfoque Central

Marianela Armijo aborda la *Planificación Estratégica (PE)* desde la óptica de la *Gestión por Resultados (GpR)* y la modernización del Estado. Para la autora:

#callout(title: "Definición Central de PE")[
  _La planificación estratégica es una herramienta de gestión orientada a definir prioridades, objetivos y estrategias, sirviendo como base ineludible para la toma de decisiones y la asignación eficiente de los recursos públicos (financieros y humanos)._
]

== La Articulación con el Presupuesto y Dotaciones
Uno de los aportes centrales de Armijo es que la planificación estratégica no puede concebirse como un ejercicio teórico o documental aislado:
- La PE pierde sentido y aplicabilidad si no se encuentra estrechamente vinculada al *presupuesto y a la programación financiera plurianual*.
- Los planes de recursos humanos deben justificarse en términos del costo fiscal y de la capacidad real de financiar la dotación de personal necesaria para alcanzar los productos estratégicos comprometidos.

= 2. Componentes Estratégicos Institucionales

Armijo desglosa la arquitectura de la planificación en cinco piezas fundamentales:

1. *Misión Institucional:* Es la razón de ser de la entidad u organización pública. Responde a: _¿Quiénes somos? ¿Qué hacemos? ¿Para quiénes lo hacemos? ¿Qué bienes o servicios (productos estratégicos) entregamos y qué valor público generamos?_
2. *Visión Institucional:* Proyección y valores compartidos sobre la situación futura deseada a largo plazo (+10 años). Orienta la dirección hacia donde la institución aspira llegar.
3. *Objetivos Estratégicos:* Expresión concreta de los logros o resultados que la organización se propone alcanzar en un plazo específico (2 a 4 años). Deben ser claros, medibles y orientados a resolver los problemas identificados.
4. *Estrategias y Planes de Acción Operativos:* Las vías o cursos de acción para cerrar la brecha entre el estado actual y los objetivos estratégicos, detallando cronogramas y requerimientos presupuestarios y de dotación.
5. *Indicadores de Desempeño y Metas:* Parámetros cuantitativos y cualitativos que permiten monitorear sistemáticamente el grado de cumplimiento de los objetivos.

= 3. Niveles Organizacionales y Tipos de Indicadores

Armijo establece una correlación directa entre los *niveles de decisión organizacional* y los tipos de control e indicadores:

#table(
  columns: (1.2fr, 1.2fr, 1.4fr, 1.8fr),
  fill: (col, row) => if row == 0 { rgb("#edf2f7") } else if calc.odd(row) { rgb("#f7fafc") } else { white },
  stroke: 0.5pt + rgb("#cbd5e0"),
  inset: 6pt,
  [*Nivel*], [*Tipo de Plan*], [*Foco de Medición*], [*Dimensión Evaluada*],
  [Alta Dirección], [Planificación Estratégica], [Global e Institucional], [*Impacto y Resultado Final:* Efectos en la ciudadanía y usuarios.],
  [Nivel Directivo], [Control de Gestión], [Programas / Centros de Responsabilidad], [*Eficacia, Eficiencia, Economía y Calidad* en productos estratégicos.],
  [Nivel Operativo], [Control de Actividades], [Tareas y Procesos Cotidianos], [*Insumos y Procesos:* Horas de trabajo, costos unitarios, tiempos de ciclo.]
)

= 4. Etapas del Proceso de Planificación

El modelo propuesto por Armijo se desarrolla de forma secuencial y articulada en cinco etapas:

#grid(
  columns: (1fr, 1fr, 1fr, 1fr, 1fr),
  gutter: 4pt,
  rect(fill: rgb("#edf2f7"), stroke: 0.5pt + c-secondary, radius: 3pt, inset: 5pt)[
    #text(weight: "bold", size: 8pt, fill: c-primary)[1. Diagnóstico]\
    #text(size: 7.5pt)[Análisis FODA y problemas sustantivos.]
  ],
  rect(fill: rgb("#edf2f7"), stroke: 0.5pt + c-secondary, radius: 3pt, inset: 5pt)[
    #text(weight: "bold", size: 8pt, fill: c-primary)[2. Misión y Visión]\
    #text(size: 7.5pt)[Consenso directivo sobre el rumbo institucional.]
  ],
  rect(fill: rgb("#edf2f7"), stroke: 0.5pt + c-secondary, radius: 3pt, inset: 5pt)[
    #text(weight: "bold", size: 8pt, fill: c-primary)[3. Objetivos]\
    #text(size: 7.5pt)[Priorización con verbos en infinitivo.]
  ],
  rect(fill: rgb("#edf2f7"), stroke: 0.5pt + c-secondary, radius: 3pt, inset: 5pt)[
    #text(weight: "bold", size: 8pt, fill: c-primary)[4. Planes de Acción]\
    #text(size: 7.5pt)[Asignación de dotación y presupuesto.]
  ],
  rect(fill: rgb("#edf2f7"), stroke: 0.5pt + c-secondary, radius: 3pt, inset: 5pt)[
    #text(weight: "bold", size: 8pt, fill: c-primary)[5. Indicadores]\
    #text(size: 7.5pt)[Monitoreo continuo y rendición de cuentas.]
  ]
)

= 5. Aporte Específico a la Planificación de RRHH

- *Del gasto al valor público:* Los recursos humanos en el sector público no se gestionan meramente como un costo salarial, sino como la *capacidad instalada esencial* para proveer los bienes y servicios estratégicos del Estado.
- *Justificación de dotaciones:* Cualquier ampliación, reestructuración o plan de capacitación de personal debe guardar estricta correspondencia con los *objetivos estratégicos y metas de impacto* fijadas en el plan institucional.
- *Criterios de evaluación multidimensional:* Introduce las cuatro dimensiones clave (*Eficacia, Eficiencia, Economía y Calidad*) para auditar la contribución del personal al logro de las políticas públicas.

= 6. Énfasis de Cátedra y Clases Desgrabadas (Tips de Examen Parcial)

A partir del análisis exhaustivo de las clases desgrabadas de la materia, el equipo docente subraya los siguientes puntos ineludibles para las evaluaciones parciales:

#alerta-parcial(title: "Regla de Oro en Objetivos Estratégicos (Corrección Estricta en Parcial)")[
  - *Estructura obligatoria:* Los objetivos estratégicos deben redactarse *siempre iniciando con un verbo de acción en infinitivo* (sin conjugar).
  - *Prohibición terminante del docente:* Queda terminantemente *prohibido* utilizar verbos ambiguos o blandos como _"fomentar"_, _"promover"_, _"procurar"_ o _"contribuir"_. La cátedra explica que estos términos expresan meras intenciones o expresiones de deseo que no determinan un producto concreto ni permiten construir un indicador de resultado medible.
  - *Ejemplo corregido en clase:* En vez de formular _"Promover la salud pública a nivel nacional"_, la redacción técnica correcta exigida es: _"Garantizar la cobertura del programa de atención primaria pediátrica en las zonas sanitarias prioritarias"_.
]

#tip-catedra(title: "Misión como Brújula vs. Visión como Faro")[
  - *Misión Institucional:* La docente enfatiza que la misión debe responder obligatoriamente a cuatro preguntas operativas: _¿Qué hace la organización?_, _¿Cuáles son sus productos/servicios estratégicos?_, _¿A qué usuarios o beneficiarios se dirige?_ y _¿Cuáles son sus valores y localización distintiva?_. Si falta alguna de estas dimensiones en la formulación, la respuesta se considera incompleta.
  - *Visión Institucional:* No es un objetivo de corto plazo; es la proyección a largo plazo (horizonte de 10 años o más) que representa el horizonte valorativo hacia donde la institución orienta todas sus energías.
]

#tip-catedra(title: "Análisis FODA Riguroso")[
  La docente advierte que el FODA suele aplicarse de forma _"trillada"_ o superficial. Para el parcial exige clasificar con precisión quirúrgica:
  - *Factores Internos (Bajo control directo de la organización):* Fortalezas y Debilidades.
  - *Factores Externos (Variables del entorno que la entidad no controla):* Oportunidades y Amenazas.
]

#tip-catedra(title: "Tipología de los Cuatro Indicadores de Desempeño (Pregunta Fija de Examen)")[
  La cátedra exige definir y distinguir con precisión técnica las cuatro dimensiones:
  
  1. *Eficacia:* Mide el grado de cumplimiento de los objetivos y metas finales alcanzados, sin considerar los costos. \
     _Ejemplo de clase:_ Porcentaje de participantes que aprueban un programa de capacitación respecto al total de inscriptos.
  2. *Eficiencia:* Mide la relación entre los recursos empleados (presupuesto, horas, personal) y los productos obtenidos (productividad / costo unitario). \
     _Ejemplo de clase:_ Costo medio por expediente tramitado o cantidad de inspecciones laborales por inspector al mes.
  3. *Economía:* Mide la capacidad de movilizar, administrar y ejecutar oportunamente los recursos financieros asignados. \
     _Ejemplo de clase:_ Porcentaje de ejecución presupuestaria respecto del crédito vigente o ratio de cobranzas sobre facturación.
  4. *Calidad:* Mide la satisfacción de los usuarios, oportunidad, celeridad y exactitud técnica en la entrega del servicio. \
     _Ejemplo de clase:_ Tiempo promedio de espera en ventanilla o índice de satisfacción ciudadana medido por encuestas periódicas.
]
