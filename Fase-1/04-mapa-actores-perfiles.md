# 04 — Mapa inicial de actores y perfiles

| Campo | Valor |
|---|---|
| Versión | 0.3 |
| Fecha | 2026-10-30 |
| Estado | Revisión del propietario |
| Alumno | Carlos García Rallo |
| Tutor/a | *(en blanco)* |
| Redacción | Claude (roles Analista y UX), a petición del alumno |

> Por decisión del alumno (P-A05), este mapa se ha hecho **solo con información pública y supuestos**. Ningún actor ni perfil ha sido confirmado por la organización. Cada fila indica su base.

Etiquetas: **[O]** observado en web pública · **[D]** dato de la organización o del alumno · **[S]** supuesto · **[R]** recomendación.

## 1. Mapa de actores

Se agrupan según su relación con una posible plataforma central: quién la usaría, quién la mantendría, quién decide y quién se ve afectado.

```
                        ┌───────────────────────────────┐
                        │  DECIDEN                      │
                        │  Dirección de Grupo ATU [S]   │
                        │  Tutor/a del proyecto [D]     │
                        └──────────────┬────────────────┘
                                       │ aprueban alcance y recursos
┌──────────────────────────┐   ┌───────▼───────────────────┐   ┌──────────────────────────┐
│  USAN                    │   │  PLATAFORMA CENTRAL        │   │  MANTIENEN               │
│  Alumnado [S]            │──▶│  (por definir, no existe)  │◀──│  Gestor/a del catálogo   │
│  Profesorado/tutores [S] │   │                            │   │  (perfil nuevo) [S]      │
│  Empresas clientes [S]   │   └───────┬────────────────────┘   │  Administradores Moodle  │
└──────────────────────────┘           │ redirige                │  de cada campus [S]      │
                                       ▼                         └──────────────────────────┘
                        ┌───────────────────────────────┐
                        │  12 CAMPUS MOODLE [O]         │
                        │  + CAU / tutoría virtual [O]  │──▶ Afectados: soporte, marcas
                        └───────────────────────────────┘    asociadas, SEPE/financiadores [S]
```

## 2. Tabla de actores

| ID | Actor | Rol respecto al proyecto | Interés principal | Influencia | Base |
|---|---|---|---|---|---|
| A-01 | Alumnado de los campus | Usuario final | Llegar a su curso rápido y sin confusión | Baja (individual), alta (colectiva) | **[S]** Los campus son de formación; no conocemos volumen ni perfil |
| A-02 | Profesorado, tutores y tutoras | Usuario final; posible orientador del alumnado | Que el alumnado llegue al campus correcto; posible trabajo en varios campus | Media | **[S]** La existencia de una «tutoría virtual» sugiere tutores **[O]** |
| A-03 | Empresas clientes o personas de contacto en empresas | Posible usuario o prescriptor | Que sus trabajadores accedan a la formación contratada | Media | **[S]** Grupo ATU se describe como «consultora de formación» **[O]**; los logos de SEPE sugieren formación para el empleo **[S]** |
| A-04 | Centro de atención al usuario (CAU) / tutoría virtual | Soporte | Menos consultas repetitivas; un punto de información claro | Media | **[O]** Correo y teléfono comunes en los 11 campus observados |
| A-05 | Administradores técnicos de cada campus | Mantienen los campus; serían necesarios para cualquier integración | No añadir carga ni riesgo a sus plataformas | Alta en lo técnico | **[S]** No sabemos si es una persona, un equipo o un proveedor externo (P-O02) |
| A-06 | Gestor/a del catálogo de la plataforma | Perfil nuevo: alta, baja y revisión de campus en la plataforma | Herramienta sencilla y que no se desactualice | Media | **[R]** Lo crea el propio proyecto; hay que confirmar quién lo asumiría (P-O04) |
| A-07 | Dirección o responsable de negocio de Grupo ATU | Patrocinador y decisor | Imagen de marca, coste, eficiencia del soporte | Muy alta | **[S]** (P-O03) |
| A-08 | Marcas asociadas (Centre Learning, Takin, Club Aventura, Grupo Almería Formación, Tierra Más Ecológica, MoveOut, Estudi@, Index Business Intelligent) | Afectados | Mantener su identidad o, al contrario, no aparecer junto a otras | Media | **[O]** Logotipos propios, verificados con capturas; Tierra Más Ecológica se presenta como sociedad cooperativa. Relación con ATU desconocida (P-V06, P-O05) |
| A-09 | Responsable del tratamiento de datos (Academia Técnica Universitaria, S.L.) y su delegado/a de protección de datos | Cumplimiento | Que la plataforma no trate datos sin base legal | Alta en lo legal | **[O]** Nombrado en los avisos de los campus; delegado/a sin confirmar (P-L01) |
| A-10 | Entidades financiadoras (SEPE, fondos europeos) | Afectados indirectos | Posibles requisitos de publicidad, accesibilidad o trazabilidad | Baja / desconocida | **[O]** Logotipos en los campus. Requisitos concretos sin investigar **[S]** |
| A-11 | Tutor/a del proyecto | Revisa y valida cada hito | Rigor, evidencias, cumplimiento de la ficha | Muy alta en el proyecto | **[D]** Ficha 01 |
| A-12 | Alumno del proyecto (Carlos García Rallo) | Autor y responsable del expediente | Proyecto viable y bien documentado | — | **[D]** |

## 3. Matriz de influencia e interés

| | Interés bajo | Interés alto |
|---|---|---|
| **Influencia alta** | A-05 Administradores (mantener satisfechos: no imponerles trabajo) · A-09 Protección de datos | A-07 Dirección · A-11 Tutor/a (gestionar de cerca) |
| **Influencia baja / media** | A-10 Financiadores (vigilar) | A-01 Alumnado · A-02 Profesorado · A-03 Empresas · A-04 CAU · A-06 Gestor/a del catálogo · A-08 Marcas (mantener informados y consultar) |

Esta clasificación es un supuesto de trabajo **[S]** para planificar a quién consultar primero cuando haya contacto con la organización.

## 4. Perfiles de usuario (hipótesis)

Los perfiles describen necesidades, no personas reales. Ninguno se ha validado con usuarios (P-U01).

### PU-01. Alumno/a de un solo campus

- **Situación:** está matriculado en un curso de una sola marca. Recibe sus credenciales por correo o de su empresa **[S]**.
- **Tarea:** encontrar la dirección de su campus y entrar.
- **Dificultad probable:** no recuerda la URL; busca en Google y no la encuentra porque las páginas tienen `noindex` **[O]**; entra en un campus con el mismo título que otro y no está seguro de si es el suyo (H-01) **[O]**.
- **Qué necesitaría:** buscar por el nombre de la marca, empresa o curso que conoce, y una señal clara de que ha llegado al sitio correcto.

### PU-02. Alumno/a de varios campus

- **Situación:** hace cursos de marcas distintas (por ejemplo, prevención y formación técnica) **[S]**.
- **Tarea:** saber en qué campus está cada curso.
- **Dificultad probable:** cuentas y contraseñas distintas en cada campus (H-06) **[S]**.
- **Qué necesitaría:** ver todos sus campus en un sitio. Si se quisiera mostrar «sus» campus de forma personalizada, haría falta identificarle, y no hay identidad común conocida (S-05).

### PU-03. Profesor/a o tutor/a

- **Situación:** puede impartir o tutorizar en varios campus **[S]**.
- **Tarea:** acceder a sus campus e indicar al alumnado a dónde ir.
- **Qué necesitaría:** un enlace único y estable que compartir con el alumnado.

### PU-04. Persona de contacto de una empresa cliente

- **Situación:** su empresa contrata formación y ella informa a la plantilla **[S]**.
- **Tarea:** dar a los trabajadores el enlace correcto.
- **Qué necesitaría:** un catálogo que diga qué campus corresponde a qué tipo de formación o marca.

### PU-05. Agente del CAU / tutoría virtual

- **Situación:** atiende el teléfono y el correo comunes de los campus **[O]**.
- **Tarea:** resolver «no sé cuál es mi campus» o «no puedo entrar».
- **Qué necesitaría:** una lista actualizada de campus, con su estado y a quién escalar cada uno.

### PU-06. Gestor/a del catálogo

- **Situación:** perfil nuevo **[R]**.
- **Tarea:** dar de alta, modificar, retirar y revisar campus en la plataforma.
- **Qué necesitaría:** un procedimiento sencillo, registro de cambios y aviso cuando un enlace deje de funcionar.

### PU-07. Administrador/a de un campus Moodle

- **Situación:** mantiene uno o varios campus **[S]**.
- **Tarea respecto al proyecto:** informar de cambios (alta, cambio de URL, mantenimiento, baja).
- **Qué necesitaría:** que la plataforma central no le exija tocar su Moodle en la primera versión.

## 5. Control de versiones

| Versión | Fecha | Autor | Cambios |
|---|---|---|---|
| 0.1 | 2026-10-30 | Claude (Analista / UX) | Primera versión: 12 actores, matriz de influencia e interés y 7 perfiles hipotéticos. [Archivada](historico/04-mapa-actores-perfiles_v0.1.md) |
| 0.2 | 2026-10-30 | Claude (Analista) | «Index» retirado de la lista de marcas (ver inventario v0.3). [Archivada](historico/04-mapa-actores-perfiles_v0.2.md) |
| 0.3 | 2026-10-30 | Claude (Analista) | Marcas verificadas: «Estudi@», «Grupo Almería Formación» e «Index Business Intelligent» |
