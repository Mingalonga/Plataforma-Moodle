# 03 — Inventario de los doce entornos Moodle

| Campo | Valor |
|---|---|
| Versión | 0.4 |
| Fecha de observación | 2026-10-30 |
| Estado | Revisión del propietario |
| Alumno | Carlos García Rallo |
| Tutor/a | *(en blanco)* |
| Redacción | Claude (roles Analista y Especialista Moodle), a petición del alumno |
| Método | Observación pasiva de la página pública de acceso, una petición por URL. El entorno 7 se observó de forma manual en navegador por el alumno (captura E-01). Ver [02 — Fuentes y metodología](02-fuentes-y-metodologia.md). |

Estados: **V** = verificado (leído literalmente en la página) · **I** = indicio (deducido) · **P** = pendiente de confirmar.

> Recordatorio: «verificado» significa que la página pública lo muestra en la fecha de consulta. No confirma quién es realmente el responsable, ni cómo está montado el servicio por dentro.

---

## 1. Matriz resumen

| N.º | URL facilitada | Título de la página | Marca aparente (logotipo) | Carga | Idioma por defecto | Tema | Versión (indicio) | Estado global |
|---|---|---|---|---|---|---|---|---|
| 1 | https://aulavirtualatu.com/ | Entrar al sitio \| Campus Virtual - ATU | Grupo ATU (logo «Eguru») | Sí (200) | Español | eguru | 4.1.19 | V con indicios |
| 2 | https://aulavirtual.centrelearning.net | AULA VIRTUAL CENTRE LEARNING | Centre Learning | Sí (200) | Español | enlight | 4.1.2+ | V con indicios |
| 3 | https://aulavirtual.atuasesoria.com | AULA VIRTUAL ATU ASESORÍA DE FORMACIÓN | ATU (logo «ATU-DOS») | Sí (200) | Español | enlight | 4.1.2+ | V con indicios |
| 4 | https://aulavirtualindex.grupoatu.com/ | AULA VIRTUAL ATU | **ATU Index Business Intelligent** (logotipo, E-10) | Sí (200) | **Inglés** | enlight | 4.1.2+ | V con indicios · anomalías |
| 5 | https://aulavirtual.takin.es/login/index.php | AULA VIRTUAL TAKIN | Takin | Sí (200) | Español | enlight | 4.1.2+ | V con indicios |
| 6 | https://aulavirtual.clubaventuraatu.com | AULA VIRTUAL CLUB AVENTURA ATU | Club Aventura | Sí (200) | Español | enlight | 4.1.2+ | V con indicios |
| 7 | https://aulavirtual.atutecnologiadigital.com | No visible en la captura | Grupo ATU Tecnología Digital | Sí (manual) | Español | Indicio: eguru, como el 1 | — | V parcial (captura) |
| 8 | https://aulavirtualalmeria.grupoatu.com/login/index.php | **AULA VIRTUAL CENTRE LEARNING** | Grupo Almería Formación (logotipo, E-06) | Sí (200) | Español | enlight | 4.1.2+ | V con indicios · anomalía de título |
| 9 | https://aulavirtual.atuseguridadysalud.com/login/index.php | AULA VIRTUAL ATU SEGURIDAD Y SALUD | ATU Seguridad y Salud | Sí (200) | Español | enlight | 4.1.2+ | V con indicios |
| 10 | https://aulas.tierramasecologica.com/login/index.php | **AULA VIRTUAL CENTRE LEARNING** | Tierra Más Ecológica, Sociedad Cooperativa (logotipo, E-07) | Sí (200) | Español | enlight | 4.1.2+ | V con indicios · anomalía de título |
| 11 | https://aulavirtual.moveout.es/login/index.php | **AULA VIRTUAL CENTRE LEARNING** | MoveOut (logotipo, E-08) | Sí (200) | Español | enlight | 4.1.2+ | V con indicios · anomalía de título |
| 12 | https://aulavirtual.estudia-fp.com/login/index.php | **AULA VIRTUAL CENTRE LEARNING** | **Estudi@ Formación Profesional** (logotipo, E-09) | Sí (200) | Español | enlight | 4.1.2+ | V con indicios · anomalía de título |

En negrita, lo que llama la atención y se explica en la sección 3.

> **De dónde sale la «marca aparente» (aclaración v0.3).** La lectura automatizada no ve las imágenes, solo su nombre de archivo y su texto alternativo. Por eso:
> - En los entornos 2, 3, 5, 6 y 9 la marca coincide con el título de la página o el texto alternativo del logotipo **[V]**.
> - En los entornos 8, 10, 11 y 12 (título «AULA VIRTUAL CENTRE LEARNING») la marca se deduce del **nombre del archivo del logotipo** y de la **dirección web** (por ejemplo, `MoveOut-negro.png` en `aulavirtual.moveout.es`) **[I]**.
> - En el entorno 4 no se ha identificado ninguna marca; «index» solo aparece en la dirección y en el nombre del archivo del logotipo **[I]**.
> - En los entornos 1 y 7 el alumno ha visto la página (o el texto lo indica) **[V]**.
>
> Confirmarlo es tan sencillo como abrir cada página y mirar el logotipo (P-V01).
>
> **Actualización v0.4:** el alumno capturó los logotipos de los entornos 4, 8, 10, 11 y 12 (E-06 a E-10). Las marcas quedan **verificadas**, con dos correcciones: el entorno 12 es «Estudi@ Formación Profesional» (no «Studia») y el entorno 10 se presenta como «Sociedad Cooperativa». En el entorno 4, el logotipo muestra «atu INDEX BUSINESS INTELLIGENT»: «Index Business Intelligent» es una línea o submarca de ATU, como suponía el nombre del archivo.

---

## 2. Rasgos comunes observados

En los entornos 2, 3, 5, 6, 8, 9, 10, 11 y 12 (nueve de los once observados) se repite exactamente lo siguiente **[V]**:

- Tema de Moodle «enlight», con el mismo diseño de página de acceso (campos «Nombre de usuario» y «Contraseña», botón «Acceder», enlace «¿Olvidó su contraseña?»).
- Idiomas disponibles: Español y English.
- Canal de soporte: correo `tutoriavirtual@grupoatu.com` y teléfono gratuito 900 922 254, con enlaces a preguntas frecuentes y tutoriales alojados en `grupoatu365.sharepoint.com`.
- Bloque «Acerca de ATU» con el texto «GRUPO atu, consultora de formación…» y enlace a https://www.grupoatu.com/.
- Redes sociales de Grupo ATU, logotipos de SEPE y de financiación europea (Plan de Recuperación), y aviso de cookies.
- Texto de protección de datos que nombra como responsable a **Academia Técnica Universitaria, S.L.**
- Pie «Desarrollado por Moodle», enlace a la app móvil de Moodle y enlace al resumen de retención de datos.
- Copyright «© 2023 - ATU Formación ®».
- Metaetiqueta `robots` con valor `noindex` (los buscadores no deben indexar la página).
- Sin botones de acceso con Google, Microsoft u otros proveedores, sin acceso de invitados y sin registro propio visible.

**Indicio [I]:** todos los entornos observados se presentan con la marca, el soporte y el responsable del tratamiento de Grupo ATU / Academia Técnica Universitaria, S.L., aunque varios lleven el logotipo de otra marca. Es un indicio fuerte de que existe un único operador o un único equipo que los mantiene, pero **no** permite saber si son instalaciones de Moodle independientes o compartidas, ni quién las administra técnicamente (P-O01, P-O02).

---

## 3. Hallazgos que conviene destacar

### H-01. Cinco entornos comparten el título «AULA VIRTUAL CENTRE LEARNING» [V]

Los entornos 2, 8, 10, 11 y 12 tienen el mismo título de página y el mismo texto alternativo del logotipo, aunque cada uno muestra un logotipo distinto: Centre Learning, Grupo Almería Formación, Tierra Más Ecológica, MoveOut y Estudi@ (verificado con las capturas E-06 a E-09). Los entornos 2 y 8 usan además la misma imagen de fondo.

- **Por qué importa:** el título es lo que aparece en la pestaña del navegador, en marcadores, en el historial y lo que lee un lector de pantalla. Un usuario que tenga abiertos o guardados dos de estos campus no puede distinguirlos por el título. Es una **evidencia observada** a favor del problema que plantea la ficha (localizar el espacio correcto), aunque no prueba que los usuarios se confundan en la práctica.
- **Indicio [I]:** parece que los entornos se crearon a partir de una misma plantilla (posiblemente una copia del entorno 2) y solo se cambió el logotipo.
- **Pregunta:** P-V02.

### H-02. El entorno 4 está en inglés y con texto de plantilla sin completar [V]

- Idioma por defecto inglés («Log in to the site», «Username», «Password»), cuando el resto está en español.
- Copyright «© 2017 - Your Company Name ®. All rights reserved.», que es el texto por defecto del tema.
- Es el único con **registro propio visible** («Create new account», que permite a cualquiera crearse una cuenta).
- No muestra canal de ayuda ni responsable del tratamiento.
- **Indicio [I]:** podría ser un entorno menos mantenido, en pruebas o con otra finalidad (el logotipo, visto en la captura E-10, es «atu INDEX BUSINESS INTELLIGENT», y la imagen de fondo es un edificio con el lema «atu Digitalización y Formación — Más de 40 años de formación a tu medida»).
- **Pregunta:** P-V03.

### H-03. El entorno 1 es distinto al resto [V]

- Tema diferente («eguru» en lugar de «enlight») y más idiomas (español, catalán, inglés, euskera, francés, gallego y valenciano).
- Título «Campus Virtual - ATU» y horario de atención de 8:30 a 20:30 (en el entorno 3 figura «Lunes a Viernes: 8:30 a 20:00»).
- **Indicio [I]:** número interno de versión distinto al resto (ver H-04). Parece una instalación separada, posiblemente el campus principal.
- **Pregunta:** P-V04.

### H-04. Indicio de versión de Moodle sin soporte de seguridad [I]

La versión no se muestra en ningún texto visible. Solo aparece como parámetro `version=` en el enlace de descarga de la app móvil, que forma parte de la página pública:

| Entornos | Parámetro observado | Correspondencia según Moodle (F-15) |
|---|---|---|
| 2, 3, 4, 5, 6, 8, 9, 10, 11, 12 | `2022112802.05` | Moodle 4.1.2 (publicada el 13-03-2023), más cambios semanales posteriores (sufijo `.05`) |
| 1 | `2022112819` | Moodle 4.1.19 (publicada el 09-06-2025) |

Según la página oficial de versiones de Moodle (F-15), la rama 4.1 dejó de recibir correcciones generales el 11-12-2023 y **correcciones de seguridad el 08-12-2025**.

- **Estado: indicio, no hecho.** El parámetro puede no reflejar la versión real instalada (por ejemplo, si se han aplicado parches a mano). Solo el administrador puede confirmarlo (P-C01).
- **Por qué importa para el proyecto:** si se confirma, condiciona cualquier integración con Moodle (funciones de la API, compatibilidad de plugins) y es un riesgo para la organización que conviene trasladar con discreción a su responsable. No se ha hecho ninguna comprobación de vulnerabilidades ni se hará: queda fuera de los límites del encargo.
- Se recoge en el registro de riesgos (documento 06, pendiente).

### H-05. El entorno 7 bloquea la lectura automatizada y tiene un diseño propio [V]

La herramienta de lectura web rechazó la URL porque el archivo `robots.txt` del sitio no permite la lectura automatizada. Por respeto a esa indicación no se insistió. El alumno la observó después en su navegador, sin iniciar sesión, y aportó una captura ([E-01](evidencias/E-01_campus07_pagina-acceso_2026-10-30.png)).

- **Observado [V]:** logotipo «GRUPO atu TECNOLOGÍA DIGITAL»; formulario «Entrar» con «Nombre de usuario», «Contraseña», «Acceder» y «¿Olvidó su contraseña?»; bloque «CENTRO DE ATENCIÓN AL USUARIO (CAU)» con horario 08:30–20:30, teléfono 900 922 254 y correo `tutoriavirtual@grupoatu.com`; bloque «SOLICITUD DE INFORMACIÓN» con el botón «¿Quieres hacer algún curso?».
- **Indicio [I]:** el diseño y el horario del CAU coinciden con el entorno 1 (tema «eguru»), no con los «enlight». La captura no muestra el pie de página, así que «Desarrollado por Moodle» y la versión no se han podido ver; que sea Moodle es un indicio fuerte (formulario y ruta de recuperación de contraseña típicos), no un hecho.
- **Diferencial [V]:** es el único que incluye en la página de acceso una llamada comercial para pedir información de cursos.
- **Accesibilidad [I]:** el botón «¿Quieres hacer algún curso?» muestra texto azul sobre fondo gris oscuro; a simple vista el contraste parece insuficiente. No se ha medido; se anota para la revisión de accesibilidad de la Fase 7 como referencia de lo que la plataforma debe evitar.

### H-08. El idioma de la interfaz no es coherente [V]

En la lectura automatizada, las páginas aparecían en español (salvo la del entorno 4). En el navegador del alumno, los entornos 4, 8, 10, 11 y 12 muestran el selector en «English (en)» y mezclan etiquetas en inglés («Username», «Password», «Lost password?», «Log in», «Cookies notice») con textos en español («Acceda con sus credenciales por favor», «Contraseña») (capturas E-06 a E-10).

- **Causa no determinada [P].** Puede depender del idioma del navegador o de la configuración de cada aula; no se ha investigado.
- **Por qué importa:** una misma persona puede ver la página de acceso en dos idiomas a la vez, lo que dificulta la comprensión y es un punto a revisar en accesibilidad.

### H-06. Ningún entorno muestra acceso con proveedores externos [V]

En las once páginas observadas el acceso es con usuario y contraseña propios del campus. No se ve inicio de sesión con Google, Microsoft ni otro sistema común.

- **Indicio [I]:** cada campus tendría sus propias cuentas. No sabemos si un mismo usuario tiene la misma contraseña en varios campus ni si existe un directorio común por detrás (P-U05, P-I01, P-C03). Refuerza el supuesto S-05.

### H-07. Ayuda y documentación en SharePoint [V]

Las preguntas frecuentes y tutoriales enlazan a `grupoatu365.sharepoint.com`.

- **Indicio [I]:** la organización usa Microsoft 365. Podría existir un directorio Microsoft Entra ID que, en fases posteriores, sirviera de fuente de identidad. **No** se puede deducir que los usuarios de los campus estén en ese directorio (P-I01).

---

## 4. Fichas individuales

Formato de cada ficha según el esquema del documento 02. Se omiten los rasgos comunes de la sección 2 salvo que difieran.

### Entorno 1 — aulavirtualatu.com

| Campo | Valor | Estado |
|---|---|---|
| URL facilitada | https://aulavirtualatu.com/ | V |
| Resultado | HTTP 200, sin redirección | V |
| Nombre visible | «Campus Virtual - ATU» (título «Entrar al sitio \| Campus Virtual - ATU») | V |
| Marca aparente | Grupo ATU (copyright y pie). Logotipo con texto alternativo «Eguru» | V |
| Acceso público | Se ve la página de acceso sin identificarse | V |
| Página de acceso | «Nombre de usuario o correo electrónico», «Contraseña», «Acceder», «¿Olvidó su contraseña?». Aparece un encabezado «Registrarse como usuario» sin contenido visible | V |
| Idiomas | Español (por defecto), català, English, euskara, français, galego, valencià | V |
| Identidad visual | Tema «eguru» | V |
| Ayuda y contacto | Centro de atención al usuario (CAU) 900 922 254, de 8:30 a 20:30; `tutoriavirtual@grupoatu.com`; contacto general de Grupo ATU (Burgos) | V |
| Señales de Moodle | «Desarrollado por Moodle», metaetiqueta «moodle», enlace a la app móvil, resumen de retención de datos | V |
| Versión | Indicio de 4.1.19 (parámetro `2022112819`) | I |
| Responsable del tratamiento nombrado | Academia Técnica Universitaria, S.L. | V |
| Diferencial | Único con tema «eguru» y con siete idiomas. Posible campus principal | I |
| Incidencias | Ninguna visible. `robots: noindex` | V |
| Preguntas | P-V04, P-C01, P-C03 | — |

### Entorno 2 — aulavirtual.centrelearning.net

| Campo | Valor | Estado |
|---|---|---|
| URL facilitada | https://aulavirtual.centrelearning.net (se sirve en `/`) | V |
| Resultado | HTTP 200 | V |
| Nombre visible | «AULA VIRTUAL CENTRE LEARNING: Entrar al sitio» | V |
| Marca aparente | Centre Learning (logo `logo_centrelearning.png`) | V |
| Página de acceso | Rasgos comunes. Encabezado «Acceda con sus credenciales por favor» | V |
| Ayuda y contacto | Rasgos comunes («Contacto y FAQs») | V |
| Versión | Indicio de 4.1.2+ | I |
| Diferencial | Su título se repite en los entornos 8, 10, 11 y 12 (H-01). Posible plantilla de origen | I |
| Incidencias | Ninguna visible | V |
| Preguntas | P-V02 | — |

### Entorno 3 — aulavirtual.atuasesoria.com

| Campo | Valor | Estado |
|---|---|---|
| Resultado | HTTP 200 | V |
| Nombre visible | «AULA VIRTUAL ATU ASESORÍA DE FORMACIÓN» | V |
| Marca aparente | ATU (logo «LOG ATU-DOS SIN FONDO») | V |
| Ayuda y contacto | Rasgos comunes, con horario «Lunes a Viernes: 8:30 a 20:00» | V |
| Versión | Indicio de 4.1.2+ | I |
| Diferencial | Único de los «enlight» que publica horario de atención | V |
| Incidencias | Ninguna visible | V |

### Entorno 4 — aulavirtualindex.grupoatu.com

| Campo | Valor | Estado |
|---|---|---|
| Resultado | HTTP 200 | V |
| Nombre visible | «AULA VIRTUAL ATU: Log in to the site» | V |
| Marca aparente | Título «AULA VIRTUAL ATU»; logotipo «atu INDEX BUSINESS INTELLIGENT» (captura E-10) | V |
| Página de acceso | «Username», «Password», «Log in», «Create new account» (registro propio) | V |
| Idiomas | English (por defecto), Español - Internacional | V |
| Ayuda y contacto | **Ninguno visible** | V |
| Responsable del tratamiento | **No se nombra** | V |
| Versión | Indicio de 4.1.2+ | I |
| Diferencial | Único en inglés, único con registro propio, copyright de plantilla de 2017 sin completar (H-02) | V |
| Incidencias | Configuración aparentemente incompleta | I |
| Preguntas | P-V03 | — |

### Entorno 5 — aulavirtual.takin.es

| Campo | Valor | Estado |
|---|---|---|
| Resultado | HTTP 200 | V |
| Nombre visible | «AULA VIRTUAL TAKIN» | V |
| Marca aparente | Takin (logo). La imagen de fondo se llama «TAKIN-agencia-de-marketing-kit-digital» | V |
| Versión | Indicio de 4.1.2+ | I |
| Diferencial | El nombre de la imagen sugiere relación con una agencia de marketing y el programa Kit Digital | I |
| Incidencias | Ninguna visible | V |

### Entorno 6 — aulavirtual.clubaventuraatu.com

| Campo | Valor | Estado |
|---|---|---|
| Resultado | HTTP 200 | V |
| Nombre visible | «AULA VIRTUAL CLUB AVENTURA ATU» | V |
| Marca aparente | Club Aventura (logo); imagen de fondo de viajes | V |
| Versión | Indicio de 4.1.2+ | I |
| Diferencial | Temática de viajes o aventura | I |
| Incidencias | Ninguna visible | V |

### Entorno 7 — aulavirtual.atutecnologiadigital.com

| Campo | Valor | Estado |
|---|---|---|
| URL facilitada | https://aulavirtual.atutecnologiadigital.com | V |
| Resultado | Lectura automatizada rechazada por `robots.txt`. Observado manualmente por el alumno en navegador (captura [E-01](evidencias/E-01_campus07_pagina-acceso_2026-10-30.png)) | V |
| Nombre visible | Título de la pestaña no visible en la captura | P |
| Marca aparente | Grupo ATU Tecnología Digital (logotipo) | V |
| Acceso público | Se ve la página de acceso sin identificarse | V |
| Página de acceso | «Entrar», «Nombre de usuario», «Contraseña», «Acceder», «¿Olvidó su contraseña?» | V |
| Idioma | Español (textos visibles); selector de idioma no visible | V / P |
| Identidad visual | Azul corporativo de Grupo ATU, imagen de una persona estudiando con portátil. Diseño similar al entorno 1 | V / I |
| Ayuda y contacto | CAU 08:30–20:30, 900 922 254, `tutoriavirtual@grupoatu.com` | V |
| Señales de Moodle | Formulario y enlace de recuperación típicos de Moodle; pie no visible | I |
| Versión | No observable | P |
| Responsable del tratamiento | No visible en la captura | P |
| Diferencial | Bloque comercial «Solicitud de información — ¿Quieres hacer algún curso?» | V |
| Incidencias | Ninguna visible. Posible contraste insuficiente en el botón comercial | I |
| Preguntas | P-C01; ¿por qué bloquea la lectura automatizada a diferencia del resto? | — |

### Entorno 8 — aulavirtualalmeria.grupoatu.com

| Campo | Valor | Estado |
|---|---|---|
| Resultado | HTTP 200 | V |
| Nombre visible | «AULA VIRTUAL CENTRE LEARNING» | V |
| Marca aparente | Grupo Almería Formación, «Consultoría · Gestión · Formación · Empleo» (logotipo, E-06) | V |
| Versión | Indicio de 4.1.2+ | I |
| Diferencial | Título de otra marca (H-01); mismo fondo que el entorno 2. El nombre del subdominio sugiere organización por ubicación (S-07) | V / I |
| Incidencias | Ninguna visible | V |

### Entorno 9 — aulavirtual.atuseguridadysalud.com

| Campo | Valor | Estado |
|---|---|---|
| Resultado | HTTP 200 | V |
| Nombre visible | «AULA VIRTUAL ATU SEGURIDAD Y SALUD» | V |
| Marca aparente | ATU Seguridad y Salud (logo) | V |
| Versión | Indicio de 4.1.2+ | I |
| Diferencial | Temática de prevención de riesgos o seguridad y salud | I |
| Incidencias | Ninguna visible | V |

### Entorno 10 — aulas.tierramasecologica.com

| Campo | Valor | Estado |
|---|---|---|
| Resultado | HTTP 200 | V |
| Nombre visible | «AULA VIRTUAL CENTRE LEARNING» | V |
| Marca aparente | Tierra Más Ecológica, Sociedad Cooperativa (logotipo, E-07) | V |
| Versión | Indicio de 4.1.2+ | I |
| Diferencial | Único subdominio «aulas.» en lugar de «aulavirtual.»; título de otra marca (H-01) | V |
| Incidencias | Ninguna visible | V |

### Entorno 11 — aulavirtual.moveout.es

| Campo | Valor | Estado |
|---|---|---|
| Resultado | HTTP 200 | V |
| Nombre visible | «AULA VIRTUAL CENTRE LEARNING» | V |
| Marca aparente | MoveOut, con un avión en el logotipo (E-08) | V |
| Versión | Indicio de 4.1.2+ | I |
| Diferencial | Título de otra marca (H-01) | V |
| Incidencias | Ninguna visible | V |

### Entorno 12 — aulavirtual.estudia-fp.com

| Campo | Valor | Estado |
|---|---|---|
| Resultado | HTTP 200 | V |
| Nombre visible | «AULA VIRTUAL CENTRE LEARNING» | V |
| Marca aparente | Estudi@ Formación Profesional (logotipo, captura E-09) | V |
| Versión | Indicio de 4.1.2+ | I |
| Diferencial | Título de otra marca (H-01). El dominio sugiere formación profesional | V / I |
| Incidencias | Ninguna visible | V |

---

## 5. Lo que este inventario no puede responder

Queda pendiente de la organización (registro de preguntas): quién administra cada entorno, si son instalaciones independientes o comparten servidor, la versión real, el método de autenticación interno, cuántos usuarios tiene cada uno, qué cursos o colectivos atiende cada marca y si hay más entornos fuera de esta lista.

## 6. Control de versiones

| Versión | Fecha | Autor | Cambios |
|---|---|---|---|
| 0.1 | 2026-10-30 | Claude (Analista / Especialista Moodle) | Primera observación pasiva de los doce entornos: 11 observados, 1 bloqueado por `robots.txt`. [Archivada](historico/03-inventario-campus_v0.1.md) |
| 0.2 | 2026-10-30 | Claude (Analista / Especialista Moodle) | Entorno 7 completado con la observación manual del alumno (evidencia E-01). [Archivada](historico/03-inventario-campus_v0.2.md) |
| 0.3 | 2026-10-30 | Claude (Analista) | Corrección a raíz de una pregunta del alumno: en el entorno 4, «Index» es una deducción a partir de la dirección y del nombre del archivo del logotipo, no un nombre de marca observado. [Archivada](historico/03-inventario-campus_v0.3.md) |
| 0.4 | 2026-10-30 | Claude (Analista) | Logotipos de los entornos 4, 8, 10, 11 y 12 verificados con capturas del alumno (E-06 a E-10): «Estudi@» en lugar de «Studia», «Sociedad Cooperativa» en el 10 e «Index Business Intelligent» confirmado como submarca de ATU. Nuevo hallazgo H-08 (idioma mezclado) |
