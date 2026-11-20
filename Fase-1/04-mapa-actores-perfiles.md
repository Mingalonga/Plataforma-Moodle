# 04 — Mapa inicial de actores y perfiles

| Campo | Valor |
|---|---|
| Versión | 0.4 |
| Fecha | 2026-11-04 |
| Estado | Revisión del propietario |
| Alumno | Carlos García Rallo |
| Tutor/a | *(en blanco)* |
| Redacción | Claude (roles Analista y UX), a petición del alumno |

> **Cambio de enfoque (v0.4, 2026-11-04).** La tutora indica que la plataforma se orienta a la **gestión interna** de las aulas, para que el personal no tenga que entrar y salir de cada una. El alumnado ya entra en su curso con una URL que se le facilita. El entorno lo gestionaría el **Departamento de Pedagogía y e-learning** y la implementación la haría **Informática** (ver el [registro de preguntas](01-registro-preguntas-supuestos.md), v0.9). Este mapa se reorganiza en consecuencia: los usuarios principales pasan a ser el personal de gestión, y el alumnado, el profesorado y las empresas pasan a ser afectados indirectos.
>
> Por decisión del alumno (P-A05), el resto del mapa sigue basado en **información pública y supuestos**. Cada fila indica su base.

Etiquetas: **[O]** observado en web pública · **[D]** dato de la organización, de la tutora o del alumno · **[S]** supuesto · **[R]** recomendación.

## 1. Mapa de actores

```
                        ┌──────────────────────────────────────┐
                        │  DECIDEN                             │
                        │  Quien decida la viabilidad (P-G05)  │
                        │  Tutora del proyecto [D]             │
                        └──────────────────┬───────────────────┘
                                           │ estudio de viabilidad primero
┌──────────────────────────────┐   ┌───────▼────────────────────┐   ┌──────────────────────────┐
│  USAN (gestión interna)      │   │  PLATAFORMA DE GESTIÓN     │   │  IMPLEMENTAN Y MANTIENEN │
│  Dpto. de Pedagogía y        │──▶│  CENTRALIZADA              │◀──│  Informática [D]         │
│  e-learning [D]              │   │  (por definir, no existe)  │   │  (parte técnica, accesos,│
│  CAU / tutoría virtual [S]   │   └───────┬────────────────────┘   │   servicios web)         │
└──────────────────────────────┘           │ acceso y gestión        └──────────────────────────┘
                                           ▼
                        ┌──────────────────────────────────────┐
                        │  12 AULAS MOODLE [O]                 │──▶ Afectados indirectos:
                        │  (el alumnado entra por URL) [D]     │    alumnado, profesorado,
                        └──────────────────────────────────────┘    empresas, protección de datos
```

## 2. Tabla de actores

| ID | Actor | Rol respecto al proyecto | Interés principal | Influencia | Base |
|---|---|---|---|---|---|
| A-13 | **Departamento de Pedagogía y e-learning (DPE)** | **Usuario principal**: gestiona el entorno de las aulas | Gestionar las doce aulas desde un único sitio, sin entrar y salir de cada una | Alta | **[D]** Respuesta de la tutora (2026-11-04). Nuevo en v0.4 |
| A-14 | **Informática** | **Implementa** el proyecto y se encarga de la parte técnica | Una solución segura, que no añada riesgo a las aulas y que se pueda mantener | Alta en lo técnico | **[D]** Respuesta de la tutora (2026-11-04). Nuevo en v0.4. Probablemente coincide con A-05 (P-G06) |
| A-05 | Administradores técnicos de cada campus | Mantienen los campus; necesarios para cualquier integración | No añadir carga ni riesgo a sus plataformas | Alta en lo técnico | **[S]** v0.4: probablemente forman parte de Informática (A-14) o del DPE (A-13) (P-G03, P-G06) |
| A-04 | Centro de atención al usuario (CAU) / tutoría virtual | Posible usuario secundario (consulta) | Saber rápido en qué aula y curso está cada persona y a quién escalar | Media | **[O]** Correo y teléfono comunes. v0.4: relación con el DPE sin confirmar **[S]** |
| A-07 | Dirección o responsable de negocio de Grupo ATU | Patrocinador; posible decisor de la viabilidad | Eficiencia de la gestión, coste y seguridad | Muy alta | **[S]** (P-O03, P-G05) |
| A-09 | Responsable del tratamiento de datos (Academia Técnica Universitaria, S.L.) y su delegado/a de protección de datos | Cumplimiento | Que la plataforma no trate datos del alumnado sin necesidad ni base legal | Alta en lo legal | **[O]** Nombrado en los avisos de los campus. v0.4: **sube de importancia**, porque la gestión de las aulas sí maneja datos personales (matrículas, usuarios) |
| A-11 | Tutor/a del proyecto | Revisa y valida cada hito; ha fijado el enfoque | Rigor, evidencias, cumplimiento de la ficha | Muy alta en el proyecto | **[D]** Ficha 01 y respuesta del 2026-11-04 |
| A-12 | Alumno del proyecto (Carlos García Rallo) | Autor y responsable del expediente | Proyecto viable y bien documentado | — | **[D]** |
| A-01 | Alumnado de los campus | **Afectado indirecto** (v0.4): no usa la plataforma; entra en su curso con la URL que se le facilita | Que su curso funcione y que sus datos estén protegidos | Baja | **[D]** Respuesta de la tutora |
| A-02 | Profesorado, tutores y tutoras | Afectado indirecto; podría ser usuario si su rol incluye gestión (P-G01) | Que la gestión de sus cursos sea ágil | Media | **[S]** |
| A-03 | Empresas clientes | Afectado indirecto | Que sus trabajadores reciban bien el acceso | Baja | **[S]** |
| A-06 | Gestor/a del catálogo de la plataforma | v0.4: **integrado en el DPE** (A-13), que mantendría la información de las aulas en la plataforma | — | — | **[D]** |
| A-08 | Marcas asociadas (Centre Learning, Takin, Club Aventura, Grupo Almería Formación, Tierra Más Ecológica, MoveOut, Estudi@, Index Business Intelligent) | Afectados | v0.4: con una herramienta interna, el problema de mostrar marcas juntas al público desaparece | Baja | **[O]** Logotipos propios. Relación con ATU desconocida (P-V06) |
| A-10 | Entidades financiadoras (SEPE, fondos europeos) | Afectados indirectos | Posibles requisitos de trazabilidad de la formación, que la gestión debe respetar | Baja / desconocida | **[O]** Logotipos en los campus. Requisitos concretos sin investigar **[S]** |

## 3. Matriz de influencia e interés

| | Interés bajo | Interés alto |
|---|---|---|
| **Influencia alta** | A-09 Protección de datos (mantener satisfecho: minimizar datos) | A-13 DPE · A-14 Informática · A-07 Dirección · A-11 Tutora (gestionar de cerca) |
| **Influencia baja / media** | A-01 Alumnado · A-03 Empresas · A-08 Marcas · A-10 Financiadores (vigilar) | A-04 CAU · A-02 Profesorado (mantener informados y consultar) |

Esta clasificación sigue siendo un supuesto de trabajo **[S]**. v0.4: el DPE e Informática pasan al cuadrante principal porque son quienes usarán y construirán la plataforma.

## 4. Perfiles de usuario (hipótesis)

Los perfiles describen necesidades, no personas reales. Ninguno se ha validado con usuarios (P-U01, P-G01).

### 4.1 Perfiles principales (v0.4)

#### PU-08. Gestor/a de e-learning (Departamento de Pedagogía y e-learning)

- **Situación:** gestiona cursos, matrículas y usuarios en varias de las doce aulas **[S]** (P-G01). Probablemente tiene una cuenta distinta en cada aula (S-11).
- **Tarea:** hacer su trabajo de gestión en cualquier aula sin tener que buscar su dirección, iniciar sesión en ella y volver a salir para pasar a la siguiente.
- **Dificultad probable:** doce direcciones, doce inicios de sesión y doce menús de administración; aulas con el mismo título (H-01) que se pueden confundir **[O]**; no hay una vista de conjunto de lo que pasa en todas **[S]**.
- **Qué necesitaría:** un punto único con todas las aulas y accesos directos a sus áreas de gestión y, si es viable, consultar información de varias aulas a la vez.

#### PU-09. Técnico/a de Informática

- **Situación:** implementaría la plataforma y se ocuparía de la parte técnica de las aulas **[D]** (alcance concreto en P-G06).
- **Tarea:** instalar y mantener la plataforma, gestionar permisos y, si se integra con Moodle, configurar los servicios web y custodiar las claves de acceso.
- **Qué necesitaría:** una solución segura, que no exija modificar las aulas en producción, con una guía de operación clara y un inventario técnico de las aulas (versión, alojamiento, estado).

#### PU-10. Responsable del DPE

- **Situación:** coordina al equipo de gestión **[S]**.
- **Tarea:** conocer de un vistazo el estado de las aulas y repartir el trabajo.
- **Qué necesitaría:** una vista de conjunto y, si se aprueba, indicadores agregados de las aulas.

### 4.2 Perfil secundario

#### PU-05. Agente del CAU / tutoría virtual

- **Situación:** atiende el teléfono y el correo comunes de los campus **[O]**.
- **Tarea:** ante una consulta, saber en qué aula está el curso de una persona y a quién escalar.
- **Qué necesitaría:** consulta del inventario de aulas y su estado. Si llegara a consultar datos de personas concretas, se trataría de un tratamiento de datos personales que habría que justificar (RS-03).

### 4.3 Perfiles fuera del enfoque (v0.4)

Se conservan para no perder la trazabilidad con la v0.3, pero **dejan de ser usuarios de la plataforma**:

| Perfil | Motivo |
|---|---|
| PU-01 Alumno/a de un solo campus | Entra en su curso con la URL que se le facilita **[D]** |
| PU-02 Alumno/a de varios campus | Ídem |
| PU-03 Profesor/a o tutor/a | Ídem como usuario; si tiene funciones de gestión, se trata como PU-08 |
| PU-04 Contacto de una empresa cliente | Recibe la URL del curso contratado |
| PU-06 Gestor/a del catálogo | Integrado en PU-08 (el DPE mantiene la información de las aulas) |
| PU-07 Administrador/a de un campus | Integrado en PU-08 o PU-09, según el reparto entre el DPE e Informática (P-G06) |

## 5. Control de versiones

| Versión | Fecha | Autor | Cambios |
|---|---|---|---|
| 0.1 | 2026-10-30 | Claude (Analista / UX) | Primera versión: 12 actores, matriz de influencia e interés y 7 perfiles hipotéticos. [Archivada](historico/04-mapa-actores-perfiles_v0.1.md) |
| 0.2 | 2026-10-30 | Claude (Analista) | «Index» retirado de la lista de marcas (ver inventario v0.3). [Archivada](historico/04-mapa-actores-perfiles_v0.2.md) |
| 0.3 | 2026-10-30 | Claude (Analista) | Marcas verificadas: «Estudi@», «Grupo Almería Formación» e «Index Business Intelligent». [Archivada](historico/04-mapa-actores-perfiles_v0.3.md) |
| 0.4 | 2026-11-04 | Claude (Analista / UX) | Enfoque de gestión interna (respuesta de la tutora): nuevos actores A-13 (DPE) y A-14 (Informática); alumnado, profesorado y empresas pasan a afectados indirectos; nuevos perfiles PU-08 a PU-10; PU-01 a PU-04, PU-06 y PU-07 fuera del enfoque |
