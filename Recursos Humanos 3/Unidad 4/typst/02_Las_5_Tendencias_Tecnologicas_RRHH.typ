#set document(
  title: "Bejerman RRHH — Las 5 Tendencias Tecnológicas en RRHH",
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
          Bejerman / Thomson Reuters · *Unidad 4: Nuevas Tendencias*
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
    Bejerman RRHH — Thomson Reuters
  ] \
  #v(2pt)
  #text(size: 10.5pt, weight: "medium", fill: c-secondary)[
    Las 5 tendencias tecnológicas que revolucionarán Recursos Humanos
  ]
  #v(4pt)
  #line(length: 60%, stroke: 1pt + c-accent)
]

#v(6pt)

#callout(title: "Ficha Técnica del Documento", icon: "📋")[
  - *Autor / Fuente:* Bejerman RRHH — Thomson Reuters.
  - *Unidad Temática:* Unidad 4 — Perspectiva Actual de la Gestión de Recursos Humanos e Inteligencia Artificial.
  - *Aporte Central:* Transición de RRHH de área transaccional a socio estratégico; Libro de Sueldo Digital e interoperabilidad con AFIP/ARCA; Liquidación Cloud multi-CCT y Ganancias; People Analytics y data-driven recruitment; portal de autogestión del colaborador; y confidencialidad estricta del recibo salarial digital (firma con token y entrega solo ante oficio judicial).
]

= 1. De la Carga Burocrática al Socio Estratégico

El informe elaborado por Bejerman RRHH (Thomson Reuters) analiza la reconversión indispensable de las áreas de personal:
- *El Pasado Operativo:* Más del 70% del tiempo de RRHH se consumía en liquidación manual, archivo de planillas en papel y atención de reclamos de ventanilla.
- *El Rol Estratégico (*_HR Business Partner_*):* La tecnología en la nube automatiza las rutinas operativas, liberando al área para abocarse a la fidelización del talento, la cultura corporativa y la productividad.

= 2. Las Cinco Tendencias Tecnológicas Clave

== 1. Gestión Impositiva y Salarial Digital (Libro de Sueldo Digital y Liquidación Cloud)
- *Interoperabilidad con AFIP/ARCA (AFIP 4.0):* El software de nómina genera de forma automatizada las declaraciones juradas mensuales de aportes y contribuciones (Formulario 931) mediante el Libro de Sueldo Digital, eliminando inconsistencias registrales y multas fiscales.
- *Liquidación Multi-Convenio y Ganancias:* Motores de cálculo en la nube que gestionan simultáneamente múltiples Convenios Colectivos de Trabajo (CCT) y automatizan las deducciones progresivas del Impuesto a las Ganancias (4ª categoría) procesando el F. 572 (SiRADIG).
- *Recibo Digital y Firma con Token:* Implementación de recibos electrónicos firmados con token respaldado por el RENAPER, con plena validez jurídica.

== 2. People Analytics y Reclutamiento Basado en Datos (*Data-Driven Recruitment*)
- *De la Corazonada al Dato:* Sustitución de la intuición del seleccionador por modelos predictivos de Big Data.
- *Tableros de Control en Tiempo Real:* Monitoreo automatizado de la rotación temprana, costo de horas extras vs. nuevas contrataciones, ausentismo justificado e injustificado y retorno de inversión (ROI) en capacitación.

== 3. Trabajo Colaborativo y Descentralizado (Teletrabajo y Modelos Híbridos)
- *Entornos Distribuidos:* Soporte a equipos que operan sin supervisión visual continua.
- *Métricas Post-Pandemia:* Entre el 50% y el 60% de las empresas mantuvieron esquemas remotos o híbridos permanentes.

== 4. Autogestión del Empleado (*Self-Service HR*)
- *Desintermediación Operativa:* Portales web y apps donde el trabajador tramita licencias, consulta saldos de vacaciones, carga certificados médicos y descarga recibos de sueldo las 24 horas sin intermediación administrativa.

== 5. Evaluación de Desempeño Digital y Mapeo del Talento
- *Feedback Continuo Multi-Fuente:* Evaluaciones de 90°, 180° y 360° articuladas con metas OKRs.
- *Matriz 9-Box:* Mapeo cruzado de desempeño versus potencial para planificar cuadros de reemplazo en puestos críticos.

= 3. Los Tres Pilares de Valor al Negocio

#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 6pt,
  rect(fill: rgb("#e8f5e9"), stroke: 0.5pt + rgb("#388e3c"), radius: 3pt, inset: 6pt)[
    #text(weight: "bold", size: 8.5pt, fill: rgb("#1b5e20"))[1. Gestión del Talento]\
    #v(2pt)
    #text(size: 8pt)[Atracción, desarrollo y retención del talento clave respaldada en métricas objetivas.]
  ],
  rect(fill: rgb("#ebf8ff"), stroke: 0.5pt + c-border-callout, radius: 3pt, inset: 6pt)[
    #text(weight: "bold", size: 8.5pt, fill: c-secondary)[2. Eficiencia Operativa]\
    #v(2pt)
    #text(size: 8pt)[Supresión del papel, circuitos desintermediados y respuesta inmediata mediante autogestión.]
  ],
  rect(fill: rgb("#fffaf0"), stroke: 0.5pt + c-border-warn, radius: 3pt, inset: 6pt)[
    #text(weight: "bold", size: 8.5pt, fill: c-border-warn)[3. Blindaje Normativo]\
    #v(2pt)
    #text(size: 8pt)[Cumplimiento estricto de las leyes laborales, previsionales y fiscales, erradicando multas.]
  ]
)

= 4. Énfasis de Cátedra y Clases Desgrabadas (Tips de Examen Oral)

A partir de las desgrabaciones oficiales de las clases de las docentes María Laura Cabezas y Débora:

#alerta-parcial(title: "Estado del Texto en el Segundo Parcial (¡Lectura Obligatoria!)")[
  - *Condición en el Examen:* El texto de Bejerman sobre las 5 Tendencias *ENTRA OBLIGATORIAMENTE EN EL SEGUNDO PARCIAL ORAL*.
  - Las docentes confirmaron que es uno de los dos textos evaluados de la Unidad 4.
]

#tip-catedra(title: "La Confidencialidad Salarial y la Muerte del Chisme de Pasillo")[
  La docente María Laura Cabezas destacó el impacto humano del Recibo de Sueldo Digital:
  - *El vicio del pasado:* La planilla física en papel que circulaba de mano en mano entre escritorios exponía el salario de todos los agentes, desatando envidias y el *"chisme salarial"*.
  - *Privacidad Inviolable:* Con el recibo digital y firma con Token (RENAPER), el salario es estrictamente confidencial.
  - *Regla Legal Estricta de la Docente:* El área de RRHH tiene *prohibición absoluta* de exhibir o entregar recibos a terceros (ni cónyuges, parientes o jefes de otros sectores). La información salarial solo puede revelarse ante un *oficio judicial formal emitido por un juez competente*.
]

#tip-catedra(title: "Consignas Típicas de Examen Señaladas por las Docentes")[
  1. *Describir las 5 tendencias tecnológicas que revolucionan RRHH.*
  2. *Explicar cómo el Libro de Sueldo Digital y la Liquidación Cloud mitigan riesgos impositivos y laborales.*
  3. *Definir People Analytics y contrastarlo con la "corazonada" del seleccionador tradicional.*
  4. *Explicar cómo la Autogestión del Empleado beneficia tanto al trabajador como a la función estratégica de RRHH.*
]
