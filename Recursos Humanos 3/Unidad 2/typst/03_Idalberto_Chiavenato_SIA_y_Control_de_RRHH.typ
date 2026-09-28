#set document(
  title: "Idalberto Chiavenato — Sistemas de Información y Control de RRHH",
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
          Idalberto Chiavenato · *Unidad 2: Auditoría y Control de RRHH*
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
    Idalberto Chiavenato — Sistemas de Información y Control de RRHH
  ] \
  #v(2pt)
  #text(size: 10.5pt, weight: "medium", fill: c-secondary)[
    Administración de Recursos Humanos (Cap. 16: Sistema de Información y Auditoría de RRHH)
  ]
  #v(4pt)
  #line(length: 60%, stroke: 1pt + c-accent)
]

#v(6pt)

#callout(title: "Ficha Técnica del Documento", icon: "📋")[
  - *Autor:* Idalberto Chiavenato (Tratadista y referente clásico de Administración de Personal).
  - *Unidad Temática:* Unidad 2 — Control y Auditoría de Recursos Humanos.
  - *Aporte Central:* Distinción epistemológica entre Dato e Información; Banco de Datos relacional; evolución de los métodos de procesamiento; diseño del SIRH articulando Responsabilidad de Línea y Función de Staff; y el ciclo de 4 etapas de control.
]

= 1. Datos vs. Información: La Cadena de Procesamiento

Idalberto Chiavenato construye el marco de referencia adoptado por la cátedra para delimitar con rigurosidad el insumo elemental respecto al producto cognitivo útil para la toma de decisiones:

#grid(
  columns: (1fr, 1.2fr, 1fr),
  gutter: 6pt,
  rect(fill: rgb("#edf2f7"), stroke: 0.5pt + rgb("#cbd5e0"), radius: 3pt, inset: 6pt)[
    #text(weight: "bold", size: 8.5pt, fill: c-primary)[1. DATO]\
    #text(size: 8pt)[Registro primario, nominal, aislado y descontextualizado. Carece de significado analítico por sí mismo (ej. "8 agentes", una fichada "08:02").]
  ],
  rect(fill: rgb("#ebf8ff"), stroke: 0.5pt + c-border-callout, radius: 3pt, inset: 6pt)[
    #text(weight: "bold", size: 8.5pt, fill: c-secondary)[2. PROCESAMIENTO]\
    #text(size: 8pt)[Clasificación, cálculo, tabulación, almacenamiento lógico y contextualización en un sistema estructurado.]
  ],
  rect(fill: rgb("#e8f5e9"), stroke: 0.5pt + rgb("#388e3c"), radius: 3pt, inset: 6pt)[
    #text(weight: "bold", size: 8.5pt, fill: rgb("#1b5e20"))[3. INFORMACIÓN]\
    #text(size: 8pt)[Conjunto de datos estructurados con significado, intencionalidad y pertinencia que reduce la incertidumbre y habilita decisiones.]
  ]
)

= 2. El Banco de Datos de Recursos Humanos

El *Banco de Datos* es un sistema articulado de almacenamiento y acumulación de registros interconectados lógicamente, diseñado para centralizar la memoria institucional, suprimir la duplicación de archivos y erradicar redundancias documentales.

#align(center)[
  #table(
    columns: (1.8fr, 3.2fr),
    fill: (col, row) => if row == 0 { rgb("#edf2f7") } else if calc.even(row) { rgb("#f7fafc") } else { none },
    stroke: 0.5pt + rgb("#cbd5e0"),
    inset: (x: 6pt, y: 5pt),
    [*Registro del Banco de Datos*], [*Contenido Específico y Propósito*],
    [*1. Registro de Personal*\ _(Inventario de Habilidades)_], [Datos filiatorios, domicilio, títulos educativos, historial de cargos, evaluaciones de desempeño y competencias evaluadas.],
    [*2. Registro de Puestos*], [Descripciones funcionales, perfiles de competencias exigidas, requisitos formales de ingreso y ocupantes actuales de cada cargo.],
    [*3. Registro de Secciones / Áreas*], [Distribución de la dotación por gerencias, departamentos, delegaciones regionales y centros de costo asignados.],
    [*4. Registro de Remuneraciones*], [Sueldos básicos, adicionales por convenio, horas extras, deducciones de ley, embargos e historial de incrementos salariales.],
    [*5. Registro de Beneficios Sociales*], [Planes de cobertura médica, seguros de vida colectivos, subsidios asistenciales, guarderías y programas de bienestar.],
    [*6. Registros Especiales*], [Postulantes en procesos de selección externa, cursos de capacitación en curso y legajos disciplinarios con antecedentes de sanciones.]
  )
]

= 3. Los Tres Métodos de Procesamiento de Datos

Chiavenato clasifica la evolución tecnológica del procesamiento de datos en tres modalidades históricas:
1. *Método Manual:* Trabajo artesanal sobre fichas de cartulina, carpetas colgantes y planillas manuscritas. Lento, vulnerable a pérdidas físicas y con alta tasa de errores de transcripción.
2. *Método Semiautomático:* Combina tareas manuales con el apoyo de planillas electrónicas (Excel) o máquinas de calcular. Los archivos funcionan de forma aislada y sin actualización en red.
3. *Método Automático (Sistemas Computarizados Integrados):* Ingreso único del dato y procesamiento distribuido en bases de datos relacionales. Permite consultas simultáneas, cálculos inmediatos y reportes gerenciales en tiempo real.

= 4. El Sistema de Información de Recursos Humanos (SIRH)

El *SIRH* es una red organizada de procedimientos e interfaces computarizadas que alimenta de información veraz a la toma de decisiones.

== La Doble Dimensión: Responsabilidad de Línea y Función de Staff
Esta conceptualización es el corazón doctrinario del texto de Chiavenato:

#grid(
  columns: (1fr, 1fr),
  gutter: 8pt,
  rect(fill: rgb("#fffaf0"), stroke: 0.5pt + c-border-warn, radius: 3pt, inset: 7pt)[
    #text(weight: "bold", size: 9pt, fill: c-border-warn)[Responsabilidad de Línea (Jefes de Sector)]\
    #v(2pt)
    #text(size: 8pt)[
      - Cada jefe, supervisor o gerente posee la *autoridad jerárquica y de mando directa* sobre su equipo.
      - Asigna tareas cotidianas, lidera el trabajo, fiscaliza la asistencia, evalúa el rendimiento y aplica sanciones.
    ]
  ],
  rect(fill: rgb("#ebf8ff"), stroke: 0.5pt + c-border-callout, radius: 3pt, inset: 7pt)[
    #text(weight: "bold", size: 9pt, fill: c-secondary)[Función de Staff (Área de RRHH)]\
    #v(2pt)
    #text(size: 8pt)[
      - El departamento de personal actúa como una *unidad de asesoría técnica y consultoría interna*.
      - *No tiene mando jerárquico* sobre los empleados de otras áreas operativas. Administra el SIRH, diseña políticas y asesora a los jefes de línea.
    ]
  ]
)

= 5. Jornada Laboral y Disciplina Progresiva

- *Gestión Moderna de la Jornada:* El SIRH administra modelos flexibles como el horario flexible (*flextime*), la semana laboral comprimida (4 días de 10 hs), el teletrabajo híbrido y los bancos de horas de compensación.
- *De la Disciplina Coercitiva al Autocontrol:* Chiavenato postula reemplazar el castigo autoritario por el autocontrol responsable. Si se reiteran transgresiones, se aplica la *disciplina progresiva*:
  1. *Advertencia verbal en privado* (diálogo correctivo sin manchar el legajo).
  2. *Advertencia escrita formal* (notificación agregada al legajo).
  3. *Suspensión temporal* (cesación transitoria de funciones sin goce de sueldo).
  4. *Despido con causa justificada* (extinción tras agotar las instancias formativas previas).

= 6. Las Cuatro Etapas del Proceso de Control de RRHH

#grid(
  columns: (1fr, 1fr, 1fr, 1fr),
  gutter: 4pt,
  rect(fill: rgb("#edf2f7"), stroke: 0.5pt + c-secondary, radius: 3pt, inset: 5pt)[
    #text(weight: "bold", size: 8pt, fill: c-primary)[1. Estándares]\
    #text(size: 7.5pt)[Fijación de patrones de cantidad, calidad, tiempo y costo.]
  ],
  rect(fill: rgb("#edf2f7"), stroke: 0.5pt + c-secondary, radius: 3pt, inset: 5pt)[
    #text(weight: "bold", size: 8pt, fill: c-primary)[2. Monitoreo]\
    #text(size: 7.5pt)[Seguimiento y registro objetivo mediante el SIRH.]
  ],
  rect(fill: rgb("#edf2f7"), stroke: 0.5pt + c-secondary, radius: 3pt, inset: 5pt)[
    #text(weight: "bold", size: 8pt, fill: c-primary)[3. Comparación]\
    #text(size: 7.5pt)[Medición de desvíos admitiendo rangos de tolerancia.]
  ],
  rect(fill: rgb("#edf2f7"), stroke: 0.5pt + c-secondary, radius: 3pt, inset: 5pt)[
    #text(weight: "bold", size: 8pt, fill: c-primary)[4. Acción]\
    #text(size: 7.5pt)[Medidas correctivas sobre desvíos significativos.]
  ]
)

= 7. Énfasis de Cátedra y Clases Desgrabadas (Tips de Examen Parcial)

A partir del análisis exhaustivo del cuaderno de clases desgrabadas de las profesoras María Laura Cabezas y Débora, se destacan los siguientes requerimientos ineludibles:

#alerta-parcial(title: "Estado del Texto en el Primer Parcial (¡Texto Troncal!)")[
  - *Condición en el Examen:* El texto de Chiavenato *ENTRA DE FORMA CENTRAL EN EL PRIMER PARCIAL*.
  - *Advertencia del Docente:* Gran parte del puntaje del bloque de Control descansa en las distinciones metodológicas de este autor.
]

#tip-catedra(title: "El Ejemplo de Clase de Dato vs. Información")[
  Las docentes explicaron en clase la diferencia con un ejemplo pedagógico real:
  - *Dato:* Decir _"8 estudiantes"_ es un simple registro cuantitativo nominal sin sentido analítico ni intencionalidad.
  - *Información:* Decir _"8 estudiantes de la matrícula de 35 asistieron presencialmente a la clase de RRHH III en Viedma"_ constituye verdadera información contextualizada, permitiendo a la cátedra tomar decisiones sobre la plataforma de transmisión y la conectividad.
]

#tip-catedra(title: "Banco de Datos vs. SIRH Pleno: El Caso del Sistema Tramitex")[
  Para ilustrar que una base de datos no es automáticamente un SIRH interactivo, las docentes mencionaron el sistema *Tramitex* de la administración pública provincial: es útil para rastrear la ubicación de un expediente, pero no es un SIRH pleno porque no permite al usuario cruzar variables de recursos humanos, simular dotaciones ni generar diagnósticos analíticos de personal.
]

#tip-catedra(title: "Pregunta Obligatoria: Responsabilidad de Línea vs. Función de Staff")[
  La cátedra exige diferenciar estrictamente los dos roles: la gerencia de personal no manda sobre los empleados de otras áreas operativas (función asesora y de staff); la autoridad jerárquica y el poder sancionatorio pertenecen al jefe directo del sector (responsabilidad de línea).
]
