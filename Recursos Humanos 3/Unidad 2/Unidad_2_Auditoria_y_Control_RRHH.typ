#set document(
  title: "Unidad 2: Auditoría y Control de Recursos Humanos",
  author: "Cátedra de Gestión de Recursos Humanos III",
)

// Estilos de página y tipografía
#set page(
  paper: "a4",
  margin: (top: 2.8cm, bottom: 2.5cm, left: 2.2cm, right: 2.2cm),
  header: context {
    let page_num = counter(page).get().first()
    if page_num > 1 [
      #grid(
        columns: (1fr, auto),
        align: (left, right),
        text(size: 8.5pt, fill: rgb("#4a5568"), font: "Liberation Sans", weight: "medium")[
          Gestión de Recursos Humanos III · *Unidad 2: Auditoría y Control*
        ],
        text(size: 8.5pt, fill: rgb("#718096"), font: "Liberation Sans")[
          Dossier Académico 2025
        ]
      )
      #v(-2pt)
      #line(length: 100%, stroke: 0.5pt + rgb("#cbd5e0"))
    ]
  },
  footer: context [
    #line(length: 100%, stroke: 0.5pt + rgb("#e2e8f0"))
    #v(2pt)
    #grid(
      columns: (1fr, auto),
      align: (left, right),
      text(size: 8pt, fill: rgb("#a0aec0"))[
        Facultad de Ciencias Económicas · Cátedra GRH III
      ],
      text(size: 8.5pt, fill: rgb("#4a5568"), weight: "bold")[
        #counter(page).display("1 / 1", both: true)
      ]
    )
  ]
)

#set text(
  font: ("Liberation Sans", "DejaVu Sans", "Arial"),
  size: 10.5pt,
  lang: "es",
  fill: rgb("#2d3748")
)

#set par(
  justify: true,
  leading: 0.75em,
  first-line-indent: 0pt,
)

// Paleta de colores institucional
#let c-primary = rgb("#1a365d")
#let c-secondary = rgb("#2b6cb0")
#let c-accent = rgb("#319795")
#let c-bg-callout = rgb("#ebf8ff")
#let c-border-callout = rgb("#3182ce")
#let c-bg-warn = rgb("#fffaf0")
#let c-border-warn = rgb("#dd6b20")

// Cajas de llamado (Callouts)
#let callout(title: "", body, icon: "📌") = [
  #v(8pt)
  #rect(
    width: 100%,
    fill: c-bg-callout,
    stroke: (left: 4pt + c-border-callout, rest: 0.5pt + rgb("#bee3f8")),
    radius: (right: 4pt),
    inset: (x: 14pt, y: 10pt)
  )[
    #if title != "" [
      #text(weight: "bold", size: 10.5pt, fill: c-secondary)[#icon #title] \
      #v(4pt)
    ]
    #text(size: 9.8pt, fill: rgb("#2d3748"))[#body]
  ]
  #v(8pt)
]

#let tip-parcial(title: "Tip de Cátedra para el Parcial", body) = [
  #v(8pt)
  #rect(
    width: 100%,
    fill: c-bg-warn,
    stroke: (left: 4pt + c-border-warn, rest: 0.5pt + rgb("#fbd38d")),
    radius: (right: 4pt),
    inset: (x: 14pt, y: 10pt)
  )[
    #text(weight: "bold", size: 10.5pt, fill: c-border-warn)[⚠️ #title] \
    #v(4pt)
    #text(size: 9.8pt, fill: rgb("#744210"))[#body]
  ]
  #v(8pt)
]

// Estilos de encabezados
#show heading.where(level: 1): it => [
  #v(16pt)
  #text(fill: c-primary, weight: "bold", size: 17pt)[#it.body]
  #v(4pt)
  #line(length: 100%, stroke: 2pt + c-secondary)
  #v(10pt)
]

#show heading.where(level: 2): it => [
  #v(12pt)
  #text(fill: c-secondary, weight: "bold", size: 13pt)[#it.body]
  #v(6pt)
]

#show heading.where(level: 3): it => [
  #v(8pt)
  #text(fill: c-accent, weight: "bold", size: 11pt)[#it.body]
  #v(4pt)
]

// ==========================================
// PORTADA ELEGANTE
// ==========================================

#align(center)[
  #v(2cm)
  #text(size: 13pt, weight: "bold", tracking: 2pt, fill: rgb("#718096"))[
    UNIVERSIDAD NACIONAL · FACULTAD DE CIENCIAS ECONÓMICAS
  ] \
  #text(size: 11pt, weight: "medium", fill: rgb("#a0aec0"))[
    Cátedra de Gestión de Recursos Humanos III · Ciclo Lectivo 2025
  ]
  
  #v(2.5cm)
  #rect(fill: c-primary, radius: 6pt, inset: (x: 20pt, y: 16pt))[
    #text(size: 23pt, weight: "bold", fill: white)[
      AUDITORÍA Y CONTROL DE RECURSOS HUMANOS
    ]
  ]
  
  #v(0.8cm)
  #text(size: 14pt, weight: "medium", fill: c-secondary)[
    Dossier Teórico y Analítico de Autores Obligatorios · Unidad N° 2
  ]
  
  #v(1cm)
  #text(size: 10.5pt, style: "italic", fill: rgb("#4a5568"))[
    Articulación exhaustiva entre la bibliografía formal y los debates de clase: \
    Jorge Hintze · Naranjo Pérez, Mesa Espinosa y Solera Salas · Idalberto Chiavenato · Vega Falcón y equipo
  ]

  #v(4.5cm)
  #line(length: 50%, stroke: 1pt + rgb("#cbd5e0"))
  #v(0.3cm)
  #text(size: 9.5pt, fill: rgb("#718096"))[
    *Compilación Académica y Guía de Examen* \
    Basado en los textos de estudio y las transcripciones oficiales de clases (2025)
  ]
]

#pagebreak()

// ==========================================
// ÍNDICE GENERAL
// ==========================================

#text(size: 16pt, weight: "bold", fill: c-primary)[Contenido del Dossier]
#v(6pt)
#line(length: 100%, stroke: 1.5pt + c-secondary)
#v(10pt)

#outline(
  title: none,
  indent: 1.5em,
  depth: 2
)

#v(20pt)

#callout(title: "Propósito de la Unidad 2", icon: "🎯")[
  La Unidad 2 constituye la *columna vertebral dura* de la gestión de personas. Aborda la arquitectura de los sistemas de información (SIRH), la epistemología del control frente a la evaluación, las dinámicas del control estratégico en entornos turbulentos y el procedimiento formal de la auditoría de recursos humanos como una herramienta de aprendizaje organizacional no punitiva.
]

#pagebreak()

// ==========================================
// CAPÍTULO 1: JORGE HINTZE
// ==========================================

= 1. Jorge Hintze: Control y Evaluación de Gestión y Resultados

*Obra de Referencia:* _Control y evaluación de gestión y resultados de gestión_ (Documentos TOP, 1999).

== 1.1. Delimitación Rigurosa: Información, Control y Evaluación
Jorge Hintze inicia su marco teórico estableciendo una diferenciación epistemológica esencial:

- *Información:* Es la representación de la realidad mediante algún tipo de lenguaje estructurado. A diferencia de los *datos* (registros primarios, brutos y aislados de los hechos), la información implica datos que han sido interpretados, agrupados y dotados de significado e intencionalidad para el receptor.
- *Control:* Consiste en verificar los hechos registrados por la información mediante su comparación sistemática contra un *patrón técnico de referencia preestablecido* (norma, estándar o especificación técnica). El control es una operación objetiva que constata la adecuación o el desvío técnico, sin emitir juicios de valor.
- *Evaluación:* Va un paso más allá del control. Implica emitir *juicios de valor (explícitos o implícitos)* al contrastar la información con *patrones de referencia valorativos* o expectativas sociales y políticas (concluyendo si algo es "bueno o malo", satisfactorio o insuficiente).

#tip-parcial(title: "La Analogía del Automóvil (Clase Docente)")[
  En las desgrabaciones de clase, las profesoras explican la diferencia mediante una analogía muy gráfica: cuando un automóvil se descompone, la *evaluación* del dueño es cualitativa y al final: _"El auto no anda, me dejó a pata"_. En cambio, el *control* lo realiza el mecánico mediante instrumental técnico para verificar exactamente qué parámetro falló (la presión del combustible, el desgaste del embrague o la chispa de la bujía).
]

== 1.2. Los Tres Objetos de Información, Control y Evaluación
Hintze organiza la vida institucional en tres ámbitos diferenciados:

#table(
  columns: (1.1fr, 1.3fr, 1.4fr, 1.4fr),
  fill: (col, row) => if row == 0 { rgb("#edf2f7") } else if calc.odd(row) { rgb("#f7fafc") } else { white },
  stroke: 0.5pt + rgb("#cbd5e0"),
  inset: 6.5pt,
  [*Objeto de Gestión*], [*Nivel de Información*], [*Nivel de Control (Técnico)*], [*Nivel de Evaluación (Valorativo)*],
  [1. Resultados *(Hacia afuera)*], [Registros de cantidad y calidad de los bienes/servicios entregados.], [Comparación contra estándares técnicos de producción y metas.], [Juicio sobre impacto social, efectividad y satisfacción ciudadana.],
  [2. Procesos *(Hacia adentro)*], [Registros de consumo de recursos y tiempos operativos.], [Comparación contra las *"reglas del arte"* y normas técnicas.], [Valoración de la razonabilidad del costo, optimización y eficiencia.],
  [3. Organización *(Hacia adentro)*], [Inventario de la capacidad instalada: personal, cargos y tecnología.], [Comparación contra estándares de diseño organizativo y dotación.], [Valoración de la adecuación de la estructura para facilitar la gestión.]
)

== 1.3. Evolución Institucional de las Prácticas de Control
El autor sintetiza cuatro etapas históricas de maduración en las organizaciones:
1. *Fase Inicial:* Inspección directa y personal ejercida por los jefes individuales.
2. *Fase Intermedia Jerárquica:* Creación de áreas especializadas que reportan exclusivamente a la cúspide directiva (auditoría interna, inspección de servicios).
3. *Fase Intermedia Participativa:* Dispositivos colegiados y transparentes (comités paritarios, rendición de cuentas, control entre pares).
4. *Fase Avanzada (SICE):* Integración de la cultura organizativa y la tecnología en un *metasistema continuo* de control y evaluación.

== 1.4. Sistemas de Gestión (SG) vs. Sistemas de Control (SICE)
Hintze introduce una analogía orgánica crucial:
- *Sistemas de Gestión (SG):* Son los músculos y órganos ejecutores; los procesos de trabajo que operan directamente transformando insumos en productos.
- *Sistemas de Información, Control y Evaluación (SICE):* Actúan como el *sistema nervioso central*. No producen físicamente los bienes, sino que captan señales, procesan estados y regulan la energía del sistema productivo.

== 1.5. Articulación entre Niveles de Planificación y Control
- *Políticas:* Se articulan con la *Evaluación de Impacto y Efectividad Social*.
- *Estrategias:* Se articulan con la *Evaluación de Resultados Institucionales*.
- *Planificación Operativa:* Se articula con el *Control de Productos (Eficacia Técnica)*.
- *Programación de Tareas:* Se articula con el *Control de Procesos (Eficiencia y "Reglas del Arte")*.

#pagebreak()

// ==========================================
// CAPÍTULO 2: NARANJO PÉREZ, MESA Y SOLERA
// ==========================================

= 2. Naranjo Pérez, Mesa y Solera: El Control Estratégico

*Obra de Referencia:* _El control estratégico. Lo que no debemos obviar_.

== 2.1. Naturaleza y Peculiaridades del Control Estratégico
Remberto Naranjo Pérez, María Antonieta Mesa Espinosa y José Solera Salas analizan la transición desde los controles contables tradicionales hacia el *Control Estratégico*:

#table(
  columns: (1.2fr, 1.4fr, 1.4fr),
  fill: (col, row) => if row == 0 { rgb("#edf2f7") } else if calc.odd(row) { rgb("#f7fafc") } else { white },
  stroke: 0.5pt + rgb("#cbd5e0"),
  inset: 7pt,
  [*Criterio*], [*Control Tradicional / Operativo*], [*Control Estratégico*],
  [Orientación Temporal], [*Retrospectivo:* Evalúa el pasado a partir de rendimientos históricos cerrados.], [*Prospectivo:* Enfocado en el futuro, en expectativas y escenarios inciertos.],
  [Variables de Análisis], [Datos cuantitativos duros, variaciones presupuestarias y costos.], [Variables cualitativas, multidimensionales y adaptativas al entorno.],
  [Relación con el Entorno], [Cerrado: Asume estabilidad y se enfoca en la eficiencia interna.], [Abierto: Integra un *subsistema de vigilancia y monitoreo continuo del entorno*.],
  [Propósito Fundamental], [Detección punitiva de desvíos y sanción correctiva.], [*Aprendizaje organizacional* y alineación de las conductas con la visión.]
)

== 2.2. El Monitoreo del Entorno y la Vigilancia Estratégica
En mercados dinámicos y turbulentos, el control estratégico incorpora mecanismos de alerta temprana para:
- Detectar discontinuidades, reformas normativas o cambios en el mercado laboral antes de que se conviertan en crisis operativas.
- Brindar la flexibilidad requerida para ajustar y recalcular la estrategia en tiempo real.

== 2.3. El Perfil del Controlador Estratégico y el Factor Humano
Los autores sostienen que el control estratégico no depende solo de sistemas informáticos, sino de las cualidades de sus directivos:
- *Voluntad Estratégica:* Tenacidad para sostener la dirección de largo plazo superando las presiones inmediatistas.
- *Orientación al Cambio:* Capacidad para transformar la cultura organizativa y superar resistencias burocráticas.
- *Tolerancia al Riesgo y al Error:* Entender que en procesos de innovación, el error debe asumirse como una oportunidad de aprendizaje constructivo.

== 2.4. Mecanismos de Influencia sobre la Conducta (Johnson y Scholes)
El control estratégico regula y orienta la conducta del personal a través de dos dispositivos interdependientes:
1. *Sistemas de Información y Medición:* Indicadores de desempeño cuantitativos y cualitativos que comunican con claridad las prioridades de la firma.
2. *Sistemas de Regulación del Comportamiento:* La estructura de remuneraciones, esquemas de incentivos por metas, reconocimientos simbólicos y valores culturales que cohesionan el esfuerzo humano.

== 2.5. Centros de Responsabilidad y Factores Clave de Éxito (FCE)
Para evitar la sobrecarga de datos, el sistema se descentraliza en *centros de responsabilidad* (unidades operativas con autoridad para negociar y pactar sus propios indicadores). 

Siguiendo el *modelo de Philippe Lorino*, la organización debe identificar sus *Factores Clave de Éxito (FCE)*, desagregarlos en *actividades críticas* y descubrir los *inductores de eficiencia* (las causas primarias que explican el rendimiento del personal, como el ausentismo, la capacitación y el clima laboral).

#pagebreak()

// ==========================================
// CAPÍTULO 3: IDALBERTO CHIAVENATO
// ==========================================

= 3. Idalberto Chiavenato: Sistemas de Información y Control de RRHH

*Obra de Referencia:* _Administración de Recursos Humanos_ (Capítulo 16, McGraw-Hill).

== 3.1. Cadena de Procesamiento: Del Dato a la Información
Chiavenato establece la diferencia estructural que rige a todo el sistema administrativo:
- *Dato:* Elemento primario, cifra o registro aislado (ej. una marca horaria biométrica o el número de legajo). Por sí solo no tiene cualidad, contexto ni significado amplio, y *no permite tomar decisiones*.
- *Información:* Conjunto de datos clasificados, ordenados, tabulados e interpretados con un propósito definido. Al otorgar sentido a la realidad, reduce la incertidumbre y fundamenta la toma de decisiones estratégicas.

== 3.2. La Arquitectura del Banco de Datos de RRHH
El Banco de Datos es un sistema relacional de almacenamiento estructurado para evitar redundancias y garantizar acceso simultáneo. Chiavenato identifica seis registros fundamentales:

#table(
  columns: (1.2fr, 2.2fr),
  fill: (col, row) => if row == 0 { rgb("#edf2f7") } else if calc.odd(row) { rgb("#f7fafc") } else { white },
  stroke: 0.5pt + rgb("#cbd5e0"),
  inset: 7pt,
  [*Registro*], [*Contenido e Insumo Principal*],
  [1. Registro de Personal], [Inventario de habilidades, datos biográficos, competencias, historial y educación de cada colaborador.],
  [2. Registro de Puestos], [Descripción del cargo, tareas, requisitos psicofísicos y ocupantes actuales de cada posición.],
  [3. Registro de Áreas], [Distribución departamental de la dotación y asignación de personal por centros de costo.],
  [4. Registro de Remuneraciones], [Salarios básicos, adicionales, horas extras, comisiones e historial de compensaciones.],
  [5. Registro de Prestaciones], [Coberturas de salud, beneficios sociales, seguros de vida y planes de previsión social.],
  [6. Registros Especiales], [Bases de postulantes, legajos disciplinarios, capacitaciones y licencias médicas.]
)

== 3.3. El Sistema de Información de Recursos Humanos (SIRH)
El SIRH opera como una red integrada de flujo continuo:

```
[ INPUTS (Entradas) ]  ───────►  [ PROCESAMIENTO ]  ───────►  [ OUTPUTS (Salidas) ]
• Fichadas biométricas           • Validación algorítmica      • Liquidación neta de sueldos
• Reportes de ausentismo         • Cruce de bases de datos     • Tasas de rotación (turnover)
• Evaluaciones del desempeño     • Consolidación estadística   • Informes legales y fiscales
• Solicitudes de licencias       • Cálculo salarial            • Costos por centro de trabajo
```

=== Responsabilidad de Línea vs. Función de Staff
Chiavenato resuelve la tensión estructural de la gestión de personas:
- *Responsabilidad de Línea:* Cada gerente o jefe es el administrador y evaluador directo de su equipo.
- *Función de Staff:* El departamento de Recursos Humanos asesora a las gerencias, formula las políticas generales, mantiene el SIRH y procesa los lotes de datos para abastecer de información oportuna a los líderes operativos.

== 3.4. Jornada Flexible y Disciplina Progresiva
- *Gestión de la Jornada:* El SIRH moderno administra esquemas de flexibilidad: horario flexible (*flextime*), semana laboral comprimida, banco de horas compensatorias y teletrabajo.
- *Disciplina Progresiva:* Frente a faltas reiteradas, se aplica un protocolo escalonado que busca la enmienda de la conducta antes que el castigo destructivo:
  1. *Advertencia verbal en privado.*
  2. *Advertencia escrita formal al legajo.*
  3. *Suspensión temporal de empleo y sueldo.*
  4. *Despido con causa justificada.*

== 3.5. Las Cuatro Etapas del Proceso de Control de RRHH
1. *Establecimiento de Estándares Deseados:* Metas de cantidad, calidad, tiempo y costo.
2. *Monitoreo del Desempeño:* Registro continuo a través del SIRH.
3. *Comparación con los Estándares:* Detección de variaciones tolerables o anómalas.
4. *Acción Correctiva:* Ajuste sobre desvíos excepcionales para restaurar el estándar.

#pagebreak()

// ==========================================
// CAPÍTULO 4: VLADIMIR VEGA FALCÓN Y COLS.
// ==========================================

= 4. Vladimir Vega Falcón y cols.: Auditoría de Recursos Humanos

*Obra de Referencia:* _Auditoría de Recursos Humanos_ (Universidad de Matanzas / Ecoe Ediciones).

== 4.1. Concepto y Enfoque No Punitivo
Vega Falcón, Álvarez Gómez, Medina Nogueira y Salas Álvarez definen la Auditoría de Recursos Humanos como el examen analítico, sistemático y formal practicado para verificar el cumplimiento de planes, políticas y leyes laborales, diagnosticando desvíos y proponiendo mejoras continuas en la productividad y el control interno.

#callout(title: "El Mandato Formativo y No Punitivo", icon: "⚖️")[
  La cátedra subraya que la auditoría *no es un sumario administrativo ni una persecución de empleados*. Su misión no es buscar culpables para aplicar castigos, sino identificar fallas en los procedimientos de la organización para emitir *recomendaciones pedagógicas y correctivas* que impulsen el aprendizaje institucional.
]

== 4.2. Perfil y Atributos del Auditor de RRHH
- *La Regla de Oro:* El auditor debe recordar que cuenta con *"dos oídos y una sola boca"*: debe escuchar con empatía antes de juzgar o emitir dictámenes.
- *Competencias:* Dominio exhaustivo de la legislación laboral, pericia en técnicas de entrevista y capacidad de análisis deductivo.
- *Actitud Colaborativa:* Debe presentarse como un facilitador del cambio, erradicando posturas prepotentes o fiscalizadoras que inciten a los trabajadores a ocultar información.

== 4.3. Las Tres Etapas del Proceso de Auditoría

```mermaid
flowchart LR
    E1["1. Obtención de Datos<br>(Cuestionarios y preguntas clave)"] --> E2["2. Análisis de Datos<br>(Detección de causas con jefaturas)"]
    E2 --> E3["3. Informe de Auditoría<br>(Diagnóstico y recomendaciones)"]
```

1. *Obtención de Datos e Informes:* Aplicación de cuestionarios y formulación de preguntas sistemáticas (*¿Qué se hace? ¿Por qué? ¿Cómo? ¿Cuándo? ¿Dónde? ¿Quién lo hace?*).
2. *Análisis de los Datos Alcanzados:* Contraste contra presupuestos y normas legales, deducción de causas primarias y debate constructivo con los jefes de línea.
3. *Elaboración del Informe de Auditoría:* Redacción del dictamen formal con estimación de impactos económicos, riesgos legales y recomendaciones priorizadas.

== 4.4. Los Cinco Enfoques de Investigación en Auditoría

#table(
  columns: (1.2fr, 1.4fr, 1.4fr),
  fill: (col, row) => if row == 0 { rgb("#edf2f7") } else if calc.odd(row) { rgb("#f7fafc") } else { white },
  stroke: 0.5pt + rgb("#cbd5e0"),
  inset: 7pt,
  [*Enfoque de Investigación*], [*Metodología Aplicada*], [*Utilidad en la Práctica*],
  [1. Enfoque Comparativo (*Benchmarking*)], [Contrasta la empresa con otra firma análoga de alto desempeño del sector.], [Evalúa si los salarios, beneficios o tasas de rotación son competitivos.],
  [2. Consultoría Externa], [Utiliza estándares publicados por firmas consultoras o normativas internacionales.], [Compara políticas de compensación y desarrollo frente a estándares de mercado.],
  [3. Enfoque Estadístico], [Elabora series temporales, medias y coeficientes sobre registros propios históricos.], [Permite monitorear tendencias internas de ausentismo o accidentes laborales.],
  [4. Enfoque Retrospectivo de Logros], [Audita expedientes pasados, contratos, recibos de haberes y convenios colectivos.], [Verifica el estricto apego a las leyes laborales y previene juicios.],
  [5. Evaluación por Objetivos], [Contrasta los resultados reales obtenidos contra las metas prefijadas en el plan.], [Audita el grado de cumplimiento de los compromisos de las jefaturas.]
)

== 4.5. Auditoría Interna vs. Auditoría Externa
- *Auditoría Interna:* Ejecutada por personal de la propia organización ("control de controles"). Es económica y conoce a fondo los códigos culturales, pero corre el riesgo de perder objetividad o caer en complacencia.
- *Auditoría Externa:* Realizada por consultores independientes. Brinda *máxima imparcialidad, rigor técnico y confidencialidad*, aunque exige un presupuesto financiero mayor.

== 4.6. Segmentación del Informe Final de Auditoría
El informe debe redactarse en secciones específicas según sus destinatarios:
1. *Para Gerentes de Línea:* Evalúa las prácticas de personal de su sector, señala irregularidades operativas y recomienda acciones correctivas inmediatas.
2. *Para Especialistas de RRHH:* Retroalimentación técnica sobre los subsistemas de selección, compensaciones y capacitación, diagnosticando la receptividad de los líderes de línea.
3. *Para la Dirección General:* Visión panorámica de la fuerza laboral, cumplimiento de los objetivos estratégicos, contingencias legales de alto riesgo y recomendaciones priorizadas por retorno de inversión.

#pagebreak()

// ==========================================
// CAPÍTULO 5: SÍNTESIS Y TIPS DE EXAMEN
// ==========================================

= 5. Síntesis Comparativa y Criterios Evaluativos de la Cátedra

== 5.1. Matriz Comparativa Global de la Unidad 2

#table(
  columns: (1fr, 1.2fr, 1.4fr, 1.4fr),
  fill: (col, row) => if row == 0 { rgb("#edf2f7") } else if calc.odd(row) { rgb("#f7fafc") } else { white },
  stroke: 0.5pt + rgb("#cbd5e0"),
  inset: 6.5pt,
  [*Autor(es)*], [*Eje Central del Aporte*], [*Concepto Clave de Control / Auditoría*], [*Herramientas / Modelos Principales*],
  [Jorge Hintze], [Epistemología del control y la evaluación.], [**Control**: Comparación con estándar técnico. \ **Evaluación**: Comparación valorativa.], [Matriz de 3 Objetos (Resultados, Procesos, Organización) y el SICE.],
  [Naranjo Pérez y cols.], [Control Estratégico y cambio de conducta.], [**Control Estratégico**: Orientado al futuro y al monitoreo del entorno turbulento.], [Modelo de Lorino (Factores Clave de Éxito e Inductores de Eficiencia).],
  [Idalberto Chiavenato], [Sistemas de Información y Banco de Datos.], [**SIRH / SIA**: Flujo de entradas y salidas para la toma de decisiones.], [Banco de Datos estructurado (6 registros) y Disciplina Progresiva.],
  [Vega Falcón y cols.], [Auditoría Integral de Recursos Humanos.], [**Auditoría**: Examen sistemático no punitivo con fines de aprendizaje.], [Los 5 Enfoques de Investigación y el Informe Segmentado.]
)

== 5.2. Los Mandamientos Docentes para Aprobar los Parciales

#tip-parcial(title: "Claves de Corrección de la Cátedra (Desgrabaciones de Clase)")[
  1. *No Dejar en Blanco la Pregunta sobre Control:* Las profesoras advierten que la pregunta sobre el concepto y fases de *Control (Hintze)* es la más omitida por los alumnos, provocando aplazos masivos.
  2. *Diferencia Tajante entre Control y Evaluación:* El control mide hechos contra estándares técnicos objetivos (mecánico midiendo piezas); la evaluación emite juicios de valor cualitativos al final (el dueño diciendo que el auto no anda).
  3. *Dato vs. Información:* Jamás deben usarse como sinónimos. El dato es el insumo crudo que no permite decidir; la información es el dato procesado con significado e intención.
  4. *Carácter No Punitivo de la Auditoría:* Describir siempre la auditoría como un proceso de diagnóstico y aprendizaje organizacional, nunca como una sanción o investigación policial de empleados.
  5. *Uso Estricto de Vocabulario Técnico:* Se reprueba el uso de lenguaje puramente coloquial o de "sentido común".
]

#v(25pt)
#align(center)[
  #text(size: 9pt, style: "italic", fill: rgb("#718096"))[
    Fin del Dossier Académico · Unidad 2: Auditoría y Control de Recursos Humanos \
    Gestión de Recursos Humanos III — Ciclo Lectivo 2025
  ]
]
