# 05 — Situación actual, necesidades y problemas

| Campo | Valor |
|---|---|
| Versión | 0.3 |
| Fecha | 2026-11-04 |
| Estado | Revisión del propietario |
| Alumno | Carlos García Rallo |
| Tutor/a | *(en blanco)* |
| Redacción | Claude (rol Analista), a petición del alumno |

Etiquetas: **[O]** observado · **[D]** dato de la organización, de la tutora o del alumno · **[S]** supuesto · **[R]** recomendación.

> **Cambio de enfoque (v0.3, 2026-11-04).** Según la tutora, el problema que interesa es la **gestión interna**: el personal tiene que entrar y salir de cada aula para gestionarla. El alumnado ya entra en su curso con la URL que se le facilita. Por eso se añaden las necesidades N-11 a N-15 y el problema PR-09, y se indica qué necesidades y problemas anteriores pierden relevancia. No se borra nada, para mantener la trazabilidad.

## 1. Situación actual (lo que se puede describir hoy)

1. Hay al menos doce entornos Moodle en doce direcciones distintas, repartidas en once dominios diferentes (dos son subdominios de grupoatu.com) **[D]**.
2. Los once observados se presentan como servicio de Grupo ATU: mismo soporte, mismo bloque corporativo y mismo responsable del tratamiento **[O]**.
3. Cada campus tiene su propia página de acceso con usuario y contraseña. No se ve ningún acceso común **[O]**.
4. No se ha encontrado ninguna página pública que liste todos los campus. Los campus enlazan a la web corporativa (grupoatu.com), pero no a los otros campus **[O]**. **La web corporativa (www.grupoatu.com) tampoco enlaza a ningún campus [O].** El alumno la revisó en su navegador ([E-02 a E-05](evidencias/)): ni el menú superior (Formación gratuita, Formación por CCAA, Oposiciones, Extranjería, Empresas, Conoce Grupo ATU, Formación trabajadores, Infórmate) ni el pie de página (los mismos apartados más «Agencia de colocación» y los enlaces legales) tienen «Aula virtual», «Campus» ni «Acceso alumnos». La web está orientada a captar alumnado (formularios «Infórmate»), no a dar acceso al que ya está matriculado **[S]**.
5. Las páginas de acceso piden a los buscadores que no las indexen (`noindex`) **[O]**. Un usuario que busque «aula virtual + marca» probablemente no llegue a su campus desde un buscador **[S]**.
6. Cinco campus con marcas distintas comparten el mismo título; uno está en inglés y con textos de plantilla sin completar **[O]** (inventario, H-01 y H-02).
7. Hay indicios de que los campus usan una versión de Moodle sin soporte de seguridad **[S]** (inventario, H-04).
8. La ayuda se centraliza en un CAU común y en documentos de SharePoint **[O]**.
9. **El alumnado accede a su curso con una URL que se le facilita [D]** (tutora, 2026-11-04). No necesita buscar su aula.
10. **La gestión de las aulas la hace el Departamento de Pedagogía y e-learning, que hoy tiene que entrar y salir de cada aula [D]** (tutora, 2026-11-04). Con doce aulas en doce direcciones y sin acceso común (H-06), es razonable pensar que cada gestión exige buscar la dirección, iniciar sesión y navegar por un menú de administración distinto **[S]**.

## 2. Necesidades detectadas

Cada necesidad lleva un identificador que se reutilizará en la Fase 2 para la trazabilidad (necesidad → requisito → prueba).

| ID | Necesidad | Quién la tiene | Base | Confianza |
|---|---|---|---|---|
| N-01 | Saber qué campus le corresponde | Alumnado, empresas clientes (PU-01, PU-04) | Ficha 01 **[D]** | Alta (es el encargo) |
| N-02 | Llegar a la página de acceso correcta sin recordar la URL | Alumnado, profesorado (PU-01, PU-03) | Doce dominios distintos y `noindex` **[O]** | Media |
| N-03 | Distinguir un campus de otro con seguridad | Todos los usuarios | Títulos repetidos (H-01) **[O]** | Media |
| N-04 | Ver juntos todos los campus en los que participa | Alumnado y profesorado de varios campus (PU-02, PU-03) | Supuesto **[S]**; depende de P-U05 | Baja |
| N-05 | Tener una lista fiable y actualizada de campus para orientar a usuarios | CAU (PU-05) | Soporte común **[O]**; necesidad supuesta **[S]** | Media |
| N-06 | Mantener la lista de campus con poco esfuerzo y sin que se desactualice | Gestor/a del catálogo, administradores (PU-06, PU-07) | Ficha 01, ámbito «Administración» **[D]** | Alta |
| N-07 | No exponer información innecesaria ni datos personales | Responsable del tratamiento, usuarios | Ficha 01, ámbito «Usuarios y acceso» **[D]** | Alta |
| N-08 | Acceder desde el móvil y con distintas capacidades | Todos los usuarios | Ficha 01, ámbito «Experiencia de uso» **[D]** | Alta |
| N-09 | Respetar la identidad de cada marca, o decidir conscientemente no hacerlo | Marcas asociadas, dirección (A-07, A-08) | Logotipos distintos **[O]**; preferencia desconocida (P-O05, P-O06) | Media |
| N-10 | Que el servicio siga funcionando y se pueda recuperar si falla | Organización | Ficha 01, ámbito «Continuidad» **[D]** | Alta |
| **N-11** | **Acceder desde un único punto a la gestión de cualquier aula, sin buscar direcciones ni entrar y salir de cada una** | DPE (PU-08) | Respuesta de la tutora **[D]** | **Alta** (v0.3) |
| **N-12** | **Ver de un vistazo el conjunto de aulas: cuáles hay, su estado, su responsable y sus datos técnicos básicos** | DPE, Informática, CAU (PU-08, PU-09, PU-10, PU-05) | Doce aulas heterogéneas (H-01 a H-08) **[O]**; necesidad supuesta **[S]** | Media (v0.3) |
| **N-13** | **Consultar información de gestión de varias aulas sin entrar en cada una (cursos, matrículas, actividad)** | DPE (PU-08, PU-10) | Deducida de «no andar saliendo y entrando» **[S]**; alcance por confirmar (P-G04) | Media (v0.3) |
| **N-14** | **Que solo el personal autorizado acceda, con permisos claros y sin multiplicar contraseñas ni claves** | DPE, Informática, protección de datos | Ficha 01, ámbito «Usuarios y acceso» **[D]**; herramienta interna con acceso a la gestión **[D]** | **Alta** (v0.3) |
| **N-15** | **Repartir con claridad qué hace el DPE (gestión) y qué hace Informática (implementación y parte técnica)** | DPE, Informática | Respuesta de la tutora **[D]** | Alta (v0.3) |

**Relevancia de las necesidades anteriores tras el cambio de enfoque (v0.3):**

| Necesidad | Relevancia | Motivo |
|---|---|---|
| N-01, N-02 | **Fuera del enfoque** | El alumnado ya recibe la URL de su curso **[D]** |
| N-03 | Se mantiene, aplicada al personal | Quien gestiona varias aulas con el mismo título también puede confundirlas (H-01) |
| N-04 | **Fuera del enfoque** para el alumnado. Para el personal la cubre N-11 | — |
| N-05 | Se mantiene (secundaria) | El CAU puede consultar el inventario de aulas |
| N-06 | Se mantiene | La información de las aulas en la plataforma debe mantenerse; la mantendría el DPE |
| N-07 | Se mantiene y **sube de importancia** | La gestión de las aulas maneja datos personales del alumnado |
| N-08 | Se mantiene | Accesibilidad: lo exige la ficha para cualquier usuario, también el personal interno. El uso desde móvil pierde peso **[S]** |
| N-09 | **Pierde relevancia** | La herramienta es interna; no hay exposición pública de las marcas |
| N-10 | Se mantiene | Continuidad: si la plataforma falla, el personal debe poder gestionar las aulas directamente |

## 3. Problemas detectados

| ID | Problema | Evidencia | Necesidad afectada | Estado |
|---|---|---|---|---|
| PR-01 | No hay un punto público que reúna todos los campus, ni siquiera en la web corporativa | Ni los campus ni la web corporativa enlazan a los demás campus **[O]** (E-02 a E-05) | N-01, N-02, N-05 | **Observado** (v0.2) |
| PR-02 | Los campus no son localizables desde buscadores | `robots: noindex` en todas las páginas observadas **[O]** | N-02 | Observado. Puede ser intencionado (P-V08) |
| PR-03 | Cinco campus no se distinguen por el título | H-01 **[O]** | N-03 | Observado |
| PR-04 | Configuración incoherente entre campus (idioma, plantilla, ayuda) | H-02, H-03 **[O]** | N-03, N-08 | Observado |
| PR-05 | Cuentas separadas por campus | H-06 **[O]** + supuesto sobre usuarios de varios campus **[S]** | N-04 | Indicio |
| PR-06 | Posible versión de Moodle sin soporte de seguridad | H-04 **[S]** | N-07, N-10 | Indicio. Fuera del alcance del proyecto resolverlo; sí condiciona integraciones |
| PR-08 | La clasificación pública de la oferta (9 áreas formativas) no coincide con la organización de los campus por marcas | Las áreas de la web (E-04) son temáticas; los campus llevan nombres de marca **[O]**. Un usuario que conoce su área no puede deducir su campus **[S]** | N-01, N-03 | Indicio |
| PR-07 | No sabemos cuántos usuarios sufren realmente el problema de localización | Sin datos de soporte ni de uso | Todas | Laguna de información (P-U04). **v0.3: reorientado**: ahora lo que falta es medir cuánto tiempo y esfuerzo cuesta hoy la gestión dispersa (P-G02) |
| **PR-09** | **La gestión de las aulas está dispersa: el personal tiene que entrar y salir de cada aula, con su dirección, su inicio de sesión y su menú** | Respuesta de la tutora **[D]**; doce direcciones sin acceso común (H-06) **[O]** | N-11, N-12, N-13 | **Indicado por la tutora** (v0.3). Su tamaño no está medido (PR-07) |
| **PR-10** | **Posible versión de Moodle sin soporte en todas las aulas, que limita y encarece cualquier integración para gestionar desde un único sitio** | H-04 **[S]** (amplía PR-06) | N-13, N-14 | Indicio. Sube de importancia con el nuevo enfoque |

**Relevancia de los problemas anteriores (v0.3):** PR-01 se mantiene, aplicado al personal (no hay un punto común de gestión). PR-02 (no indexación) y PR-08 (áreas de la web) **pierden relevancia**, porque afectaban a la búsqueda por parte del alumnado. PR-03 y PR-04 se mantienen: confunden también a quien gestiona. PR-05 (cuentas separadas) **sube de importancia**, porque es una de las causas de PR-09 si cada gestor tiene una cuenta por aula (S-11).

> v0.3: con el nuevo enfoque, la laguna se traslada a la gestión: hay que conocer qué tareas hace el DPE y cuánto le cuestan (P-G01, P-G02). El párrafo siguiente se mantiene como estaba en la v0.2.
>
> PR-07 es el problema más importante para el proyecto: **sin datos del CAU o de los usuarios no se puede demostrar que el problema principal existe ni medir su tamaño.** El diagnóstico debe decirlo así y no darlo por supuesto.

## 4. Lo que no es un problema del proyecto

Para no confundir el problema con una solución (ficha, comprobación final):

- Que cada campus tenga su propio Moodle no es en sí un problema: puede ser una decisión correcta de negocio.
- La falta de inicio de sesión único es una **posible** necesidad (N-04), no un problema confirmado.
- Actualizar Moodle en los campus queda fuera del encargo; el proyecto solo lo registra como riesgo y condicionante.

## 5. Guion de entrevista (preparado para cuando haya contacto)

> **v0.3:** con el nuevo enfoque, el guion útil es el de la versión 2 de [`entregas/guion-reunion-grupo-atu.txt`](entregas/guion-reunion-grupo-atu.txt), dirigido al Departamento de Pedagogía y e-learning y a Informática. Las secciones 5.3 (CAU) y 5.4 (alumnado y profesorado) pierden relevancia y se conservan solo como referencia.

Por decisión del alumno no se harán entrevistas ahora (P-A05). El guion queda listo para el tutor o para una fase posterior. Duración orientativa: 20–30 minutos. No se graban datos personales; se anota solo el perfil.

### 5.1 Responsable de negocio o dirección

1. ¿Por qué se plantea ahora una plataforma central? ¿Qué ha pasado para que surja?
2. ¿Qué relación tienen con Grupo ATU las marcas de cada campus? ¿Pueden aparecer juntas?
3. ¿Qué sería un éxito dentro de un año?
4. ¿Quién mantendría la plataforma y con cuánto tiempo?
5. ¿Hay presupuesto orientativo o límites de coste?

### 5.2 Administrador/a técnico de los campus

1. ¿Los campus son instalaciones separadas o comparten servidor o código?
2. ¿Qué versión de Moodle tiene cada uno y cuándo se actualizó por última vez?
3. ¿Cómo se autentican los usuarios? ¿Hay algún directorio común?
4. ¿Con qué frecuencia se crea, cambia o retira un campus? ¿Cómo se comunica hoy?
5. ¿Hay entorno de pruebas? ¿Se podrían habilitar servicios web en el futuro?

### 5.3 Centro de atención al usuario (CAU)

1. ¿Cuáles son las cinco consultas más frecuentes?
2. ¿Cuántas consultas al mes son del tipo «no sé cuál es mi campus» o «no encuentro la dirección»?
3. ¿Cómo averigua hoy a qué campus pertenece un usuario?
4. ¿Qué herramienta o lista usa para orientar a los usuarios?

### 5.4 Alumnado y profesorado (tarea observada)

1. ¿Cómo llegó la última vez a su campus? (correo, marcador, buscador, empresa…)
2. ¿Ha tenido alguna vez dudas sobre si estaba en el campus correcto?
3. ¿Tiene cursos en más de un campus? ¿Con la misma contraseña?
4. ¿Desde qué dispositivo entra normalmente?
5. Tarea: «Encuentre el campus de [marca] partiendo de un buscador». Anotar tiempo, pasos y dudas.

## 6. Control de versiones

| Versión | Fecha | Autor | Cambios |
|---|---|---|---|
| 0.1 | 2026-10-30 | Claude (Analista) | Primera versión: situación actual, 10 necesidades, 7 problemas, límites del problema y guion de entrevista. [Archivada](historico/05-situacion-actual_v0.1.md) |
| 0.2 | 2026-10-30 | Claude (Analista) | Revisión de la web corporativa por el alumno: PR-01 pasa a observado; nuevo PR-08. [Archivada](historico/05-situacion-actual_v0.2.md) |
| 0.3 | 2026-11-04 | Claude (Analista) | Respuesta de la tutora: enfoque de gestión interna. Situación actual (puntos 9 y 10), nuevas necesidades N-11 a N-15, nuevos problemas PR-09 y PR-10, relevancia de las necesidades y los problemas anteriores, y remisión al guion v2 |
