#set document(
  title: "Idalberto Chiavenato — Prestaciones Sociales, CVT y Relaciones Laborales",
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
          Idalberto Chiavenato · *Unidad 3: Relaciones Humanas y Sociales*
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
    Idalberto Chiavenato — Prestaciones Sociales, CVT y Relaciones Laborales
  ] \
  #v(2pt)
  #text(size: 10.5pt, weight: "medium", fill: c-secondary)[
    Administración de Recursos Humanos (Capítulos 11, 12 y 13)
  ]
  #v(4pt)
  #line(length: 60%, stroke: 1pt + c-accent)
]

#v(6pt)

#callout(title: "Ficha Técnica del Documento", icon: "📋")[
  - *Autor:* Idalberto Chiavenato.
  - *Unidad Temática:* Unidad 3 — Relaciones Humanas y Sociales.
  - *Aporte Central:* Distinción entre Remuneración Directa e Indirecta; tipología triple de prestaciones sociales y su fundamento como factores higiénicos (Herzberg); Calidad de Vida en el Trabajo (CVT) y prevención de riesgos (actos vs. condiciones inseguras); y las cuatro políticas patronales frente a los sindicatos.
]

= 1. Capítulo 11: Planes de Prestaciones Sociales

== A. Remuneración Directa vs. Indirecta
- *Remuneración Directa:* Es el salario monetario específico fijado para cada cargo según su complejidad y escala jerárquica.
- *Remuneración Indirecta:* Es el conjunto de *prestaciones y beneficios sociales* que la entidad financia de forma común para todos sus dependientes, sin distinción de puesto.

== B. Matriz de Clasificación de las Prestaciones Sociales

#align(center)[
  #table(
    columns: (1.4fr, 1.8fr, 2.8fr),
    fill: (col, row) => if row == 0 { rgb("#edf2f7") } else if calc.even(row) { rgb("#f7fafc") } else { none },
    stroke: 0.5pt + rgb("#cbd5e0"),
    inset: (x: 6pt, y: 5pt),
    [*Criterio*], [*Tipo de Prestación*], [*Contenido y Ejemplos Prácticos*],
    [*1. Por su Exigencia Legal*],
    [*Obligatorias (Legales)*], [Exigidas por ley o CCT: SAC/Aguinaldo, vacaciones anuales pagas, adicionales por antigüedad, horas extras, SUAF/Anses y licencias legales.],
    [], [*Espontáneas (Voluntarias)*], [Concedidas por liberalidad de la empresa: vales alimentarios, préstamos blandos, seguro médico ampliado, becas de estudio y transporte.],
    [*2. Por su Naturaleza*],
    [*Económicas (Dinerarias)*], [Reflejadas en recibo o en efectivo: aguinaldo, prima vacacional, fondos de jubilación complementaria y reintegros de farmacia.],
    [], [*Extraeconómicas (Servicios)*], [En especie o facilidades: comedor en planta, refrigerios gratuitos, estacionamiento, guardería infantil y gimnasio corporativo.],
    [*3. Por sus Objetivos*],
    [*Asistenciales*], [Seguridad ante imprevistos médicos o familiares: planes de salud integral, seguro de vida colectivo y traslados sanitarios.],
    [], [*Recreativas*], [Descanso y bienestar mental: clubes deportivos, colonias infantiles de vacaciones, eventos de fin de año y pausas activas.],
    [], [*Complementarias*], [Facilidades cotidianas: comedor subsidiado, combis de traslado, cajero automático en la empresa y salas de descanso.]
  )
]

== C. Fundamentos Teóricos: Herzberg y Beneficios Flexibles
- *Las Prestaciones como Factores Higiénicos (Herzberg):* Las prestaciones no motivan por sí mismas en el largo plazo; actúan como factores profilácticos: *su ausencia desata conflictos y huelgas, pero su presencia solo previene la insatisfacción*. La motivación genuina proviene del contenido enriquecedor del puesto de trabajo.
- *Beneficios Flexibles (*_Cafeteria Plans_*):* Modelos adaptados donde el trabajador elige su paquete (combo estándar-flexible, módulos prediseñados o efectivo libre). Se incorporan nuevas prestaciones para teletrabajo (*Home Office*): pago de conectividad y laptops ergonómicas.

= 2. Capítulo 12: Higiene, Seguridad y Calidad de Vida Laboral (CVT)

== A. Higiene Industrial y Factores Ambientales
La higiene laboral tiene *carácter eminentemente preventivo*; busca erradicar las causas de enfermedades profesionales:
- *Iluminación:* Uniforme y acorde a la tarea para evitar fatiga ocular.
- *Ruido:* La exposición continua a más de 85 decibeles (db) provoca estrés y sordera profesional irreversible.
- *Riesgos Químicos:* Vapores tóxicos, solventes, formol o ácidos que exigen protección respiratoria con cartuchos químicos descartables.
- *Riesgos Físicos:* Sobrecarga en levantamiento de cargas que exige el uso de fajas lumbares certificadas.

== B. Seguridad Laboral y Accidentología
#grid(
  columns: (1fr, 1fr),
  gutter: 8pt,
  rect(fill: rgb("#fffaf0"), stroke: 0.5pt + c-border-warn, radius: 3pt, inset: 7pt)[
    #text(weight: "bold", size: 9pt, fill: c-border-warn)[Condición Insegura (Entorno Físico)]\
    #v(2pt)
    #text(size: 8pt)[
      - Falla material, mecánica o ambiental en la planta.
      - Cables pelados, pisos resbaladizos, falta de protecciones en poleas o iluminación deficiente.
    ]
  ],
  rect(fill: rgb("#fff5f5"), stroke: 0.5pt + c-border-alerta, radius: 3pt, inset: 7pt)[
    #text(weight: "bold", size: 9pt, fill: c-border-alerta)[Acto Inseguro (Conducta Humana)]\
    #v(2pt)
    #text(size: 8pt)[
      - Violación consciente o involuntaria de normas de seguridad por el trabajador.
      - No usar gafas térmicas o casco, retirar guardas de protección o manipular maquinarias con cansancio.
    ]
  ]
)

== C. Clasificación de Accidentes según la Capacidad Laboral
1. *Sin Ausencia:* Lesión leve; el trabajador recibe curación en enfermería y retoma sus tareas de inmediato.
2. *Con Ausencia:*
   - *Incapacidad Temporal:* Baja médica inferior a un año; regreso al mismo puesto sin secuelas.
   - *Incapacidad Parcial y Permanente:* Pérdida anatómica o funcional definitiva. La legislación exige la *readecuación de tareas* o reducción de jornada sin merma salarial.
   - *Incapacidad Total y Permanente:* Inhabilitación absoluta; retiro o jubilación por incapacidad dictaminada por junta médica oficial (Comisión Médica 18 / Anses).
   - *Muerte:* Fallecimiento del colaborador.

= 3. Capítulo 13: Relaciones con Empleados y Sindicatos

== Las Cuatro Políticas Patronales frente a los Sindicatos
1. *Paternalista:* Concede de inmediato todas las peticiones sindicales para evitar el choque. Genera indefensión en los supervisores y desata una espiral infinita de nuevos reclamos.
2. *Autocrática:* Rigidez extrema y legalismo intransigente. No dialoga y rechaza concesiones, alimentando el rencor y huelgas encubiertas.
3. *De Reciprocidad:* La cúpula empresarial pacta de espaldas a los supervisores de línea y de las bases con la cúpula sindical.
4. *Participativa:* Diálogo profesional fundado en datos técnicos. Involucra a los jefes de línea y busca consensos de corresponsabilidad y paz de largo plazo.

= 4. Énfasis de Cátedra y Clases Desgrabadas (Tips de Examen Oral)

A partir de las desgrabaciones oficiales de las clases de las profesoras María Laura Cabezas y Débora:

#alerta-parcial(title: "Formato del Segundo Parcial Oral en Parejas")[
  - *Metodología:* Examen oral sincrónico en parejas por orden de lista. Cinco preguntas concretas por pareja (10 a 12 minutos).
  - *Temario:* La *Unidad 3 entra completa*, sin autores excluidos.
]

#tip-catedra(title: "Ejemplos Reales Compartidos en Clase por las Docentes")[
  - *El Caso de Heladerías Grido:* Sanción judicial y de inspectores a Grido porque los dependientes que servían helado tenían los dedos negros y principios de congelamiento y artrosis por despachar a temperaturas bajo cero sin guantes térmicos.
  - *Riesgos Químicos en Fraccionamiento:* Caso de fraccionamiento de formol y ácidos que requiere máscaras con filtros químicos de reemplazo diario.
  - *Fajas Lumbares:* Obligatoriedad en carnicerías y construcción para evitar hernias de disco.
  - *Readecuación de Tareas:* Pregunta clásica sobre qué hacer ante una incapacidad parcial permanente: readecuar las funciones laborales del agente.
]
