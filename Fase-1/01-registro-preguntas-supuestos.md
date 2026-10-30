# 01 — Registro de preguntas, supuestos y dependencias

| Campo | Valor |
|---|---|
| Versión | 0.8 |
| Fecha | 2026-10-30 |
| Estado | Revisión del propietario |
| Alumno | Carlos García Rallo |
| Tutor/a | *(en blanco)* |
| Redacción | Claude (rol Analista), a petición del alumno |

Este registro es una de las evidencias de avance que pide la ficha para la Fase 1 («mapa inicial, inventario y registro de preguntas»). Es un documento vivo: las preguntas no se borran al resolverse, se marca su estado y se anota la respuesta y su origen.

Etiquetas de origen: **[H]** hecho comprobado · **[O]** observado en web pública · **[D]** dato de la organización · **[S]** supuesto · **[R]** recomendación · **[P]** pendiente de autorización.

Estados: **Abierta** · **Respuesta provisional** (hay una respuesta de trabajo que falta confirmar) · **Resuelta** · **Descartada**.

Prioridad: **Alta** = bloquea el hito de la Fase 1 · **Media** = necesaria antes de cerrar la Fase 2 · **Baja** = puede esperar a fases posteriores.

---

## 1. Lo que ya sabemos con certeza

Antes de las preguntas, conviene separar lo poco que es seguro hoy:

- **[D]** El solicitante ha facilitado una lista de doce URL de entornos que considera Moodle (prompt inicial, sección 3).
- **[D]** La ficha no prescribe tecnología, arquitectura ni diseño (Ficha 01, página 1).
- **[D]** Límites: sin credenciales reales ni datos personales sin autorización, sin modificar Moodle en producción, sin pruebas intrusivas, sin asumir configuraciones iguales en todos los entornos y sin presentar como real una integración simulada (Ficha 01, página 5).
- **[D]** No se pueden iniciar actividades que requieran credenciales, acceso a sistemas, datos reales o intervención sobre servicios existentes sin autorización expresa del tutor (Ficha 01, página 9).
- **[D]** El propietario ha indicado que no se avanza más allá de la Fase 1 hasta recibir el visto bueno.
- **[D]** El alumno confirma que las doce aulas son de Grupo ATU (2026-10-30).
- **[D]** El alumno es Carlos García Rallo; el campo de tutor/a queda en blanco por ahora (2026-10-30).
- **[D]** De momento se trabaja solo con información pública, y el alumno autoriza la observación pasiva de los doce entornos (2026-10-30).
- **[O]** Once de los doce entornos son Moodle y se presentan con la marca, el soporte y el responsable del tratamiento de Grupo ATU / Academia Técnica Universitaria, S.L. (observación del 2026-10-30, ver [inventario](03-inventario-campus.md)).

Todo lo demás es, por ahora, supuesto o pregunta abierta.

---

## 2. Preguntas guía de la ficha (página 4) con respuesta provisional

### PG-01. ¿Qué problema concreto se pretende resolver y cómo se manifiesta actualmente?

- **Respuesta provisional:** La ficha habla de usuarios que necesitan «localizar y acceder de forma clara a los espacios que les correspondan» **[D]**. Con doce entornos en dominios distintos, la hipótesis es que un usuario no sabe a qué campus debe ir, no recuerda la URL o confunde campus con nombres parecidos **[S]**. No tenemos todavía ninguna evidencia de cómo se manifiesta: ni incidencias de soporte, ni quejas, ni datos de uso.
- **Qué falta:** ejemplos reales del problema (P-U03, P-U04).
- **Estado:** Respuesta provisional · **Prioridad:** Alta.

### PG-02. ¿Qué entornos Moodle existen, quién es responsable de cada uno y qué diferencias relevantes presentan?

- **Respuesta provisional (v0.2):** Existen al menos los doce de la lista **[D]**. Once se han observado y todos son Moodle **[O]**; el entorno 7 no se pudo observar (H-05). Los once comparten el canal de soporte y el responsable del tratamiento de Grupo ATU **[O]**, lo que es un indicio fuerte de un operador común **[S]**. Diferencias relevantes **[O]**: el entorno 1 usa otro tema y más idiomas; el 4 está en inglés, sin ayuda visible y con registro abierto; cinco entornos comparten el título «AULA VIRTUAL CENTRE LEARNING» aunque tienen marcas distintas. Indicio de Moodle 4.1 en todos, rama sin soporte de seguridad desde el 08-12-2025 **[S]**. Sigue sin saberse quién administra cada uno ni dónde se alojan.
- **Qué falta:** observación del entorno 7 (P-V05) y confirmación de responsables y versiones (P-O02, P-C01 a P-C05).
- *v0.1:* solo se conocían los nombres de dominio; ver [histórico](historico/01-registro-preguntas-supuestos_v0.1.md).
- **Estado:** Respuesta provisional · **Prioridad:** Alta.

### PG-03. ¿Qué perfiles de usuario intervienen y qué tareas necesita realizar cada uno?

- **Respuesta provisional:** Perfiles habituales en un entorno de formación con Moodle: alumnado, profesorado o tutores, personal de coordinación o secretaría, administradores de cada campus, soporte técnico y dirección que decide **[S]**. Habrá además un perfil nuevo: quien mantenga el catálogo de la plataforma central **[S]**. Tarea principal hipotética del alumnado: encontrar su campus y entrar en él **[S]**.
- **Qué falta:** confirmar perfiles reales, volúmenes y si hay personas que usan varios campus a la vez (P-U01, P-U02, P-U05).
- **Estado:** Respuesta provisional · **Prioridad:** Alta.

### PG-04. ¿Qué información puede mostrarse de forma pública, restringida o personalizada?

- **Respuesta provisional:** Lo que hoy ya es público en cada campus (nombre, URL, página de acceso) podría mostrarse en un catálogo público **[S]**. Cualquier información personalizada (por ejemplo, «tus cursos») exigiría saber quién es el usuario y, por tanto, una fuente de identidad común, que no sabemos si existe **[S]**. Recomendación de trabajo: no mostrar nada que no sea ya público hasta confirmar lo contrario **[R]**.
- **Qué falta:** P-O05 (marcas que no deben aparecer juntas), P-I01 (identidad común), P-L01 (responsable del tratamiento).
- **Estado:** Respuesta provisional · **Prioridad:** Alta.

### PG-05. ¿Se necesita únicamente centralizar el acceso o también consultar, intercambiar o administrar información?

- **Respuesta provisional:** No está decidido. La ficha pide estudiarlo, no darlo por hecho **[D]**. La hipótesis de menor riesgo es empezar por centralizar el acceso (localizar y redirigir) y tratar el resto como evolución futura condicionada a necesidad, permisos y viabilidad **[R]**.
- **Qué falta:** P-N01 y P-N02.
- **Estado:** Abierta · **Prioridad:** Alta (define el alcance preliminar).

### PG-06. ¿Qué requisitos de accesibilidad, adaptación a móviles, rendimiento y disponibilidad son necesarios?

- **Respuesta provisional:** Se adopta como referencia de trabajo WCAG 2.2 nivel AA, según el prompt inicial, sin afirmar conformidad hasta probarla **[D]**. Si la organización tiene obligación legal concreta de accesibilidad, habrá que confirmarlo (P-L04). Para móviles, rendimiento y disponibilidad no hay datos: hace falta saber desde qué dispositivos entran los usuarios y qué disponibilidad se espera **[S]**.
- **Qué falta:** P-U06, P-T04, P-L04.
- **Estado:** Respuesta provisional · **Prioridad:** Media.

### PG-07. ¿Qué dependencias, permisos, servicios o limitaciones pueden condicionar el proyecto?

- **Respuesta provisional:** Dependencias ya identificadas **[S]**: autorización del tutor para cualquier acceso; colaboración de los administradores de cada campus para cualquier integración; existencia o no de una identidad común; dominio y alojamiento para la plataforma; personas que mantengan el catálogo. Ver la sección 5 de este documento.
- **Estado:** Respuesta provisional · **Prioridad:** Alta.

### PG-08. ¿Cómo se actualizará la información cuando se añada, cambie o retire un entorno Moodle?

- **Respuesta provisional:** Hoy no existe ningún procedimiento conocido **[S]**. Hará falta definir quién avisa de un cambio, quién lo aplica en el catálogo, quién lo revisa y con qué frecuencia se comprueba que los enlaces siguen funcionando **[R]**. Se concretará en las Fases 2 y 4.
- **Qué falta:** P-O04 (quién mantendría el catálogo), P-C06 (frecuencia de cambios).
- **Estado:** Abierta · **Prioridad:** Media.

### PG-09. ¿Qué riesgos técnicos, organizativos, legales y de seguridad deben controlarse?

- **Respuesta provisional:** Riesgos ya visibles **[S]**: dar por buena información no confirmada sobre los campus; que la plataforma quede desactualizada y envíe a enlaces rotos; suplantación (enlaces maliciosos o páginas que imiten un campus); recoger datos personales sin necesidad; depender de una sola persona para mantenerla; no conseguir la colaboración de los administradores de los campus. Se desarrollarán en el documento 06 (registro de riesgos).
- **Estado:** Respuesta provisional · **Prioridad:** Alta.

### PG-10. ¿Cómo se comprobará objetivamente que la propuesta cumple su finalidad?

- **Respuesta provisional:** Propuesta de indicadores para validar con el tutor **[R]**: porcentaje de usuarios de prueba que encuentran su campus sin ayuda; tiempo hasta llegar a la página de acceso correcta; errores de elección de campus; enlaces válidos en el catálogo; resultado de la revisión de accesibilidad; y, si la organización puede medirlo, reducción de consultas a soporte del tipo «no encuentro mi campus». Los valores objetivo se fijarán en la Fase 2.
- **Qué falta:** P-U04 (datos de soporte actuales como línea base).
- **Estado:** Respuesta provisional · **Prioridad:** Media.

---

## 3. Preguntas adicionales

Agrupadas por destinatario. Las de prioridad Alta son las imprescindibles para cerrar la Fase 1.

### 3.1 Gobierno del proyecto (propietario y tutor)

| ID | Pregunta | Para | Prioridad | Estado |
|---|---|---|---|---|
| P-A01 | ¿Qué nombres van en los campos «Alumno o alumna» y «Tutor o tutora» de la ficha? | Propietario | Baja | **Resuelta** (2026-10-30): alumno Carlos García Rallo; tutor/a en blanco por ahora **[D]** |
| P-A02 | ¿Hay fecha de revisión del hito de la Fase 1 o un calendario general del proyecto? | Propietario / Tutor | Media | Abierta |
| P-A03 | ¿Cuál es el medio de entrega y el formato de revisión? ¿Basta con este repositorio o se necesita también PDF o Word? | Tutor | Media | Abierta |
| P-A04 | ¿Se autoriza la observación pasiva de las páginas públicas de los doce entornos (cargar la página sin iniciar sesión y anotar lo visible)? | Propietario / Tutor | Alta | **Resuelta** (2026-10-30): autorizada por el alumno **[D]**. Falta la del tutor, que no se ha pedido aún |
| P-A05 | ¿Podremos hablar con algún responsable de los campus y con usuarios reales, o la Fase 1 se hará solo con información pública y supuestos? | Propietario | Alta | **Resuelta** (2026-10-30): de momento, solo información pública **[D]**. Se preparará igualmente un guion de entrevista por si cambia |
| P-A06 | ¿El trabajo es individual o en equipo reducido? (la ficha admite ambas modalidades) | Propietario | Baja | Abierta |
| P-A07 | ¿Qué sistema operativo se usará en el equipo local cuando llegue la fase de prototipo? (solo informativo, no se necesita ahora) | Propietario | Baja | Abierta |

### 3.1 bis Surgidas de la observación de los campus (v0.2)

| ID | Pregunta | Para | Prioridad | Estado |
|---|---|---|---|---|
| P-V01 | ¿Puede el alumno revisar visualmente (en navegador) las páginas de acceso para completar la identidad visual (colores, disposición, versión móvil)? | Alumno | Baja | **Resuelta en parte** (2026-10-30): logotipos de los entornos 4, 8, 10, 11 y 12 verificados (E-06 a E-10). Falta la versión móvil |
| P-V11 | ¿Por qué varias páginas de acceso mezclan inglés y español (H-08)? ¿Depende del navegador o de la configuración de cada aula? | Administradores | Media | Abierta |
| P-V02 | ¿Por qué los entornos 2, 8, 10, 11 y 12 comparten el título «AULA VIRTUAL CENTRE LEARNING»? ¿Es intencionado (una marca paraguas) o un resto de plantilla? | Organización | Media | Abierta |
| P-V03 | ¿Qué es el entorno 4 (aulavirtualindex, en inglés, con registro abierto y sin ayuda visible)? ¿Está en uso, en pruebas o en desuso? | Organización | Alta | Abierta |
| P-V04 | ¿El entorno 1 (aulavirtualatu.com) es el campus principal? ¿Por qué tiene otro tema e idiomas distintos? | Organización | Media | Abierta |
| P-V05 | El entorno 7 no se deja leer de forma automatizada. ¿Puede el alumno abrirlo en su navegador, sin iniciar sesión, y anotar lo que ve? | Alumno | Alta | **Resuelta** (2026-10-30): captura E-01; ver inventario H-05 **[D]** |
| P-V06 | ¿Qué relación tienen con Grupo ATU las marcas que no llevan su nombre (Centre Learning, Takin, Tierra Más Ecológica (sociedad cooperativa), MoveOut, Estudi@, Grupo Almería Formación, Index Business Intelligent)? ¿Son clientes, filiales o marcas propias? | Organización | Alta | Abierta (amplía P-O01) |
| P-V07 | ¿La web corporativa (www.grupoatu.com) enlaza a los campus? Se genera con JavaScript y no se pudo leer de forma automatizada. Su descripción menciona «9 áreas formativas»: ¿corresponden a las marcas de los campus? | Alumno (revisión en navegador) / Organización | Alta | **Resuelta en parte** (2026-10-30): la web no enlaza a ningún campus (E-02 a E-05). Las 9 áreas son temáticas: 01 Salud, cuidados y bienestar · 02 Educación, deporte y comunidad · 03 Empresa, administración y comercio · 04 Tecnología y comunicación digital · 05 Hostelería, turismo y alimentación · 06 Industria, instalaciones y energía · 07 Construcción, movilidad y transporte · 08 Campo, mar y recursos naturales · 09 Imagen, diseño y oficios creativos. No coinciden una a una con las marcas de los campus; la relación queda en P-V09 **[O]** |
| P-V09 | ¿Qué relación hay entre las 9 áreas formativas de la web y los campus? (Por ejemplo, ¿un curso del área 04 se imparte en el campus «ATU Tecnología Digital»?) Si existe, podría servir para clasificar el catálogo | Organización | Media | Abierta |
| P-V10 | La web corporativa tiene un enlace «Accesibilidad» en el pie. ¿Existe una declaración de accesibilidad de Grupo ATU que la plataforma deba seguir? (amplía P-L04; pendiente de leer) | Alumno / Organización | Baja | Abierta |
| P-V08 | ¿La etiqueta `noindex` de las páginas de acceso es intencionada (que los campus no aparezcan en buscadores)? | Administradores | Media | Abierta |

### 3.2 Organización

| ID | Pregunta | Para | Prioridad | Estado |
|---|---|---|---|---|
| P-O01 | ¿Qué relación hay entre las entidades o marcas de los doce campus? ¿Son un mismo grupo, empresas asociadas o clientes? | Organización | Alta | **Resuelta en parte** (2026-10-30): el alumno confirma que las doce aulas son de Grupo ATU **[D]**. Queda por saber la relación concreta de cada marca con el grupo (P-V06) |
| P-O02 | ¿Quién es el responsable técnico y quién el responsable de negocio de cada campus? | Organización | Alta | Abierta |
| P-O03 | ¿Quién impulsa el proyecto y quién tomará la decisión final de implantarlo? | Organización | Alta | Abierta |
| P-O04 | Si la plataforma se implanta, ¿quién mantendría el catálogo? ¿Hay personal disponible para ello? | Organización | Media | Abierta |
| P-O05 | ¿Hay marcas o campus que no deban aparecer juntos públicamente, por motivos comerciales o legales? | Organización | Alta | Abierta |
| P-O06 | ¿Bajo qué marca o identidad visual se presentaría la plataforma central? | Organización | Media | Abierta |
| P-O07 | ¿Hay más entornos Moodle (u otras plataformas de formación) que no estén en la lista de doce? | Organización | Alta | Abierta |

### 3.3 Usuarios y problema actual

| ID | Pregunta | Para | Prioridad | Estado |
|---|---|---|---|---|
| P-U01 | ¿Qué perfiles usan cada campus (alumnado, profesorado, empresas, personal interno…)? | Organización | Alta | Abierta |
| P-U02 | ¿Cuántos usuarios activos tiene aproximadamente cada campus? (rangos, sin datos personales) | Organización | Media | Abierta |
| P-U03 | ¿Cómo llegan hoy los usuarios a su campus? (correo de bienvenida, web corporativa, marcador, buscador…) | Organización | Alta | Abierta |
| P-U04 | ¿Hay incidencias de soporte o quejas relacionadas con no encontrar el campus o confundirse de campus? ¿Se pueden cuantificar? | Organización | Alta | Abierta |
| P-U05 | ¿Hay usuarios que tengan cuenta en más de un campus? ¿Con el mismo usuario y contraseña o con cuentas distintas? | Organización | Alta | Abierta |
| P-U06 | ¿Desde qué dispositivos acceden principalmente (ordenador, móvil, app Moodle)? | Organización | Media | Abierta |
| P-U07 | ¿Hay usuarios con necesidades de accesibilidad conocidas o colectivos específicos (por ejemplo, personas mayores o con baja competencia digital)? | Organización | Media | Abierta |
| P-U08 | ¿En qué idiomas debe estar la plataforma? | Organización | Media | Abierta |

### 3.4 Necesidad y alcance

| ID | Pregunta | Para | Prioridad | Estado |
|---|---|---|---|---|
| P-N01 | ¿Qué esperaría la organización de la plataforma: solo un punto de entrada con enlaces, o también ver cursos, notificaciones o datos de los campus? | Organización | Alta | Abierta |
| P-N02 | ¿Se espera inicio de sesión único (entrar una vez y acceder a todos los campus)? ¿Es un deseo o un requisito? | Organización | Alta | Abierta |
| P-N03 | ¿La plataforma sería pública (cualquiera puede ver el catálogo) o solo para usuarios identificados? | Organización | Alta | Abierta |
| P-N04 | ¿Qué atributos serían útiles para buscar o filtrar campus (entidad, temática, ubicación, modalidad…)? ¿Quién mantendría esos datos? | Organización | Media | Abierta |
| P-N05 | ¿Hay algún plazo o evento que condicione cuándo debería estar disponible? | Organización | Media | Abierta |

### 3.5 Campus y aspectos técnicos

| ID | Pregunta | Para | Prioridad | Estado |
|---|---|---|---|---|
| P-C01 | ¿Qué versión de Moodle tiene cada campus? | Administradores | Media | Abierta |
| P-C02 | ¿Dónde se aloja cada campus y quién da el servicio (propio, proveedor, MoodleCloud…)? | Administradores | Media | Abierta |
| P-C03 | ¿Qué método de autenticación usa cada campus (cuentas manuales, Google, Microsoft, LDAP, otro)? | Administradores | Alta | Abierta |
| P-C04 | ¿Tienen habilitados servicios web o la API de Moodle? ¿Se permitiría habilitarlos? | Administradores | Baja | Abierta |
| P-C05 | ¿Existe algún entorno de pruebas (no producción) que se pueda usar más adelante? | Administradores | Baja | Abierta |
| P-C06 | ¿Con qué frecuencia se crean, cambian o retiran campus? | Organización | Media | Abierta |
| P-C07 | ¿Existe un dominio corporativo común donde podría alojarse la plataforma? | Organización | Baja | Abierta |

### 3.6 Identidad, legal y privacidad

| ID | Pregunta | Para | Prioridad | Estado |
|---|---|---|---|---|
| P-I01 | ¿Existe un directorio de usuarios común a todos o a varios campus (por ejemplo, Google Workspace, Microsoft Entra ID, LDAP)? | Organización | Alta | Abierta |
| P-L01 | ¿Quién es el responsable del tratamiento de datos de cada campus? ¿Hay delegado de protección de datos? | Organización | Media | Abierta |
| P-L02 | ¿Hay política de cookies o de analítica web corporativa que la plataforma deba seguir? | Organización | Baja | Abierta |
| P-L03 | ¿Hay restricciones de uso de logotipos o marcas de las entidades en la plataforma? | Organización | Media | Abierta |
| P-L04 | ¿Alguna de las entidades tiene obligación legal específica de accesibilidad digital? (se investigará la normativa aplicable y se pedirá confirmación, sin emitir conclusiones jurídicas) | Organización | Media | Abierta |

### 3.7 Recursos

| ID | Pregunta | Para | Prioridad | Estado |
|---|---|---|---|---|
| P-R01 | ¿Hay un presupuesto orientativo o un límite de coste recurrente aceptable? | Organización | Baja | Abierta |
| P-R02 | ¿Qué conocimientos técnicos tiene el personal que mantendría la plataforma? | Organización | Media | Abierta |
| P-R03 | ¿Hay herramientas o servicios ya contratados que se prefiera reutilizar (web corporativa, CMS, hosting)? | Organización | Media | Abierta |

---

## 4. Supuestos de trabajo

Se usan para avanzar sin bloquear la fase. Cada uno se mantendrá, se confirmará o se descartará.

| ID | Supuesto | Base | Pregunta que lo confirma | Estado |
|---|---|---|---|---|
| S-01 | Los campus pertenecen o los opera un mismo grupo (Grupo ATU) | v0.1: siete dominios contienen «atu». v0.2: los once observados comparten soporte, bloque «Acerca de ATU» y responsable del tratamiento. v0.8: confirmado por el alumno | P-O01 | **Confirmado [D]** (2026-10-30) |
| S-02 | No se debe presuponer que todos los campus comparten versión, alojamiento, autenticación ni responsable | Ficha 01, página 5 (límites) | P-C01 a P-C03 | Se mantiene como regla |
| S-03 | Todos los entornos son Moodle | v0.2: los once observados muestran «Desarrollado por Moodle» y la página de acceso estándar. v0.4: el entorno 7 muestra un formulario típico de Moodle, pero el pie no es visible | P-C01 | **Verificado en 11 de 12; indicio fuerte en el 7** |
| S-04 | El problema principal es localizar y acceder al campus correcto, no gestionar contenidos | Redacción de la ficha | P-N01, P-U04 | Pendiente de confirmar |
| S-05 | No existe hoy una identidad común para todos los campus | Ausencia de información. v0.2: ninguna página muestra acceso con Google, Microsoft u otro proveedor (H-06) | P-I01, P-C03 | Pendiente de confirmar; reforzado por la observación |
| S-06 | La Fase 1 se hará con información pública y supuestos, sin entrevistas, salvo que el propietario indique lo contrario | Situación actual | P-A05 | **Confirmado** por el alumno (2026-10-30) |
| S-08 | Los entornos usan Moodle 4.1, rama sin soporte de seguridad desde el 08-12-2025 | Parámetro de versión en el enlace de la app móvil (H-04) y página oficial de versiones (F-15) | P-C01 | Indicio |
| S-09 | La organización usa Microsoft 365 | Ayuda alojada en grupoatu365.sharepoint.com (H-07) | P-I01 | Indicio |
| S-07 | El nombre «aulavirtualalmeria» sugiere que algún campus se organiza por ubicación geográfica | Texto de la URL | P-N04 | Indicio |

## 5. Dependencias

| ID | Dependencia | Afecta a | Responsable | Estado |
|---|---|---|---|---|
| D-01 | Visto bueno del tutor para pasar de fase | Todo el proyecto | Tutor | Pendiente |
| D-02 | Autorización para la observación pasiva de los doce entornos | T4 (inventario) | Propietario / Tutor | Resuelta por el alumno (P-A04) |
| D-03 | Contacto con responsables de campus y usuarios | Confirmación de supuestos | Organización | Descartado por ahora (P-A05): los supuestos quedarán abiertos para el tutor |
| D-04 | Colaboración de los administradores de cada campus para cualquier integración | Fases 3 en adelante | Organización | No necesaria aún |

## 6. Control de versiones

| Versión | Fecha | Autor | Cambios |
|---|---|---|---|
| 0.1 | 2026-10-30 | Claude (Analista) | Primera versión: diez preguntas guía con respuesta provisional, 42 preguntas adicionales, 7 supuestos y 4 dependencias. [Archivada](historico/01-registro-preguntas-supuestos_v0.1.md) |
| 0.2 | 2026-10-30 | Claude (Analista) | Respuestas del alumno (P-A01, P-A04, P-A05). Resultados de la observación de los campus: PG-02 actualizada, 8 preguntas nuevas (P-V01 a P-V08), supuestos S-01, S-03, S-05 y S-06 actualizados, S-08 y S-09 nuevos. [Archivada](historico/01-registro-preguntas-supuestos_v0.2.md) (sin P-V07 ni P-V08) |
| 0.3 | 2026-10-30 | Claude (Analista) | P-V07 y P-V08 añadidas tras consultar la web corporativa. [Archivada](historico/01-registro-preguntas-supuestos_v0.3.md) |
| 0.4 | 2026-10-30 | Claude (Analista) | P-V05 resuelta con la captura del alumno; S-03 actualizado. [Archivada](historico/01-registro-preguntas-supuestos_v0.4.md) |
| 0.5 | 2026-10-30 | Claude (Analista) | P-V07 resuelta en parte con las capturas de la web corporativa; nuevas P-V09 y P-V10. [Archivada](historico/01-registro-preguntas-supuestos_v0.5.md) |
| 0.6 | 2026-10-30 | Claude (Analista) | «Index» deja de tratarse como marca (ver inventario v0.3). [Archivada](historico/01-registro-preguntas-supuestos_v0.6.md) |
| 0.7 | 2026-10-30 | Claude (Analista) | Marcas verificadas con capturas (P-V01 en parte); nueva P-V11 sobre el idioma mezclado. [Archivada](historico/01-registro-preguntas-supuestos_v0.7.md) |
| 0.8 | 2026-10-30 | Claude (Analista) | El alumno confirma que las doce aulas son de Grupo ATU: S-01 confirmado, P-O01 resuelta en parte |
