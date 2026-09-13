# 📘 Idalberto Chiavenato — Sistemas de Información y Control de RRHH

* **Texto de Referencia**: *Administración de Recursos Humanos: El capital humano de las organizaciones* (Capítulo 16: "Sistema de información de recursos humanos y auditoría de recursos humanos", McGraw-Hill).
* **Unidad**: Unidad 2 — Auditoría y Control de Recursos Humanos.
* **Cátedra**: Gestión de Recursos Humanos III.

---

## 🧭 1. Datos vs. Información: La Cadena de Procesamiento

Idalberto Chiavenato establece la distinción clásica entre dato e información que adopta la cátedra:

```mermaid
flowchart LR
    D["DATO<br>(Registro primario no calificado)"] --> P["PROCESAMIENTO<br>(Clasificación, cálculo, ordenamiento)"]
    P --> I["INFORMACIÓN<br>(Significado, intención y valor de decisión)"]
    I --> TD["TOMA DE DECISIONES<br>(Reducción de incertidumbre)"]
```

* **Dato**: Es un elemento primario, un evento, un valor nominal o un registro objetivo de un hecho que por sí solo **carece de significado amplio, contexto o cualidad**. Un dato aislado (ej. "8 agentes", una fichada horaria de las 08:02) no permite adoptar decisiones estratégicas ni explica la realidad.
* **Información**: Es el resultado de reunir, clasificar, ordenar, tabular y contextualizar los datos, otorgándoles **significado, intencionalidad y sentido para el receptor**. La información es el insumo indispensable para resolver problemas y definir cursos de acción.

---

## 🗄️ 2. El Banco de Datos de Recursos Humanos

El **Banco de Datos** es un sistema automatizado de almacenamiento y acumulación de registros codificados y enlazados lógicamente, diseñado para evitar la duplicación de archivos, erradicar redundancias y permitir el acceso simultáneo a distintas áreas:

### Los Seis Registros Fundamentales
1. **Registro de Personal (Inventario de Habilidades)**: Datos biográficos, domicilio, educación, formación profesional, historial y competencias de cada empleado.
2. **Registro de Puestos**: Tareas, requisitos, perfiles de competencias y ocupantes de cada cargo de la estructura.
3. **Registro de Secciones / Departamentos**: Distribución de dotación por gerencias, unidades operativas y centros de costo.
4. **Registro de Remuneraciones**: Salarios básicos, adicionales, horas extras, comisiones e historial de aumentos.
5. **Registro de Prestaciones Sociales**: Beneficios adicionales, planes de cobertura médica, seguros y ayudas asistenciales.
6. **Registros Especiales**: Candidatos en proceso de selección, programas de capacitación en curso y legajos disciplinarios.

---

## 🖥️ 3. El Sistema de Información de RRHH (SIRH)

Chiavenato define el SIRH como una red organizada de procedimientos e interfaces computarizadas que alimenta de información precisa a la organización.

### Flujo Operativo del Sistema (Input - Proceso - Output)
* **Entradas (Inputs)**: Fichadas biométricas, formularios de ausentismo, reportes de accidentes, legajos, evaluaciones del desempeño y exámenes médicos.
* **Procesamiento**: Validación algorítmica, almacenamiento en bases relacionales, cálculo salarial y consolidación estadística.
* **Salidas (Outputs)**: Liquidación de nómina neta, reportes de rotación (*turnover*), curvas de ausentismo, índices de productividad, estados de licencias e informes legales para organismos de fiscalización.

```mermaid
graph LR
    IN["INPUTS<br>(Fichadas, Evaluaciones, Legajos)"] --> PROC["PROCESAMIENTO<br>(Bases de Datos relacionales y cálculo)"]
    PROC --> OUT["OUTPUTS<br>(Nómina, Índices de Ausentismo y Rotación)"]
```

### Responsabilidad de Línea y Función de Staff
* **Responsabilidad de Línea**: Cada gerente de departamento es el responsable directo de liderar, evaluar, sancionar y supervisar a su propio equipo de trabajo.
* **Función de Staff (Asesoría de RRHH)**: El área de Recursos Humanos no "manda" sobre los empleados de otras áreas; actúa como una unidad de consultoría interna que diseña las políticas, administra el SIRH y provee la información estratégica a los jefes de línea.

---

## ⏰ 4. Aplicaciones Especiales: Jornada y Disciplina Progresiva

### Modalidades Flexibles de Jornada
Chiavenato destaca que el SIRH moderno no busca únicamente registrar llegadas tarde, sino gestionar nuevos esquemas laborales:
* *Semana laboral comprimida* (ej. 4 días de 10 horas).
* *Horario flexible (flextime)*: Bandas horarias fijas con márgenes de entrada y salida móviles.
* *Teletrabajo y trabajo híbrido*.
* *Banco de horas compensatorias*.

### De la Disciplina Coercitiva al Autocontrol: La Disciplina Progresiva
El autor postula que el modelo tradicional de castigo genera resentimiento y ausentismo. En su lugar, promueve el **autocontrol** y, ante reiteraciones, el procedimiento de **disciplina progresiva**:

```
[ 1. Advertencia Verbal en Privado ]
                 ↓
[ 2. Advertencia Escrita Formal al Legajo ]
                 ↓
[ 3. Suspensión Temporal de Empleo y Sueldo ]
                 ↓
[ 4. Despido con Causa Justificada ]
```

---

## 🔄 5. Las Cuatro Etapas del Proceso de Control de RRHH

Chiavenato estructura el control administrativo en un ciclo continuo de cuatro pasos:

1. **Establecimiento de Estándares Deseados**: Normas prefijadas de cantidad (volumen de trabajo), calidad (cero defectos), tiempo (plazos de entrega) y costo (presupuesto asignado).
2. **Monitoreo del Desempeño Real**: Observación y registro sistemático de las actividades ejecutadas mediante el SIRH.
3. **Comparación del Desempeño con los Estándares**: Medición de variaciones admitiendo márgenes de tolerancia razonables.
4. **Acción Correctiva**: Intervención focalizada exclusivamente sobre los desvíos excepcionales para restaurar el equilibrio.
