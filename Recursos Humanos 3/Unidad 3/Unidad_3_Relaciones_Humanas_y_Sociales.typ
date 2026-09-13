#set document(
  title: "Unidad 3: Relaciones Humanas y Sociales",
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
          Gestión de Recursos Humanos III · *Unidad 3: Relaciones Humanas y Sociales*
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
      RELACIONES HUMANAS Y SOCIALES
    ]
  ]
  
  #v(0.8cm)
  #text(size: 14pt, weight: "medium", fill: c-secondary)[
    Dossier Teórico y Analítico de Autores Obligatorios · Unidad N° 3
  ]
  
  #v(1cm)
  #text(size: 10.5pt, style: "italic", fill: rgb("#4a5568"))[
    Articulación exhaustiva entre la bibliografía formal y los debates de clase: \
    Francisco Longo · Idalberto Chiavenato (Caps. 11, 12 y 13) · Jorge Aquino y colaboradores
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

#callout(title: "Propósito de la Unidad 3", icon: "🎯")[
  La Unidad 3 aborda la *dimensión colectiva* del trabajo. Examina la articulación de las políticas de bienestar y prestaciones sociales, los factores ambientales de higiene, seguridad y ergonomía (CVT), y la dinámica estratégica de las relaciones gremiales y sindicales en escenarios de negociación y poder.
]

#pagebreak()

// ==========================================
// CAPÍTULO 1: FRANCISCO LONGO
// ==========================================

= 1. Francisco Longo: Relaciones Humanas y Sociales en el Servicio Civil

*Obra de Referencia:* _Marco Analítico para el Diagnóstico Institucional de Sistemas de Servicio Civil_ (Págs. 42-45, BID).

== 1.1. Concepto y Objeto del Subsistema
Francisco Longo define este subsistema como el encargado de gestionar las relaciones entre la dirección y los trabajadores cuando las decisiones y políticas de personal asumen una *dimensión colectiva*.

A diferencia de las relaciones ordinarias de trabajo (que operan en el plano individual o de un puesto específico), aquí el interlocutor de la dirección no es el empleado singular, sino la *totalidad del personal o colectivos vinculados por identidades sociolaborales o profesionales genéricas*. Se articula transversalmente con todos los demás subsistemas de Recursos Humanos (Planificación, Organización del trabajo, Empleo, Rendimiento, Compensación y Desarrollo).

== 1.2. Los Tres Bloques de Gestión
Longo estructura el subsistema en tres ámbitos operativos complementarios:

1. *Gestión del Clima Organizativo:* Políticas de comunicación interna bidireccional (ascendente y descendente), canales de diálogo y encuestas periódicas para medir la satisfacción y el sentido de pertenencia en la misión institucional.
2. *Gestión de las Relaciones Laborales (RRLL):* Negociación colectiva sobre retribuciones, regímenes horarios y condiciones laborales con las organizaciones sindicales y órganos de representación electiva.
3. *Gestión de Políticas Sociales:* Preservación de la salud laboral, medicina ocupacional y provisión de beneficios colectivos orientados a grupos de trabajadores con necesidades específicas.

== 1.3. Puntos Críticos en el Ámbito Público
Longo diagnostica cinco tensiones estructurales características del empleo público:
- *Déficit de Comunicación Interna:* Percepción generalizada de opacidad en la toma de decisiones directivas.
- *Reactividad Laboral:* Predominio de una gestión reactiva ante conflictos sindicales, en lugar de una postura anticipatoria y estratégica.
- *Politización de las Relaciones Laborales:* Desdibujamiento de la frontera técnica cuando la cúpula política ejerce directamente el rol patronal con fines partidarios.
- *Ambigüedad Normativa:* Fricción entre la fijación legal de condiciones por estatuto público y los acuerdos paritarios. Longo promueve la institucionalización de *órganos de mediación y arbitraje*.
- *Sostenibilidad Fiscal:* Necesidad de asegurar que las prestaciones y beneficios sociales sean fiscalmente sostenibles y no configuren privilegios injustificados frente al sector privado.

#pagebreak()

// ==========================================
// CAPÍTULO 2: CHIAVENATO - PRESTACIONES SOCIALES
// ==========================================

= 2. Idalberto Chiavenato: Planes de Prestaciones Sociales (Cap. 11)

*Obra de Referencia:* _Administración de Recursos Humanos_ (Capítulo 11, McGraw-Hill).

== 2.1. Concepto y Origen de las Prestaciones
Las prestaciones sociales son facilidades, comodidades y servicios que las empresas brindan a sus colaboradores para satisfacer necesidades personales y familiares que el salario base no alcanza a cubrir:
- *Remuneración Directa:* Salario proporcional al puesto y cargo ocupado.
- *Remuneración Indirecta:* Paquete integral de prestaciones extendido a todos los trabajadores independientemente de su posición jerárquica.

== 2.2. Clasificación Estructural de las Prestaciones

#table(
  columns: (1.2fr, 1.4fr, 1.4fr),
  fill: (col, row) => if row == 0 { rgb("#edf2f7") } else if calc.odd(row) { rgb("#f7fafc") } else { white },
  stroke: 0.5pt + rgb("#cbd5e0"),
  inset: 7pt,
  [*Criterio de Clasificación*], [*Categoría*], [*Definición y Ejemplos Concretos*],
  [1. Por su Exigencia Legal], [*Legales u Obligatorias*], [Exigidas por ley o convenio (aguinaldo, vacaciones pagas, horas extras, seguridad social).],
  [], [*Espontáneas (Fringe Benefits)*], [Otorgadas voluntariamente por la empresa (vales de despensa, préstamos, transporte, guardería).],
  [2. Por su Naturaleza], [*Económicas (Dinerarias)*], [Entregadas en dinero o cheque (prima vacacional, bonos, reembolsos).],
  [], [*Extraeconómicas (Servicios)*], [Facilidades en especie (comedor, club, atención médica, horario flexible).],
  [3. Por sus Objetivos], [*Asistenciales*], [Seguridad ante emergencias (asistencia médica, seguro de vida, planes de jubilación).],
  [], [*Recreativas*], [Descanso e higiene mental (club social, eventos deportivos, áreas de distensión).],
  [], [*Complementarias*], [Comodidad diaria en planta (comedor corporativo, estacionamiento, cafetería).]
)

== 2.3. Fundamento Teórico y Principios de Costos
- *Relación con Herzberg y Maslow:* Las prestaciones cubren necesidades básicas y de seguridad, funcionando como *factores higiénicos*: previenen la insatisfacción, pero no generan motivación proactiva por sí solas sin enriquecimiento de las tareas.
- *Principio de Responsabilidad Mutua:* Los costos de los beneficios deben ser compartidos entre la empresa y el empleado para desterrar el paternalismo benevolente y elevar el valor percibido del servicio.
- *Principio del Rendimiento de la Inversión:* Todo plan social debe justificar un retorno positivo en productividad, retención y reducción del ausentismo.

#pagebreak()

// ==========================================
// CAPÍTULO 3: CHIAVENATO - CALIDAD DE VIDA EN EL TRABAJO
// ==========================================

= 3. Idalberto Chiavenato: Calidad de Vida en el Trabajo (Cap. 12)

*Obra de Referencia:* _Administración de Recursos Humanos_ (Capítulo 12, McGraw-Hill).

== 3.1. Higiene Laboral y Factores Ambientales (Ergonomía)
La higiene laboral previene el deterioro psicofísico del trabajador frente a riesgos:
- *Riesgos Físicos:* Ruido (intensidad en decibeles - db), vibraciones, calor, frío y radiaciones.
- *Riesgos Químicos:* Vapores, polvos, gases y solventes tóxicos.
- *Riesgos Biológicos:* Bacterias, virus y hongos infecciosos.

=== Parámetros Ambientales Críticos
- *Iluminación:* Luz adecuada según la tarea visual, clasificada en *directa, indirecta, semidirecta y semiindirecta*.
- *Ruido:* La exposición continua a más de 85 db deteriora la salud auditiva y genera fatiga nerviosa.
- *Ergonomía:* Adecuación antropométrica del puesto de trabajo para evitar trastornos musculoesqueléticos.

== 3.2. Seguridad Laboral y Prevención de Accidentes
- *Accidente de Trabajo:* Suceso súbito que produce daño corporal, funcional o la muerte.
- *Causas*:
  - *Condiciones Inseguras:* Fallas mecánicas, falta de protecciones, instalaciones defectuosas o pisos resbaladizos.
  - *Actos Inseguros:* Fallas humanas (negligencia, no uso de EPP, exceso de confianza o imprudencia).

#callout(title: "Comisión Paritaria de Higiene y Seguridad (CIPA / Mixta)", icon: "🛡️")[
  Órgano paritario integrado por representantes de los trabajadores y del empleador para investigar causas de accidentes, inspeccionar áreas de riesgo y promover la cultura de autocuidado.
]

#tip-parcial[
  En las evaluaciones se recuerda que el *costo indirecto* de un accidente (paralización de máquinas, baja de moral, investigación, reemplazos) suele *cuadruplicar el costo directo* asegurado.
]

== 3.3. Dimensiones de la Calidad de Vida en el Trabajo (CVT)
La CVT integra factores *intrínsecos del puesto* (autonomía, variedad, significado de la tarea) y factores *extrínsecos o contextuales* (remuneración justa, seguridad en el empleo, clima socioemocional y relaciones humanas cordiales).

#pagebreak()

// ==========================================
// CAPÍTULO 4: CHIAVENATO - RELACIONES CON LAS PERSONAS
// ==========================================

= 4. Idalberto Chiavenato: Relaciones con las Personas (Cap. 13)

*Obra de Referencia:* _Administración de Recursos Humanos_ (Capítulo 13, McGraw-Hill).

== 4.1. Movimientos Internos de Personal y Disciplina Progresiva
- *Movimientos:* Transferencias (horizontales), ascensos (verticales), separaciones voluntarias, jubilaciones y despidos (*downsizing*, planes de retiro y *outplacement*).
- *Disciplina Progresiva:* Protocolo gradual para corregir faltas antes de llegar al despido:
  1. *Advertencia verbal en privado.*
  2. *Advertencia escrita formal incorporada al legajo.*
  3. *Suspensión temporal de empleo y sueldo.*
  4. *Despido con causa justificada.*

== 4.2. Dinámica del Conflicto Organizacional
- *Condiciones Predisponentes:* Diferenciación de objetivos departamentales, recursos limitados compartidos e interdependencia de actividades.
- *Condiciones Desencadenantes:* Percepción de incompatibilidad de metas y percepción de interferencia deliberada.
- *Formas de Resolución:* Ganar-perder (competencia destructiva), Perder-perder (bloqueo mutuo) y Ganar-ganar (solución integradora).

== 4.3. Las Cuatro Políticas Patronales frente a los Sindicatos

#table(
  columns: (1.2fr, 1.4fr, 1.4fr),
  fill: (col, row) => if row == 0 { rgb("#edf2f7") } else if calc.odd(row) { rgb("#f7fafc") } else { white },
  stroke: 0.5pt + rgb("#cbd5e0"),
  inset: 7pt,
  [*Política de Relaciones*], [*Postura de la Dirección*], [*Efectos en la Organización*],
  [1. Paternalista], [Concede reclamos de forma indiscriminada para evitar fricciones.], [Genera indefensión gerencial, eleva costos y fortalece al gremio por refuerzo positivo.],
  [2. Autocrática], [Postura legalista inflexible; se limita a lo estrictamente obligatorio por ley.], [Provoca clima de hostilidad, desconfianza, huelgas encubiertas y alta rotación.],
  [3. De Reciprocidad], [La alta dirección pacta directamente con la cúpula sindical.], [Margina a los supervisores de base; los problemas de planta quedan sin solución.],
  [4. Participativa], [Diálogo reglado basado en datos objetivos, involucrando a la jefatura de línea.], [Construye corresponsabilidad sindical y consolida la paz laboral de largo plazo.]
)

== 4.4. Medios de Acción Colectiva
- *Acciones Sindicales:* Huelga legal, piquetes informativos y medios atípicos o ilícitos (*huelga de celo/por esmero, tortuguismo o trabajo lento, huelga relámpago y ocupación de fábrica*).
- *Acciones Patronales:* Cierre patronal temporal (*lockout*) y listas negras (práctica discriminatoria proscrita).

#pagebreak()

// ==========================================
// CAPÍTULO 5: JORGE AQUINO Y COLABORADORES
// ==========================================

= 5. Jorge Aquino y cols.: Relaciones Gremiales y Sindicales (Cap. 8)

*Obra de Referencia:* _Recursos Humanos_ (Capítulo 8, Ediciones Macchi).

== 5.1. Rasgos Distintivos de las Relaciones Gremiales
Aquino define las relaciones gremiales como el trato institucional entre representantes de la empresa y del sindicato para resolver quejas y fijar acuerdos. Presentan cinco rasgos singulares:
1. *Trato entre Representantes:* Quienes negocian gestionan problemas de terceros. Poseen una visión global de la empresa, pero corren el riesgo de aislarse de sus bases si no comunican los acuerdos.
2. *Proyección en el Tiempo:* Los compromisos trascienden a las personas que los firmaron; se exige redactar cláusulas claras de vigencia y caducidad.
3. *Relación de Poder:* Tensión estructural entre la búsqueda patronal de flexibilidad operativa y la defensa gremial contra la discrecionalidad.
4. *Acuerdos sin Consenso Pleno:* Se pacta por principio de autoridad ejecutiva o por votación de mayorías sindicales, aun con disconformidad de sectores minoritarios.
5. *Complicaciones Intersindicales:* Disputas entre centrales obreras o entre la comisión interna de planta y la conducción central del gremio.

== 5.2. Las Tres Funciones de la Representación Gremial
1. *Función de Auditoría:* Fiscalizar que la empresa cumpla rigurosamente las leyes, convenios colectivos, reglamentos internos y usos/costumbres.
2. *Función de Comunicación y Voz:* Canalizar inquietudes, reclamos y dudas de los trabajadores ante cambios organizacionales o tecnológicos.
3. *Función de Negociación:* Modificar normas vigentes o acordar nuevas reglamentaciones salariales y laborales.

== 5.3. Dos Políticas desde Recursos Humanos: ¿Dueño o Asesor?

#table(
  columns: (1.2fr, 1.4fr, 1.4fr),
  fill: (col, row) => if row == 0 { rgb("#edf2f7") } else if calc.odd(row) { rgb("#f7fafc") } else { white },
  stroke: 0.5pt + rgb("#cbd5e0"),
  inset: 7pt,
  [*Dimensión*], [*Política de Liderazgo (Autoritaria)*], [*Política Legalista (Participativa)*],
  [Rol de RRHH], [*Dueño del tema:* Negocia directamente y despoja a la línea de su rol de mando.], [*Asesor:* Capacita y respalda a los supervisores para que lideren a sus equipos.],
  [Tipo de Acuerdos], [Trato casuístico ("caso por caso"). No se firman actas para no sentar precedentes.], [Negociaciones regladas y transparentes. Se firman actas formales que sientan jurisprudencia.],
  [Fundamentación], [Subjetiva, personalista, basada en el carisma del negociador.], [Objetiva, fundada en el convenio colectivo, la ley y datos comprobables.],
  [Participación de Línea], [Nula: La supervisión se entera a posteriori.], [Activa: Los jefes de línea participan directamente de las reuniones.]
)

== 5.4. Cooperación Sindicato-Gerencia (Douglas McGregor)
Aquino recupera el modelo de McGregor sobre el *crecimiento psicológico* en tres fases:
1. *Etapa de Lucha:* Desconfianza y hostilidad abierta.
2. *Etapa de Negociación Fructuosa:* Neutralidad armada y acuerdos transaccionales.
3. *Etapa de Cooperación Genuina:* Esfuerzos compartidos para asegurar la viabilidad de la empresa.

#callout(title: "La Regla de Incompatibilidad Simultánea (Clave de Examen)", icon: "🛑")[
  - *Negociación Colectiva:* Es distributiva y competitiva ("repartir la torta"). Se juega con *"las cartas contra el pecho"*.
  - *Cooperación:* Es asociativa y colaborativa ("agrandar la torta": productividad, seguridad). Se juega con *"las cartas sobre la mesa"*.
  - *Regla:* _Un mismo tema no puede ser simultáneamente objeto de negociación colectiva y de cooperación_. Mezclar ambas dinámicas en la misma mesa destruye la confianza indispensable para cooperar.
]

== 5.5. Modelo de Diagnóstico y el Ideal de la Doble Lealtad
El autor propone mapear las relaciones laborales mediante Círculos de Objetivos (Dirección y Sindicato), Rectángulos de Actores y Líneas de Fuerza. 

El modelo ideal persigue la **doble lealtad**: lograr que el trabajador sienta compromiso hacia la empresa y a la vez se sienta legítimamente representado por su gremio, en un marco de objetivos estratégicos compartidos.

#pagebreak()

// ==========================================
// CAPÍTULO 6: SÍNTESIS Y CRITERIOS DE EXAMEN
// ==========================================

= 6. Síntesis Comparativa y Criterios Evaluativos de la Cátedra

== 6.1. Matriz Comparativa Global de la Unidad 3

#table(
  columns: (1fr, 1.2fr, 1.4fr, 1.4fr),
  fill: (col, row) => if row == 0 { rgb("#edf2f7") } else if calc.odd(row) { rgb("#f7fafc") } else { white },
  stroke: 0.5pt + rgb("#cbd5e0"),
  inset: 6.5pt,
  [*Autor*], [*Ámbito de Estudio*], [*Concepto Central*], [*Punto Clave para el Parcial*],
  [Francisco Longo], [Sector Público / Servicio Civil], [Dimensión colectiva del subsistema de relaciones humanas.], [3 Bloques: Clima, Negociación Colectiva y Políticas Sociales.],
  [Idalberto Chiavenato], [Gestión Integral / Empresa], [Prestaciones (Cap. 11), CVT (Cap. 12) y Relaciones (Cap. 13).], [Tipología triple de prestaciones y 4 políticas frente a sindicatos.],
  [Jorge Aquino y cols.], [Relaciones Gremiales / Negociación], [Trato entre representantes y dinámicas de poder.], [3 Funciones gremiales, Rol Dueño vs. Asesor y Regla de McGregor.]
)

== 6.2. Mandamientos Docentes para la Unidad 3

#tip-parcial(title: "Puntos Neurálgicos de Corrección Docente")[
  1. *Prestaciones como Factores Higiénicos:* Enmarcar las prestaciones sociales dentro de la teoría de Herzberg: previenen la insatisfacción y rotación, pero no motivan por sí solas.
  2. *Diferencia entre Condición Insegura y Acto Inseguro:* La condición es la falla material o ambiental del entorno; el acto es la conducta humana imprudente del trabajador.
  3. *Incompatibilidad Simultánea de McGregor:* No confundir cooperación con negociación colectiva; un mismo tema no puede ser objeto de ambas a la vez.
  4. *Rol de RRHH (Dueño vs. Asesor):* Justificar por qué la política legalista y de asesoría a la supervisión es la más sostenible para garantizar la paz laboral.
]

#v(25pt)
#align(center)[
  #text(size: 9pt, style: "italic", fill: rgb("#718096"))[
    Fin del Dossier Académico · Unidad 3: Relaciones Humanas y Sociales \
    Gestión de Recursos Humanos III — Ciclo Lectivo 2025
  ]
]
