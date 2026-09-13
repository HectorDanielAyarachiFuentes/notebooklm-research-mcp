#set document(
  title: "Unidad 4: Perspectiva Actual de la Gestión de RRHH e Inteligencia Artificial",
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
        text(size: 8.5pt, fill: rgb("#475569"), font: "Liberation Sans", weight: "medium")[
          Gestión de Recursos Humanos III · *Unidad 4: Perspectiva Actual e IA en RRHH*
        ],
        text(size: 8.5pt, fill: rgb("#64748b"), font: "Liberation Sans")[
          Dossier Académico 2025
        ]
      )
      #v(-2pt)
      #line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
    ]
  },
  footer: context [
    #line(length: 100%, stroke: 0.5pt + rgb("#e2e8f0"))
    #v(2pt)
    #grid(
      columns: (1fr, auto),
      align: (left, right),
      text(size: 8pt, fill: rgb("#94a3b8"))[
        Facultad de Ciencias Económicas · Cátedra GRH III
      ],
      text(size: 8.5pt, fill: rgb("#334155"), weight: "bold")[
        #counter(page).display("1 / 1", both: true)
      ]
    )
  ]
)

#set text(
  font: ("Liberation Sans", "DejaVu Sans", "Arial"),
  size: 10.5pt,
  lang: "es",
  fill: rgb("#1e293b")
)

#set par(
  justify: true,
  leading: 0.75em,
  first-line-indent: 0pt,
)

// Paleta de colores institucional
#let c-primary = rgb("#0f172a")      // Slate muy oscuro
#let c-secondary = rgb("#1e40af")    // Azul corporativo profundo
#let c-accent = rgb("#0f766e")       // Verde azulado / Teal tecnológico
#let c-highlight = rgb("#4338ca")    // Índigo moderno
#let c-bg-callout = rgb("#f0fdfa")   // Fondo verdoso claro
#let c-border-callout = rgb("#0d9488")
#let c-bg-warn = rgb("#fffbeb")      // Ámbar suave
#let c-border-warn = rgb("#d97706")
#let c-bg-tech = rgb("#f8fafc")      // Gris pizarra suave para código/tablas

// Cajas de llamado (Callouts)
#let callout(title: "", body, icon: "💡") = [
  #v(8pt)
  #rect(
    width: 100%,
    fill: c-bg-callout,
    stroke: (left: 4pt + c-border-callout, rest: 0.5pt + rgb("#99f6e4")),
    radius: (right: 4pt),
    inset: (x: 14pt, y: 10pt)
  )[
    #if title != "" [
      #text(weight: "bold", size: 10.5pt, fill: c-accent)[#icon #title] \
      #v(4pt)
    ]
    #text(size: 9.8pt, fill: rgb("#1e293b"))[#body]
  ]
  #v(8pt)
]

#let tip-parcial(title: "Tip de Cátedra para el Parcial", body) = [
  #v(8pt)
  #rect(
    width: 100%,
    fill: c-bg-warn,
    stroke: (left: 4pt + c-border-warn, rest: 0.5pt + rgb("#fde68a")),
    radius: (right: 4pt),
    inset: (x: 14pt, y: 10pt)
  )[
    #text(weight: "bold", size: 10.5pt, fill: c-border-warn)[⚠️ #title] \
    #v(4pt)
    #text(size: 9.8pt, fill: rgb("#78350f"))[#body]
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
  #text(size: 13pt, weight: "bold", tracking: 2pt, fill: rgb("#64748b"))[
    UNIVERSIDAD NACIONAL · FACULTAD DE CIENCIAS ECONÓMICAS
  ] \
  #text(size: 11pt, weight: "medium", fill: rgb("#94a3b8"))[
    Cátedra de Gestión de Recursos Humanos III · Ciclo Lectivo 2025
  ]
  
  #v(2.3cm)
  #rect(fill: c-primary, radius: 6pt, inset: (x: 20pt, y: 16pt))[
    #text(size: 21pt, weight: "bold", fill: white)[
      PERSPECTIVA ACTUAL DE LA GESTIÓN DE RRHH E INTELIGENCIA ARTIFICIAL
    ]
  ]
  
  #v(0.8cm)
  #text(size: 14pt, weight: "medium", fill: c-secondary)[
    Dossier Teórico, Analítico y Crítico de Autores Obligatorios · Unidad N° 4
  ]
  
  #v(1cm)
  #text(size: 10.5pt, style: "italic", fill: rgb("#334155"))[
    Articulación exhaustiva entre la bibliografía formal y los debates de cátedra: \
    Peter Cappelli & Nikolai Rogovsky (OIT) · Roberto Salazar Pazmiño et al. \
    Estrategia de RRHH de la OIT (2022-2025) · Bejerman RRHH / Thomson Reuters
  ]

  #v(4.2cm)
  #line(length: 50%, stroke: 1pt + rgb("#cbd5e1"))
  #v(0.3cm)
  #text(size: 9.5pt, fill: rgb("#64748b"))[
    *Compilación Académica y Guía de Examen Final* \
    Basado en los textos oficiales de estudio y las transcripciones de clase (2025)
  ]
]

#pagebreak()

// ==========================================
// ÍNDICE Y RESUMEN GENERAL
// ==========================================

#outline(
  title: [Tabla de Contenidos · Unidad 4],
  indent: 1.5em,
  depth: 2,
)

#v(1.5cm)

#callout(title: "Objetivo y Sentido Pedagógico de la Unidad 4", [
  La **Unidad 4** constituye el cierre estratégico y prospectivo del programa de *Gestión de Recursos Humanos III*. Aborda la profunda transformación de la función de Recursos Humanos a partir de la irrupción de la **Inteligencia Artificial (IA)**, los algoritmos predictivos en la selección de personal, la analítica masiva de datos (*People Analytics*), la automatización fiscal de nóminas y las nuevas regulaciones globales sobre teletrabajo, ética laboral y diversidad.
  
  El eje conceptual vertebrador consiste en entender cómo el área de RRHH supera su tradicional condición de "departamento administrativo-transaccional" para convertirse en el **líder estratégico de la gestión del cambio cultural y tecnológico**, articulando el rendimiento económico con el trabajo decente y el respeto por los derechos humanos laborales.
])

#v(1cm)

#tip-parcial(title: "Reglas de Redacción Académica y Criterio Evaluativo", [
  Al igual que en las unidades previas, las evaluaciones parciales y finales exigen un manejo riguroso del vocabulario técnico:
  - *No utilizar términos coloquiales*: reemplace expresiones ambiguas por conceptos teóricos precisos (*matching algorítmico, clasificación supervisada Random Forest, videoentrevistas AI-AVI, algoritmos de salvaguarda, sistemas salvajes, tutorías inversas, People Analytics*).
  - *Evitar verbos de deseo o vaguedad*: quedan prohibidos verbos como *"fomentar"* o *"procurar"*; emplee verbos activos en infinitivo (*"garantizar, parametrizar, auditar, mitigar, estructurar, implementar"*).
  - *Enfoque crítico e integrador*: la cátedra no evalúa el conocimiento de la tecnología desde un determinismo ingenuo, sino desde la tensión permanente entre eficiencia productiva, sesgos discriminatorios y derechos de los trabajadores.
])

#pagebreak()

// ==========================================
// CAPÍTULO 1: CAPPELLI, ROGOVSKY Y SALAZAR PAZMIÑO
// ==========================================

= 1. Inteligencia Artificial en la Gestión de RRHH y Disrupción Tecnológica
*Peter Cappelli, Nikolai Rogovsky (OIT) y Roberto Salazar Pazmiño et al.*

== 1.1. Contexto de Inflexión: De la Tarea Operativa al Cambio Cultural
La incorporación de la Inteligencia Artificial (IA) y el Aprendizaje Automático (*Machine Learning*) en la gestión de personas representa un salto cualitativo sin precedentes. Acelerado de manera determinante por la pandemia de COVID-19, el área de Recursos Humanos debió abandonar los procedimientos analógicos para liderar la atracción, evaluación y coordinación de equipos de trabajo distribuidos geográficamente.

En este nuevo escenario, el rol directivo de RRHH no consiste simplemente en adquirir licencias de software, sino en gobernar la interacción entre personas y sistemas automatizados, garantizando que la tecnología potencie la productividad sin vulnerar la dignidad del trabajador.

== 1.2. El Impacto de los Algoritmos en la Selección y Evaluación de Personal
La automatización del proceso de selección se estructura en tres etapas tecnológicas diferenciadas:

#v(4pt)
1. *Búsqueda Automatizada y Big Data:*
   - Rastreo exhaustivo en portales laborales, repositorios profesionales y redes sociales mediante Procesamiento de Lenguaje Natural (NLP).
   - Utilización de clasificadores algorítmicos supervisados (como *Random Forest*) para contrastar el contenido del currículum vitae con los requerimientos del puesto, prediciendo la idoneidad técnica y la compatibilidad geográfica.
2. *Evaluación de Habilidades Objetivas en Entornos Técnicos:*
   - Pruebas automatizadas de desempeño real (revisión de código de programación, simulaciones de cálculo o diseño estructural).
   - El sistema califica parámetros de eficiencia y calidad técnica sin intervención humana inicial, acelerando los tiempos de respuesta del equipo de reclutamiento.
3. *Entrevistas en Video Asincrónicas Mediadas por IA (AI-AVI):*
   - Los postulantes responden preguntas pregrabadas frente a su cámara. Los algoritmos procesan el lenguaje verbal (léxico, coherencia semántica) y variables no verbales (modulación acústica, microexpresiones faciales y contacto visual).
   - *Hallazgo investigativo sobre la percepción de los candidatos:* Los postulantes tienden a percibir al evaluador algorítmico como un juez más **objetivo y neutral** que el entrevistador humano en pruebas de rendimiento específico, al considerarlo inmune a simpatías personales. Sin embargo, en las etapas decisorias finales, la ausencia de empatía humana despierta frustración y sensación de despersonalización.

== 1.3. El Dilema Ético Central: Sesgos Algorítmicos vs. Algoritmos de Salvaguarda

#callout(title: "La Falacia de la Neutralidad de la Inteligencia Artificial", [
  Un software de IA carece de conciencia propia; sus decisiones son el resultado matemático de las bases de datos con las que ha sido entrenado. Si las contrataciones y ascensos de los últimos 20 años reflejan discriminaciones históricas (por ejemplo, menor presencia de mujeres o minorías en cargos directivos), el algoritmo aprenderá que esas características correlacionan negativamente con el éxito y *amplificará matemáticamente el sesgo discriminatorio a escala masiva*.
], icon: "⚖️")

Para contrarrestar este riesgo, la literatura distingue tres conceptos esenciales:
- *Filtros Ciegos:* Programación explícita para omitir variables demográficas sensibles (género, edad, nacionalidad, fotografía, código postal) durante el cribado inicial.
- *Riesgo de Variables Sustitutas (Proxies):* Aunque se elimine el dato de género, el algoritmo puede deducirlo a través de variables sustitutas (por ejemplo, años de interrupción laboral o actividades extracurriculares), perpetuando el sesgo de forma encubierta.
- *Algoritmos de Salvaguarda (Ethical Decision-Making):* Diseño de mecanismos de supervisión y auditoría algorítmica (*Fairness by Design*). Exige que las empresas puedan explicar de forma inteligible (*explainability*) los motivos que determinaron el descarte o avance de un candidato.

== 1.4. Vigilancia Digital y el Surgimiento de los "Sistemas Salvajes"
El monitoreo algorítmico continuo de la actividad digital (rastreo de correos electrónicos, tiempos de actividad en pantalla o análisis de publicaciones públicas en redes) genera severas fricciones sobre la frontera entre la vida privada y la jornada laboral.

#tip-parcial(title: "¿Qué son los 'Sistemas Salvajes' (Wild Systems / Shadow IT)?", [
  Es una de las preguntas de mayor recurrencia en parciales y finales. Se denomina *"Sistema Salvaje"* a toda herramienta informática o práctica paralela informal creada por los profesionales de RRHH o los líderes operativos (planillas de Excel personales, canales informales de mensajería, selección por recomendación oculta) como respuesta de frustración ante sistemas corporativos rígidos, lentos o defectuosos.
  
  *Impacto en la gestión*: Fracturan la gobernanza de datos de la empresa, generan duplicación de esfuerzos e invalidan la estrategia digital institucional.
])

== 1.5. La Agenda de IA Centrada en el Ser Humano (IACH) y Teaming Humano-IA
Frente al enfoque puramente tecnocrático, la OIT y los investigadores académicos promueven la **IA Centrada en el Ser Humano (IACH)**:
- *Superación del Enfoque Defensivo:* No es suficiente cumplir formalmente con leyes de privacidad y protección de datos ("no dañar"); la IA debe generar **valor, confianza y bienestar** para los colaboradores en su tarea cotidiana.
- *Colaboración Humano-IA (Human-AI Teaming):* El algoritmo no desplaza al criterio humano, sino que asume las funciones de cálculo intensivo, procesamiento de patrones y recomendaciones predictivas.
- *Autonomía Dinámica Adaptativa:* El grado de delegación en el sistema inteligente debe modularse según el riesgo de la tarea. En decisiones de desvinculación, sanción disciplinaria o contratación final, la intervención y juicio crítico humano son legal y éticamente indelegables.

== 1.6. Realidad Virtual (RV), Realidad Aumentada (RA) y Gemelos Digitales
Para profesiones técnicas operativas de alto riesgo (operación minera, plataformas petroleras, emergencias químicas o extinción de incendios), se aplican simulaciones inmersivas en RV/RA:
- *Mapas Cognitivos y Gemelos Digitales:* Se modela computacionalmente el comportamiento de trabajadores expertos ante crisis no rutinarias.
- *Aceleración del Aprendizaje:* Permite entrenar a empleados novatos enfrentándolos a réplicas digitales de situaciones críticas sin poner en peligro vidas humanas ni dañar equipamiento productivo costoso.

#pagebreak()

// ==========================================
// CAPÍTULO 2: ESTRATEGIA DE RRHH DE LA OIT 2022-2025
// ==========================================

= 2. Estrategia de Recursos Humanos de la OIT (2022-2025)
*Documento Oficial del Consejo de Administración (343.ª reunión): "Diversidad, Rendición de Cuentas y Respeto"*

== 2.1. Marco Institucional y Propósito
Aprobada en la 343.ª reunión del Consejo de Administración de la OIT, esta estrategia fija los lineamientos globales para que la Oficina Internacional del Trabajo cuente con un cuerpo laboral regido por los más altos estándares de competencia, integridad y representatividad.

El modelo se desglosa en tres resultados operativos y estratégicos:

#v(8pt)
#table(
  columns: (1.2fr, 2.5fr, 1.8fr),
  fill: (x, y) => if y == 0 { c-primary } else if calc.even(y) { rgb("#f8fafc") } else { white },
  stroke: 0.5pt + rgb("#cbd5e1"),
  inset: 8pt,
  align: (col, row) => if row == 0 { center + horizon } else { left + horizon },
  [#text(weight: "bold", fill: white)[Eje Estratégico]],
  [#text(weight: "bold", fill: white)[Líneas de Acción y Programas Clave]],
  [#text(weight: "bold", fill: white)[Métricas e Indicadores]],
  
  [*Resultado 1:* \ Fuerza laboral diversa y competencias],
  [Desarrollo de las 4 competencias transversales prioritarias; atracción de jóvenes profesionales; política vinculante para personas con discapacidad; programa de Tutorías Inversas.],
  [Encuestas de brechas de habilidades; paridad de género directiva; representación de países no representados.],
  
  [*Resultado 2:* \ Entorno respetuoso y empoderamiento],
  [Rendición de cuentas ante el Comité de Informes; modelo híbrido de teletrabajo; Plan de Acción sobre Salud Mental; Comité de Disciplina y tolerancia cero al acoso.],
  [16% de teletrabajo global (82% de impacto positivo en conciliación); publicación pública de resoluciones disciplinarias.],
  
  [*Resultado 3:* \ Digitalización y eficiencia],
  [Migración a plataformas de autoservicio en la nube (reembolsos médicos SHIF, expedientes electrónicos); eliminación de la burocracia en papel.],
  [69% de procesos digitalizados a 2024; meta vinculante del 75% para finales de 2025.]
)
#v(8pt)

== 2.2. Resultado 1: Las Cuatro Esferas Prioritarias Transversales de Competencias
A partir de un exhaustivo diagnóstico global de carencias de capacidades (*skill-gap analysis*), la OIT resolvió que todo su personal, sin distinción de jerarquía ni especialidad, debe adquirir formación continua en cuatro ejes estratégicos:

#v(4pt)
1. *Utilización de la Inteligencia Artificial:* Aplicación productiva de herramientas predictivas y generativas para el análisis normativo, síntesis de datos y optimización de flujos laborales cotidianos.
2. *Análisis de Datos (Data Analytics):* Alfabetización cuantitativa, modelización estadística y formulación de políticas sociolaborales basadas en evidencia empírica rigurosa.
3. *Comunicación Eficaz:* Dominio de narrativas digitales contemporáneas y gestión estratégica de redes sociales para incidir en la opinión pública global.
4. *Integración de Temas Ecológicos y Sostenibilidad:* Comprensión del cambio climático, uso eficiente de recursos y promoción de la "transición justa" hacia empleos verdes en todos los proyectos de cooperación.

=== Diversidad, Inclusión y Tutorías Inversas (*Reverse Mentoring*)
- *Ajustes Razonables para Personas con Discapacidad:* Dotación presupuestaria específica para adaptar puestos físicos y plataformas virtuales, junto con programas de pasantías inclusivas remuneradas.
- *El Programa de Tutorías Inversas:* Jóvenes funcionarios subalternos desempeñan el rol de tutores tecnológicos de los directivos sénior. Este dispositivo democratiza el conocimiento digital, desarticula barreras jerárquicas tradicionales y promueve un aprendizaje intergeneracional bidireccional.

== 2.3. Resultado 2: Entorno Respetuoso, Teletrabajo y Rendición de Cuentas
- *Rendición de Cuentas (Accountability):* La evaluación de desempeño cuenta con el seguimiento activo del **Comité de Informes**. En casos de insuficiencia reiterada, se aplican medidas de gestión de consecuencias (planes de mejora tutelados o desvinculación formal).
- *Política de Teletrabajo Híbrido:* Fija franjas horarias comunes y días mínimos de presencia física para mantener la cultura y cohesión de equipo.
  - El teletrabajo representa el **16% del tiempo laboral global** de la OIT (22% en la sede de Ginebra y 13% en oficinas de terreno).
  - El **82% de los trabajadores** evaluó como muy positiva la política para conciliar la vida laboral con las responsabilidades familiares y personales.
- *Ambientes Éticos y Disciplina Pública:* Tolerancia cero al acoso moral, sexual y al abuso de poder. El **Comité de Disciplina** publica de manera transparente las resoluciones de las investigaciones sumarias para infundir confianza en los canales institucionales de denuncia.

== 2.4. Resultado 3: Digitalización Acelerada y Autogestión
La OIT consolidó la digitalización de sus operaciones de personal, alcanzando un **69% de procesos automatizados en 2024** con meta del **75% para 2025**. La implementación del sistema SHIF (gestión digital de reembolsos de salud) y de legajos electrónicos eliminó la intermediación burocrática, permitiendo que el área de personal libere recursos hacia la gestión estratégica del talento.

#pagebreak()

// ==========================================
// CAPÍTULO 3: LAS 5 TENDENCIAS TECNOLÓGICAS (BEJERMAN)
// ==========================================

= 3. Las 5 Tendencias Tecnológicas para Recursos Humanos
*Bejerman RRHH · Thomson Reuters*

== 3.1. Transformación Digital: De la Tarea Manual al Valor Estratégico
El informe técnico de Bejerman RRHH analiza cómo las tecnologías cloud y la ciencia de datos están redefiniendo las áreas de recursos humanos en América Latina:
- Tradicionalmente, la administración de personal consumía sus mayores esfuerzos en tareas mecánicas: carga repetitiva de novedades de nómina, archivo físico de legajos y emisión manual de recibos.
- La digitalización traslada el centro de gravedad del departamento: automatiza la burocracia operativa para que el profesional de RRHH actúe como **socio del negocio**, optimizando costos, garantizando el cumplimiento normativo y mejorando el clima organizacional.

== 3.2. Desarrollo Exhaustivo de las 5 Tendencias

#v(4pt)
=== 1. AFIP 4.0 / Digitalización Impositiva y Laboral
- *Adopción del Libro de Sueldo Digital (AFIP/ARCA):* Integración directa entre el software de nómina y los servidores de la autoridad fiscalizadora.
- *Ventajas Inmediatas:*
  - Generación automática de la Declaración Jurada de Cargas Sociales (Formulario 931).
  - Supresión de la doble carga de datos y erradicación de errores de cálculo.
  - Eliminación de multas punitorias y sanciones por inconsistencias entre nómina y fiscalidad.

=== 2. Aplicaciones Cloud para Liquidación de Sueldos y Haberes
- *Parametrización Multi-Convenio:* Capacidad computacional para liquidar sueldos regidos por múltiples Convenios Colectivos de Trabajo (CCT) de forma simultánea, aplicando de manera automática escalas variables, presentismo, horas nocturnas e ítems no remunerativos.
- *Motor de Cálculo para Ganancias (4ª Categoría):* Cálculo exacto de las deducciones personales y tablas progresivas del Impuesto a las Ganancias sobre los salarios, adaptándose de forma instantánea a modificaciones legislativas imprevistas.
- *Continuidad Operativa:* Arquitectura en la nube con acceso cifrado que garantiza la liquidación y pago puntual aun en contextos de trabajo remoto forzoso o cierres edilicios.

=== 3. People Analytics y Reclutamiento Guiado por Datos (*Data-Driven Recruitment*)
- *Superación de la Intuición:* Reemplazo de las decisiones basadas en la simpatía personal por modelos predictivos sustentados en grandes volúmenes de datos.
- *Filtro Predictivo de Candidatos:* Ponderación matemática de variables de adecuación al perfil del puesto, disminuyendo la tasa de rotación temprana.
- *Monitoreo de Indicadores Clave en Tiempo Real:* Tableros interactivos (dashboards) que informan al instante:
  - Tasa de ausentismo por sector y causa médica.
  - Costo financiero de horas extras vs. costo marginal de contratación.
  - Medición del retorno de la inversión (ROI) de los programas de capacitación.

=== 4. Trabajo Colaborativo, Teletrabajo y Autogestión del Empleado
- *Repositorio Centralizado Seguro:* Base de datos unificada con segmentación de accesos por roles y perfiles de seguridad, resguardando la confidencialidad de los datos personales y médicos.
- *Portal del Colaborador (Employee Self-Service):*
  - Notificación, visualización y firma digital o electrónica de recibos de haberes con plena validez legal probatoria.
  - Gestión directa de licencias ordinarias y especiales (pedidos de vacaciones, certificados médicos) sin planillas de papel ni traslados físicos.
- *Soporte a la Flexibilidad Híbrida:* Permite el registro de jornada y la comunicación corporativa fluida en entornos de trabajo distribuidos.

=== 5. Evaluación de Desempeño Digital y Gestión del Talento
- *Evaluaciones Continuas y Multi-Fuente:* Plataformas que posibilitan esquemas de evaluación 90°, 180° y 360°, registrando devoluciones de rendimiento periódicas a lo largo del año.
- *Alineación con Objetivos (OKRs y KPIs):* Vinculación transparente entre las metas individuales del puesto y los objetivos estratégicos globales de la organización.
- *Detección de Talento y Sucesión:* Utilización de la matriz *9-Box* (Desempeño vs. Potencial) para identificar colaboradores clave de alto potencial (*HiPo*) y diseñar cuadros de reemplazo para posiciones de liderazgo crítico.

== 3.3. Los Tres Pilares de Aporte de Valor al Negocio

```
                                  ┌─────────────────────────────┐
                                  │   APORTE DE VALOR DE RRHH   │
                                  └──────────────┬──────────────┘
                                                 │
                   ┌─────────────────────────────┼─────────────────────────────┐
                   ▼                             ▼                             ▼
     ┌───────────────────────────┐ ┌───────────────────────────┐ ┌───────────────────────────┐
     │   GESTIÓN ESTRATÉGICA     │ │    EFICIENCIA OPERATIVA   │ │  CUMPLIMIENTO NORMATIVO   │
     │      DEL TALENTO          │ │                           │ │                           │
     │ Modelos predictivos para  │ │ Erradicación del papel y  │ │ Blindaje legal ante       │
     │ ubicar a los mejores      │ │ de tareas manuales;       │ │ contingencias laborales,  │
     │ perfiles en los puestos   │ │ autogestión de trámites y │ │ fiscales e impositivas    │
     │ correctos y retenerlos.   │ │ reducción de tiempos.     │ │ (AFIP 4.0 y CCT).         │
     └───────────────────────────┘ └───────────────────────────┘ └───────────────────────────┘
```

#pagebreak()

// ==========================================
// CAPÍTULO 4: SÍNTESIS COMPARATIVA Y GUÍA DE EXAMEN
// ==========================================

= 4. Matriz Comparativa y Batería de Preguntas de Examen

== 4.1. Cuadro Comparativo Global de la Unidad 4

#v(8pt)
#table(
  columns: (1.5fr, 1.6fr, 1.8fr, 2.1fr),
  fill: (x, y) => if y == 0 { c-secondary } else if calc.even(y) { rgb("#f8fafc") } else { white },
  stroke: 0.5pt + rgb("#cbd5e1"),
  inset: 7pt,
  align: (col, row) => if row == 0 { center + horizon } else { left + horizon },
  [#text(weight: "bold", fill: white)[Autor / Fuente]],
  [#text(weight: "bold", fill: white)[Eje Temático Principal]],
  [#text(weight: "bold", fill: white)[Conceptos Teóricos Clave]],
  [#text(weight: "bold", fill: white)[Foco Crítico para Examen Final]],
  
  [*Cappelli, Rogovsky y Salazar Pazmiño*],
  [Inteligencia Artificial y Disrupción Tecnológica en RRHH],
  [Matching algorítmico; Random Forest; AI-AVI; Sesgos y Filtros Ciegos; Algoritmos de Salvaguarda; Sistemas Salvajes; IACH.],
  [La IA no es neutra: sin salvaguardas éticas ex-ante, replica y multiplica a escala los sesgos históricos de contratación.],
  
  [*Estrategia de RRHH de la OIT (2022-2025)*],
  [Diversidad, Rendición de Cuentas y Respeto en el Trabajo],
  [4 Esferas transversales de competencias; Inclusión y ajustes razonables; Tutorías Inversas; Teletrabajo híbrido; Comités de Disciplina e Informes.],
  [Modelo integral de trabajo decente: la tecnología debe subordinarse a la diversidad, la salud mental y la rendición de cuentas pública.],
  
  [*Bejerman RRHH / Thomson Reuters*],
  [Las 5 Tendencias Tecnológicas en la Gestión de Personas],
  [Libro de Sueldo Digital (AFIP 4.0); Liquidación multi-CCT; People Analytics; Portal del Empleado; Desempeño 360° y matriz 9-Box.],
  [La automatización de procesos libera a RRHH de la trampa operativa, transformándolo en socio estratégico del negocio.]
)
#v(8pt)

== 4.2. Batería de Preguntas Clave para Parciales y Finales

#callout(title: "Pregunta 1: ¿Por qué un sistema de IA puede ser más discriminatorio que un seleccionador humano?", [
  *Respuesta Modelo de Cátedra*: Porque la Inteligencia Artificial opera mediante modelos matemáticos entrenados con datos históricos de la propia organización. Si históricamente existió segregación de género o etnia en puestos de jerarquía, el algoritmo aprende que esas características correlacionan negativamente con el éxito del puesto y sistematiza el descarte automático. A diferencia de un prejuicio humano individual que afecta casos aislados, el sesgo algorítmico actúa como una *discriminación estructural a escala industrial*. Para mitigarlo, no basta con aplicar filtros ciegos (que pueden ser eludidos por variables sustitutas o *proxies*), sino que se deben auditar y programar *algoritmos de salvaguarda* y garantizar la explicabilidad del modelo.
], icon: "❓")

#callout(title: "Pregunta 2: Defina el concepto de 'Sistemas Salvajes' y explique cómo perjudican la gobernanza empresarial.", [
  *Respuesta Modelo de Cátedra*: Los *"Sistemas Salvajes"* (*Wild Systems* o *Shadow IT*) son aplicaciones informáticas no oficiales, canales paralelos o planillas de cálculo personales implementadas de forma encubierta por los mandos de línea o analistas de RRHH ante la frustración que les provocan las herramientas corporativas oficiales (por considerarlas lentas, inflexibles o desconectadas de la realidad del trabajo). 
  Perjudican la gobernanza corporativa porque:
  - Generan islas de información incomunicadas y bases de datos desactualizadas.
  - Vulneran la seguridad informática y las normativas de protección de datos personales.
  - Invalidan las inversiones estratégicas en tecnología y destruyen la coherencia de la gestión del talento.
], icon: "❓")

#callout(title: "Pregunta 3: ¿En qué consisten las 'Tutorías Inversas' (*Reverse Mentoring*) y qué persigue la OIT con su aplicación?", [
  *Respuesta Modelo de Cátedra*: Es una práctica de desarrollo organizacional donde se invierte la relación jerárquica y pedagógica tradicional: jóvenes profesionales subalternos actúan como tutores y mentores de directivos sénior en competencias tecnológicas, pensamiento digital, manejo de herramientas de IA y nuevas metodologías ágiles. La OIT persigue con esto acelerar la transformación digital del liderazgo sénior, desarticular culturas jerárquicas rígidas y construir puentes de diálogo intergeneracional que eviten la obsolescencia institucional.
], icon: "❓")

#callout(title: "Pregunta 4: ¿Cuáles son las cuatro esferas transversales de competencias fijadas por la OIT?", [
  *Respuesta Modelo de Cátedra*: La OIT determinó que todo trabajador moderno debe capacitarse en:
  1. *Utilización de la Inteligencia Artificial:* aplicación cotidiana y ética de herramientas automatizadas.
  2. *Análisis de Datos (Data Analytics):* lectura crítica, modelización estadística y toma de decisiones fundada en datos.
  3. *Comunicación Eficaz:* dominio de narrativas digitales y presencia en redes sociales institucionales.
  4. *Integración de Temas Ecológicos y Sostenibilidad:* incorporación de la transición justa, la neutralidad ambiental y el uso responsable de recursos en todo proyecto productivo.
], icon: "❓")

#callout(title: "Pregunta 5: ¿Cuáles son los tres pilares del aporte de valor de la tecnología según Bejerman RRHH?", [
  *Respuesta Modelo de Cátedra*:
  1. *Gestión Estratégica del Talento:* Utilizar analítica predictiva y evaluaciones continuas para colocar a las personas indicadas en los puestos clave y construir planes de carrera y sucesión.
  2. *Eficiencia Operativa:* Reducir tiempos muertos y costos de archivo mediante la erradicación del papel y la autogestión de trámites en el portal del empleado.
  3. *Cumplimiento Normativo y Mitigación de Riesgos:* Garantizar la correcta liquidación salarial según convenios colectivos y asegurar la integración fluida con los entes fiscales (Libro de Sueldo Digital de AFIP/ARCA) para evitar litigios y multas.
], icon: "❓")

#v(1cm)
#align(center)[
  #text(size: 11pt, weight: "bold", fill: c-secondary)[
    --- FIN DEL DOSSIER ACADÉMICO DE LA UNIDAD 4 ---
  ] \
  #text(size: 9.5pt, style: "italic", fill: rgb("#64748b"))[
    "La tecnología debe ser un medio para enriquecer el trabajo humano, nunca un fin que lo degrade o subyugue."
  ]
]
