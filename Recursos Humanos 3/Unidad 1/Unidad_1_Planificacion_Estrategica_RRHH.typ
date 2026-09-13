#set document(
  title: "Unidad 1: Planificación Estratégica de Recursos Humanos",
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
          Gestión de Recursos Humanos III · *Unidad 1: Planificación Estratégica*
        ],
        text(size: 8.5pt, fill: rgb("#718096"), font: "Liberation Sans")[
          Dossier Académico 2025
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
          Facultad de Ciencias Económicas · Cátedra GRH III
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
  size: 10.5pt,
  lang: "es",
  fill: rgb("#2d3748")
)

#set par(
  justify: true,
  leading: 0.75em,
  first-line-indent: 0pt,
)

// Paleta de colores
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
      PLANIFICACIÓN ESTRATÉGICA DE RECURSOS HUMANOS
    ]
  ]
  
  #v(0.8cm)
  #text(size: 14pt, weight: "medium", fill: c-secondary)[
    Dossier Teórico y Analítico de Autores Obligatorios · Unidad N° 1
  ]
  
  #v(1cm)
  #text(size: 10.5pt, style: "italic", fill: rgb("#4a5568"))[
    Articulación exhaustiva entre la bibliografía formal y los debates de clase: \
    Armijo · Ossorio · Palacios Acero · Iglesias, Pagola y Uranga · Dolan · Mendoza, López y Salas
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

#callout(title: "Propósito del Documento", icon: "🎯")[
  Este dossier recopila los seis textos teóricos fundamentales de la Unidad 1 de la asignatura *Gestión de Recursos Humanos III*, integrando las aclaraciones conceptuales, advertencias y criterios de corrección aportados por el equipo docente en las desgrabaciones de clase. Cada sección profundiza en las metodologías, modelos de previsión y dimensiones estratégicas que transforman al área de personal en un socio estratégico de la organización.
]

#pagebreak()

// ==========================================
// CAPÍTULO 1: MARIANELA ARMIJO
// ==========================================

= 1. Marianela Armijo: Planificación Estratégica en el Sector Público

*Obra de Referencia:* _Manual de Planificación Estratégica e Indicadores de Desempeño en el Sector Público_ (ILPES / CEPAL, 2009).

== 1.1. Concepto y Enfoque de Gestión por Resultados (GpR)
Marianela Armijo aborda la planificación estratégica como una herramienta neurálgica de la *Gestión por Resultados (GpR)* en el Estado. Su propósito central es definir con claridad las prioridades institucionales, los objetivos de impacto social y los cursos de acción que sustentan la asignación y uso eficiente de los recursos financieros y humanos.

Para Armijo, un plan estratégico que no se articula con el *presupuesto y la programación plurianual* deviene en una simple declaración de intenciones. La dotación y capacitación de recursos humanos deben justificarse rigurosamente a partir de los *productos estratégicos* que la institución entrega a la ciudadanía.

== 1.2. Componentes Estratégicos Institucionales
La autora estructura el proceso directivo en cinco pilares encadenados:

1. *Misión Institucional:* Define la razón de ser de la entidad pública. Responde a: _¿Quiénes somos? ¿Qué hacemos? ¿Para quiénes lo hacemos? ¿Cuáles son nuestros productos estratégicos y qué valor público generamos?_
2. *Visión Institucional:* Expresa los valores y la imagen de futuro deseada a largo plazo. Funciona como el faro orientador de la organización.
3. *Objetivos Estratégicos:* Logros concretos que la entidad se propone alcanzar a mediano y largo plazo para resolver problemas prioritarios de su población objetivo.
4. *Estrategias y Cursos de Acción:* Combinación sistemática de medios, pasos operativos y asignación de personal para cerrar la brecha entre el estado actual y los objetivos.
5. *Indicadores de Desempeño y Metas:* Parámetros cuantitativos y cualitativos que permiten monitorear sistemáticamente el grado de cumplimiento de los objetivos institucionales.

== 1.3. La Tipología de los Cuatro Indicadores de Desempeño

#callout(title: "Los Cuatro Indicadores Clave de Armijo", icon: "📊")[
  Armijo clasifica los indicadores en cuatro dimensiones complementarias que evalúan el desempeño integral:
  
  - *Eficacia:* Mide el grado de cumplimiento de los objetivos y metas comprometidos, independientemente del costo incurrido (ej. porcentaje de trámites resueltos respecto al total programado).
  - *Eficiencia:* Mide la relación entre los recursos e insumos invertidos (financieros, humanos, tiempo) y la producción real alcanzada (ej. costo medio por usuario atendido, productividad por agente).
  - *Economía:* Mide la capacidad institucional para movilizar, captar y administrar adecuadamente sus recursos financieros y mitigar los costos de adquisición de insumos.
  - *Calidad:* Mide la satisfacción de los usuarios, accesibilidad, oportunidad, cortesía y margen de falla o precisión técnica en la entrega del bien o servicio público.
]

#tip-parcial[
  En las desgrabaciones, las docentes reiteran que en los exámenes no admiten definiciones genéricas de "control" o "eficiencia". Exigen distinguir claramente la *eficacia* (logro del resultado) de la *eficiencia* (optimización del insumo respecto al producto).
]

== 1.4. Niveles Organizacionales y Foco de Medición

#table(
  columns: (1.2fr, 1.3fr, 1.5fr),
  fill: (col, row) => if row == 0 { rgb("#edf2f7") } else if calc.odd(row) { rgb("#f7fafc") } else { white },
  stroke: 0.5pt + rgb("#cbd5e0"),
  inset: 7pt,
  [*Nivel Organizacional*], [*Tipo de Planificación*], [*Foco de Medición e Indicador*],
  [Alta Dirección], [Planificación Estratégica], [*Impacto y Resultado Final:* Transformaciones socioeconómicas en la población.],
  [Nivel Directivo], [Control de Gestión], [*Eficacia, Eficiencia y Calidad:* Desempeño de programas y centros de responsabilidad.],
  [Nivel Operativo], [Control de Actividades], [*Insumos y Procesos:* Horas de trabajo, costos directos y actividades diarias.]
)

== 1.5. Aporte a la Planificación de Recursos Humanos
Armijo profesionaliza la gestión del personal en la administración pública. Demuestra que las dotaciones, la masa salarial y los perfiles de puesto no pueden fijarse por inercia burocrática, sino que deben calcularse en función de las metas de producción de bienes y servicios públicos asignados a cada centro de responsabilidad.

#pagebreak()

// ==========================================
// CAPÍTULO 2: ALFREDO OSSORIO
// ==========================================

= 2. Alfredo Ossorio: Planeamiento Estratégico y Planificación Situacional

*Obra de Referencia:* _Planeamiento Estratégico_ (INAP / FLACSO, 2003).

== 2.1. Distinción Fundamental: Plan vs. Estrategia
Ossorio inaugura su análisis estableciendo una ruptura con el pensamiento tradicional:
- *El Plan:* Es una toma anticipada de decisiones, una reflexión formal y sistemática previa a la acción que busca prever contingencias para alcanzar una meta.
- *La Estrategia:* Es un *estilo y método de pensamiento dinámico sobre la acción*. Se fundamenta en reconocer que la realidad social está habitada por *múltiples actores con poder y voluntades contrapuestas*, que juegan sus propias partidas en escenarios de conflicto, cooperación o neutralidad.

== 2.2. La Ruptura Epistemológica: Planificación Tradicional vs. Situacional
Apoyándose en los desarrollos de Carlos Matus, Ossorio contrasta dos paradigmas antagónicos:

#table(
  columns: (1.2fr, 1.4fr, 1.4fr),
  fill: (col, row) => if row == 0 { rgb("#edf2f7") } else if calc.odd(row) { rgb("#f7fafc") } else { white },
  stroke: 0.5pt + rgb("#cbd5e0"),
  inset: 7pt,
  [*Dimensión*], [*Planificación Tradicional (Normativa)*], [*Planificación Estratégica Situacional (PES)*],
  [Sujeto Planificador], [Experto externo que diagnostica la realidad desde afuera como un objeto.], [Actor social *situado*, inmerso en la misma realidad que pretende transformar.],
  [Monopolio del Plan], [El Estado o la gerencia central es el único que planifica.], [*Múltiples actores planifican simultáneamente* con intereses divergentes.],
  [Certeza del Futuro], [Supone un futuro predecible con diagnósticos técnicos únicos.], [Reconoce la *incertidumbre dura* y la existencia de múltiples escenarios.],
  [Viabilidad], [Lo que es técnicamente deseable es considerado automáticamente viable.], [La *viabilidad política, social y económica debe ser construida activamente*.]
)

== 2.3. El Triángulo de Gobierno de Carlos Matus
Ossorio sostiene que la capacidad transformadora de cualquier equipo de conducción radica en el equilibrio de tres vértices:
1. *Proyecto de Gobierno (PG):* Propuesta política y contenidos sustantivos de transformación que se pretenden ejecutar.
2. *Gobernabilidad del Sistema (G):* Proporción entre las variables que el decisor controla y las variables que escapan a su dominio (fuerzas del mercado, sindicatos, leyes).
3. *Capacidad de Gobierno (CG):* El acervo de técnicas, metodologías, destrezas organizacionales y recursos humanos calificados de los que dispone el equipo de conducción.

== 2.4. Los Cuatro Momentos de la Planificación Situacional (PES)
A diferencia de las etapas cronológicas rígidas, Matus y Ossorio proponen *cuatro momentos continuos e interdependientes*:

- *Momento Explicativo ("Fue, Es y Tiende a Ser"):* Indagación profunda de la situación problemática mediante el árbol de problemas y la identificación de actores sociales (clasificados en aliados, adversarios y neutros).
- *Momento Normativo ("Debe Ser"):* Diseño del escenario deseado, fijando la Misión, Visión, objetivos y trayectorias ideales.
- *Momento Estratégico ("Puede Ser"):* Análisis de viabilidad sociopolítica. Es el puente que articula el "debe ser" con la realidad concreta, negociando alianzas y superando resistencias.
- *Momento Táctico-Operacional ("Hacer y Recalcular"):* Administración cotidiana de las operaciones con un *recálculo constante* ante las jugadas imprevistas de los otros actores.

#tip-parcial[
  Para el parcial, recordar que en la PES *no se habla de etapas sucesivas que cierran*, sino de *momentos* que coexisten y se retroalimentan permanentemente durante la gestión.
]

== 2.5. Aporte a la Planificación de Recursos Humanos
Para la gestión del talento, Ossorio aporta la noción del *gestor de RRHH como actor político situado*. Las reformas salariales, los regímenes de carrera y los planes de dotación no se imponen mediante fórmulas tecnocráticas aisladas, sino que demandan construir viabilidad activa negociando con los sindicatos y las gerencias de línea.

#pagebreak()

// ==========================================
// CAPÍTULO 3: LUIS CARLOS PALACIOS ACERO
// ==========================================

= 3. Luis Carlos Palacios Acero: Dirección Estratégica

*Obra de Referencia:* _Dirección Estratégica_ (2ª Edición, Ecoe Ediciones).

== 3.1. Concepto de Dirección Estratégica
Palacios Acero define la dirección estratégica como el arte y la ciencia de poner en práctica todo el potencial de la organización para garantizar su *supervivencia, competitividad y crecimiento a largo plazo*. Es un proceso dinámico que combina el análisis del entorno con el desarrollo de competencias organizacionales distintivas.

== 3.2. Evolución Histórica: De la Empresa Máquina a la Empresa Social
El autor describe el tránsito del pensamiento organizativo a través de tres estadios paradigmáticos:

1. *Empresa Máquina (Taylorismo Clásico):* El trabajador es considerado un apéndice mecánico. Predomina la desconfianza, la estricta división del trabajo manual y mental, la supervisión punitiva y una visión mecanicista donde la persona es una pieza fácilmente sustituible.
2. *Empresa Sistémica (Teoría de Sistemas):* Concibe a la firma como un sistema abierto en equilibrio dinámico con su entorno. Se estructuran procesos estandarizados, se profesionalizan las áreas de apoyo y se coordinan los flujos de insumos y productos.
3. *Empresa Social (Paradigma Contemporáneo):* La organización es concebida como un organismo social con identidad y cultura propia. Se privilegia la *salud ocupacional, el bienestar, la capacitación continua, el compromiso y la motivación*. Las personas dejan de ser un costo para erigirse en el principal activo de diferenciación y competitividad.

== 3.3. Estrategias Deliberadas vs. Estrategias Emergentes
Inspirado en Henry Mintzberg, Palacios Acero recalca que la estrategia real de una organización nunca coincide plenamente con el documento inicial:
- *Estrategia Planeada o Deliberada:* El rumbo formulado explícitamente en el plan formal.
- *Estrategias Emergentes:* Cursos de acción no previstos que nacen de la interacción cotidiana del personal con los problemas, oportunidades y cambios del mercado.
- *Estrategia Real:* La síntesis dialéctica entre las intenciones deliberadas viables y las respuestas emergentes adoptadas sobre la marcha.

== 3.4. Niveles de Decisión y Herramientas Operativas

#callout(title: "Instrumentos de Planeación de Palacios Acero", icon: "🛠️")[
  - *Balanced Scorecard (BSC / CMI):* Cuadro de mando que enlaza cuatro perspectivas: Financiera, Clientes, Procesos Internos y *Aprendizaje/Crecimiento* (sede de los Recursos Humanos).
  - *Matriz DOFA / FODA:* Cruce de variables internas (Debilidades/Fortalezas) y externas (Oportunidades/Amenazas).
  - *Diagrama de Ishikawa:* Identificación de raíces causales en fallas operativas o desvíos de desempeño.
  - *Redes PERT y Gráficas de Gantt:* Programación temporal y secuenciación de actividades críticas.
]

== 3.5. Aporte a la Planificación de Recursos Humanos
En el marco de la *Empresa Social*, el talento humano se consagra como la única ventaja competitiva genuinamente sostenible. Mientras la tecnología y las maquinarias son accesibles para cualquier competidor con capital, el conocimiento tácito, la cohesión del equipo y el compromiso de los colaboradores son activos intangibles inimitables.

#pagebreak()

// ==========================================
// CAPÍTULO 4: IGLESIAS, PAGOLA Y URANGA
// ==========================================

= 4. Iglesias, Pagola y Uranga: Enfoques de Planificación

*Obra de Referencia:* _Enfoques de Planificación_ (UNLP, 2012).

== 4.1. La Planificación como Función de Gestión
Martín Iglesias, Cecilia Pagola y Washington Uranga conciben la planificación como una fase sustancial de la gestión social e institucional. Toda intervención planificada integra tres dimensiones inseparables:
- *Dimensión Cognitiva:* Los marcos teóricos, conceptos, metodologías e información diagnóstica disponible.
- *Dimensión Política:* El sentido transformador, el proyecto de cambio social y la disputa por el poder y la legitimidad.
- *Dimensión Práctica / Operativa:* Las técnicas, dispositivos, cronogramas y acciones concretas en el territorio o en la organización.

== 4.2. Proferencia vs. Prospectiva (Aporte de Agustín Merello)
Los autores profundizan la distinción conceptual aportada por Agustín Merello:

#table(
  columns: (1.2fr, 1.4fr, 1.4fr),
  fill: (col, row) => if row == 0 { rgb("#edf2f7") } else if calc.odd(row) { rgb("#f7fafc") } else { white },
  stroke: 0.5pt + rgb("#cbd5e0"),
  inset: 7pt,
  [*Criterio*], [*Proferencia*], [*Prospectiva*],
  [Punto de Partida], [*El pasado y el presente.*], [*El futuro deseado.*],
  [Lógica Temporal], [Extrapola tendencias hacia adelante: _"¿Qué pasará si todo sigue igual?"_], [Se instala en el porvenir deseado y *viaja desde el futuro hacia el presente*.],
  [Modelos Asociados], [Planificación Normativa Clásica y Planificación Estratégica Situacional.], [Planificación Prospectiva Estratégica.],
  [Concepción del Futuro], [Destino probable condicionado por la inercia del pasado.], [Espacio múltiple, abierto y sujeto a la construcción colectiva.]
)

== 4.3. Los Tres Grandes Estilos de Planificación
1. *Planificación Normativa (Clásica):* Tecnocrática, formal y burocrática. El diagnóstico es formulado por expertos externos ("plan libro"). Presupone certeza y control total sobre las variables.
2. *Planificación Estratégica Situacional:* Apoyada en la proferencia y en el juego sociopolítico. Reconoce el conflicto y la existencia de múltiples actores. Postula que *"planifica quien gobierna"*.
3. *Planificación Prospectiva Estratégica:* Construye participativamente *imágenes de futuro (utopías, anhelos y proyectos compartidos)* con los actores involucrados, diseñando trayectorias estratégicas para cerrar la brecha entre el presente real y el horizonte elegido.

== 4.4. La Matriz de Gabriel Kaplún
Los autores rescatan la tipología de Gabriel Kaplún, quien cruza dos variables axiales:
- *Eje de Racionalidad:* Racionalidad simple (previsión estricta) vs. Racionalidad compleja (aprendizaje institucional continuo).
- *Eje de Actores:* Tarea exclusiva de técnicos y expertos vs. Co-construcción dialógica con los afectados e involucrados.

== 4.5. Aporte a la Planificación de Recursos Humanos
Aporta la *dimensión comunicacional, subjetiva y participativa* a la gestión de personal. Demuestra que los planes de RRHH fracasan si se imponen como reglamentos fríos elaborados en despachos aislados; adquieren fuerza y legitimidad cuando se nutren de los saberes de los trabajadores y sintonizan con sus expectativas de desarrollo.

#pagebreak()

// ==========================================
// CAPÍTULO 5: SIMÓN DOLAN
// ==========================================

= 5. Simón Dolan: Planificación de los Recursos Humanos

*Obra de Referencia:* _La Gestión de los Recursos Humanos_ (Capítulo 3, McGraw-Hill, 1999).

== 5.1. Concepto y Fines de la PRHH
Simón Dolan conceptualiza la Planificación de Recursos Humanos (PRHH) como el proceso directivo mediante el cual se diseñan e implementan programas para garantizar que la empresa disponga del *número adecuado (aspecto cuantitativo)* y del *tipo adecuado (aspecto cualitativo: competencias, conocimientos y actitudes)* de personas, en el *momento oportuno y en el lugar adecuado*.

#callout(title: "Fines Estratégicos de la PRHH según Dolan", icon: "🎯")[
  1. *Reducir costos operativos:* Corregir con anticipación los desequilibrios de plantilla (tanto la escasez crítica de personal calificado como los excesos ociosos).
  2. *Optimizar las aptitudes del personal:* Ubicar a cada colaborador en la posición que maximice su potencial productivo.
  3. *Fundamentar la planificación empresarial:* Garantizar a la alta dirección que los planes de negocio son operativamente viables en términos de capital humano.
  4. *Evaluar las políticas de gestión:* Auditar el rendimiento de los programas de captación, formación y compensación.
]

== 5.2. La Paradoja del 16%
Dolan expone un hallazgo empírico trascendental: mientras el *100% de los gerentes* declara en encuestas que el personal es el activo más vital, *menos del 16% de las empresas* realiza una planificación formal y sistemática de sus recursos humanos. La mayoría opera de manera reactiva, atendiendo despidos y contrataciones según la urgencia del día.

== 5.3. El Balance de Personal: Demanda vs. Oferta

```
[ Previsión de la Demanda ]  ◄──────────────►  [ Previsión de la Oferta ]
(Personal Requerido por la Empresa)             (Personal Disponible Interno / Externo)
                                       ▼
                       [ Necesidades Netas de Personal ]
            ┌──────────────────────────┴──────────────────────────┐
            ▼                                                     ▼
 [ Demanda > Oferta: Déficit ]                         [ Oferta > Demanda: Superávit ]
  • Reclutamiento y selección externa                   • Congelamiento de contrataciones
  • Horas extraordinarias                               • Planes de retiro voluntario / jubilación
  • Reentrenamiento y reasignación interna              • Reducción de jornada / Reubicaciones
```

== 5.4. Instrumental Metodológico de Previsión

#table(
  columns: (1.2fr, 1.4fr, 1.4fr),
  fill: (col, row) => if row == 0 { rgb("#edf2f7") } else if calc.odd(row) { rgb("#f7fafc") } else { white },
  stroke: 0.5pt + rgb("#cbd5e0"),
  inset: 7pt,
  [*Tipo de Previsión*], [*Métodos Cualitativos / Basados en Juicios*], [*Métodos Cuantitativos / Estadísticos*],
  [Previsión de la Demanda], [*Técnica Delphi:* Consultas anónimas sucesivas a expertos hasta consenso. \ *Grupo Nominal:* Votación estructurada.], [*Regresión Lineal Simple y Múltiple.* \ *Curvas de Aprendizaje:* Reducción de horas/hombre por experiencia acumulada. \ *Ratios de Productividad.*],
  [Previsión de la Oferta], [*Inventario de Habilidades / Personal:* Base de datos cualitativa de perfiles. \ *Matrices de Sustitución / Cuadros de Reemplazo.*], [*Cadenas de Markov:* Matrices probabilísticas de movimientos internos, ascensos y rotación.]
)

== 5.5. Fases del Proceso y el Rol del SIRH
Dolan divide la PRHH en cuatro etapas: 1) Análisis de datos y pronóstico de oferta/demanda; 2) Formulación de políticas de personal; 3) Programación operativa (reclutamiento, traslados, desvinculaciones); y 4) Control y evaluación. Subraya que este ciclo es inviable sin un *Sistema de Información de Recursos Humanos (SIRH)* automatizado y confiable.

#pagebreak()

// ==========================================
// CAPÍTULO 6: MENDOZA, LÓPEZ Y SALAS
// ==========================================

= 6. Mendoza, López y Salas: Planificación Estratégica de RRHH

*Obra de Referencia:* _Planificación estratégica de recursos humanos. Efectiva forma de identificar necesidades de personal_ (Revista Económicas CUC, 2015).

== 6.1. Concepto y la "Función Sombrilla"
Darcy Mendoza Fernández, Dany López Juvinao y Edwin Salas Solano definen la PERHH como el proceso directivo proactivo para proyectar las necesidades de talento frente a entornos cambiantes, ubicando a la persona idónea en el puesto preciso y en el tiempo exacto.

Introducen la célebre metáfora de la *función sombrilla*: la PERHH actúa como un gran paraguas que articula y da coherencia a todos los subsistemas de personal (selección, inducción, formación, sueldos, relaciones gremiales y desvinculación), impidiendo que funcionen como compartimentos estancos desalineados de la estrategia corporativa.

== 6.2. El Análisis de Puesto como Piedra Angular
Para los autores, el *Análisis y Descripción de Puestos* es el fundamento técnico indispensable de la PERHH:
- Describe las tareas, responsabilidades y competencias que exige la posición.
- Define el perfil objetivo de búsqueda en la selección y los estándares con los que se medirá el rendimiento.
- Asegura la equidad salarial interna al evaluar objetivamente el peso de cada rol.

== 6.3. Justificaciones Estratégicas y Desfase Temporal (*Lead Time*)
Mendoza et al. (citando a Milkovich y Boudreau) destacan que la PERHH es obligatoria por tres motivos:
1. *Retención en Calidad y Cantidad:* Blindar a los mejores talentos frente a la competencia de mercado.
2. *Previsión del Desfase Temporal:* Entre que se produce una vacante y el nuevo colaborador alcanza el nivel de productividad requerido transcurre un período crítico que debe anticiparse.
3. *Reducción de la Rotación No Deseada:* Diseñar esquemas de motivación y carrera para minimizar renuncias imprevistas.

== 6.4. Fases del Proceso Integrado de PERHH
Articulando el modelo clásico de Jiménez (6 fases), los autores proponen:

#callout(title: "Etapas del Proceso de PERHH (Mendoza et al.)", icon: "🔄")[
  1. *Fijación de Objetivos:* Alinear las metas de personal a la expansión o reconversión del negocio.
  2. *Análisis Situacional (FODA):* Auditoría del inventario interno y del mercado laboral externo.
  3. *Análisis del Desfase (Gap Analysis):* Diagnosticar las brechas de competencias y dotación.
  4. *Elaboración de Planes:* Formular planes de adquisición, capacitación y compensaciones.
  5. *Implantación:* Ejecución operativa de programas con cronogramas y presupuestos.
  6. *Evaluación y Planes de Carrera:* Medición de resultados e impulso al desarrollo profesional de los empleados.
]

== 6.5. Aporte a la Planificación de Recursos Humanos
Integran la *gestión por competencias* con los *planes de carrera*. Demuestran que planificar personal no es una simple tarea burocrática de "llenar vacantes", sino una palanca estratégica de valor que incrementa la rentabilidad y la competitividad institucional.

#pagebreak()

// ==========================================
// CAPÍTULO 7: SÍNTESIS Y CRITERIOS DE EXAMEN
// ==========================================

= 7. Síntesis Comparativa y Criterios de Evaluación Docente

== 7.1. Matriz Comparativa de los Seis Autores

#table(
  columns: (1fr, 1.2fr, 1.4fr, 1.4fr),
  fill: (col, row) => if row == 0 { rgb("#edf2f7") } else if calc.odd(row) { rgb("#f7fafc") } else { white },
  stroke: 0.5pt + rgb("#cbd5e0"),
  inset: 6.5pt,
  [*Autor*], [*Enfoque Dominante*], [*Aporte Distintivo*], [*Concepto Clave para Examen*],
  [Marianela Armijo], [Sector Público / GpR], [Articulación de la planificación con el presupuesto público.], [4 Indicadores: Eficacia, Eficiencia, Economía y Calidad.],
  [Alfredo Ossorio], [Planificación Situacional], [El planificador es un *actor situado*; el entorno es conflictivo.], [Momentos de Matus (Explicativo, Normativo, Estratégico, Táctico).],
  [Palacios Acero], [Dirección Estratégica], [Evolución hacia la *Empresa Social*; personas como ventaja competitiva.], [Estrategias deliberadas vs. emergentes y Balanced Scorecard.],
  [Iglesias, Pagola y Uranga], [Comunicación y Prospectiva], [El porvenir se construye trayendo el futuro deseado al presente.], [Proferencia (mira el pasado) vs. Prospectiva (mira el futuro).],
  [Simón Dolan], [Previsión Cuantitativa], [Modelos matemáticos de balance y la paradoja del 16%.], [Oferta vs. Demanda, Delphi, Curvas de aprendizaje y Markov.],
  [Mendoza, López y Salas], [Gestión por Competencias], [La planificación como "función sombrilla" y planes de carrera.], [Análisis de Puestos como piedra angular y previsión del desfase.]
)

== 7.2. Criterios de Corrección y Puntos Clave de Parcial

#tip-parcial(title: "Los Mandamientos Docentes para Aprobar los Parciales")[
  A partir del análisis de las desgrabaciones oficiales de las clases de la cátedra:

  1. *Uso Estricto del Vocabulario Técnico:* Las docentes penalizan severamente las respuestas redactadas con lenguaje coloquial o de "sentido común". Se debe utilizar la terminología precisa de los autores (diferenciar claramente eficacia de eficiencia, y control de auditoría).
  2. *Reglas de Redacción de Objetivos Estratégicos:*
     - *Obligatorio:* Iniciar con un *verbo en infinitivo de acción concreta y medible* (ej. _"Rediseñar"_, _"Capacitar"_, _"Implementar"_, _"Disminuir"_).
     - *Prohibido:* Usar verbos ambiguos que no expresan resultados auditables (como _"fomentar"_, _"procurar"_ o _"propender"_).
  3. *Plan vs. Estrategia:* Recordar que el plan es la toma anticipada de decisiones estructurada formalmente; la estrategia es la pericia, método y estilo reflexivo de acción consciente, adaptativo y condicional frente a otros actores.
  4. *No Dejar Consignas en Blanco:* La mayor parte de los aplazos se originan en preguntas no contestadas por falta de lectura de los textos bibliográficos.
]

#v(20pt)
#align(center)[
  #text(size: 9pt, style: "italic", fill: rgb("#718096"))[
    Fin del Dossier Académico · Unidad 1: Planificación Estratégica de Recursos Humanos \
    Gestión de Recursos Humanos III — Ciclo Lectivo 2025
  ]
]
