# 03 — Inventario de los doce entornos Moodle

| Campo | Valor |
|---|---|
| Versión | 0.1 |
| Fecha de observación | 2026-10-30 |
| Estado | Revisión del propietario |
| Alumno | Carlos García Rallo |
| Tutor/a | *(en blanco)* |
| Redacción | Claude (roles Analista y Especialista Moodle), a petición del alumno |
| Método | Observación pasiva de la página pública de acceso, una petición por URL. Ver [02 — Fuentes y metodología](02-fuentes-y-metodologia.md). |

Estados: **V** = verificado (leído literalmente en la página) · **I** = indicio (deducido) · **P** = pendiente de confirmar.

> Recordatorio: «verificado» significa que la página pública lo muestra en la fecha de consulta. No confirma quién es realmente el responsable, ni cómo está montado el servicio por dentro.

---

## 1. Matriz resumen

| N.º | URL facilitada | Título de la página | Marca aparente (logotipo) | Carga | Idioma por defecto | Tema | Versión (indicio) | Estado global |
|---|---|---|---|---|---|---|---|---|
| 1 | https://aulavirtualatu.com/ | Entrar al sitio \| Campus Virtual - ATU | Grupo ATU (logo «Eguru») | Sí (200) | Español | eguru | 4.1.19 | V con indicios |
| 2 | https://aulavirtual.centrelearning.net | AULA VIRTUAL CENTRE LEARNING | Centre Learning | Sí (200) | Español | enlight | 4.1.2+ | V con indicios |
| 3 | https://aulavirtual.atuasesoria.com | AULA VIRTUAL ATU ASESORÍA DE FORMACIÓN | ATU (logo «ATU-DOS») | Sí (200) | Español | enlight | 4.1.2+ | V con indicios |
| 4 | https://aulavirtualindex.grupoatu.com/ | AULA VIRTUAL ATU | Index Business Intelligent | Sí (200) | **Inglés** | enlight | 4.1.2+ | V con indicios · anomalías |
| 5 | https://aulavirtual.takin.es/login/index.php | AULA VIRTUAL TAKIN | Takin | Sí (200) | Español | enlight | 4.1.2+ | V con indicios |
| 6 | https://aulavirtual.clubaventuraatu.com | AULA VIRTUAL CLUB AVENTURA ATU | Club Aventura | Sí (200) | Español | enlight | 4.1.2+ | V con indicios |
| 7 | https://aulavirtual.atutecnologiadigital.com | — | — | **No observado** | — | — | — | P |
| 8 | https://aulavirtualalmeria.grupoatu.com/login/index.php | **AULA VIRTUAL CENTRE LEARNING** | Almería Formación | Sí (200) | Español | enlight | 4.1.2+ | V con indicios · anomalía de título |
| 9 | https://aulavirtual.atuseguridadysalud.com/login/index.php | AULA VIRTUAL ATU SEGURIDAD Y SALUD | ATU Seguridad y Salud | Sí (200) | Español | enlight | 4.1.2+ | V con indicios |
| 10 | https://aulas.tierramasecologica.com/login/index.php | **AULA VIRTUAL CENTRE LEARNING** | Tierra más ecológica | Sí (200) | Español | enlight | 4.1.2+ | V con indicios · anomalía de título |
| 11 | https://aulavirtual.moveout.es/login/index.php | **AULA VIRTUAL CENTRE LEARNING** | MoveOut | Sí (200) | Español | enlight | 4.1.2+ | V con indicios · anomalía de título |
| 12 | https://aulavirtual.estudia-fp.com/login/index.php | **AULA VIRTUAL CENTRE LEARNING** | Studia (logo «studia») | Sí (200) | Español | enlight | 4.1.2+ | V con indicios · anomalía de título |

En negrita, lo que llama la atención y se explica en la sección 3.

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

Los entornos 2, 8, 10, 11 y 12 tienen el mismo título de página y el mismo texto alternativo del logotipo, aunque cada uno muestra un logotipo distinto (Centre Learning, Almería Formación, Tierra más ecológica, MoveOut, Studia). Los entornos 2 y 8 usan además la misma imagen de fondo.

- **Por qué importa:** el título es lo que aparece en la pestaña del navegador, en marcadores, en el historial y lo que lee un lector de pantalla. Un usuario que tenga abiertos o guardados dos de estos campus no puede distinguirlos por el título. Es una **evidencia observada** a favor del problema que plantea la ficha (localizar el espacio correcto), aunque no prueba que los usuarios se confundan en la práctica.
- **Indicio [I]:** parece que los entornos se crearon a partir de una misma plantilla (posiblemente una copia del entorno 2) y solo se cambió el logotipo.
- **Pregunta:** P-V02.

### H-02. El entorno 4 está en inglés y con texto de plantilla sin completar [V]

- Idioma por defecto inglés («Log in to the site», «Username», «Password»), cuando el resto está en español.
- Copyright «© 2017 - Your Company Name ®. All rights reserved.», que es el texto por defecto del tema.
- Es el único con **registro propio visible** («Create new account», que permite a cualquiera crearse una cuenta).
- No muestra canal de ayuda ni responsable del tratamiento.
- **Indicio [I]:** podría ser un entorno menos mantenido, en pruebas o con otra finalidad (el logotipo es «Index Business Intelligent»).
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

### H-05. El entorno 7 no se ha podido observar [V]

La herramienta de lectura web rechazó la URL porque el archivo `robots.txt` del sitio no permite la lectura automatizada. Por respeto a esa indicación no se ha insistido ni se ha probado otra vía.

- **Propuesta:** que el alumno abra la URL en su navegador, sin iniciar sesión, y anote los campos de la ficha (sección 4, entorno 7). Es observación pasiva igual que la del resto.
- **Pregunta:** P-V05.

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
| Marca aparente | Index Business Intelligent (logo) con título «AULA VIRTUAL ATU» | V |
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
| Resultado | No observado: el `robots.txt` del sitio no permite la lectura automatizada | V |
| Resto de campos | Pendientes de observación manual en navegador | P |
| Preguntas | P-V05 | — |

### Entorno 8 — aulavirtualalmeria.grupoatu.com

| Campo | Valor | Estado |
|---|---|---|
| Resultado | HTTP 200 | V |
| Nombre visible | «AULA VIRTUAL CENTRE LEARNING» | V |
| Marca aparente | Almería Formación (logo) | V |
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
| Marca aparente | Tierra más ecológica (logo) | V |
| Versión | Indicio de 4.1.2+ | I |
| Diferencial | Único subdominio «aulas.» en lugar de «aulavirtual.»; título de otra marca (H-01) | V |
| Incidencias | Ninguna visible | V |

### Entorno 11 — aulavirtual.moveout.es

| Campo | Valor | Estado |
|---|---|---|
| Resultado | HTTP 200 | V |
| Nombre visible | «AULA VIRTUAL CENTRE LEARNING» | V |
| Marca aparente | MoveOut (logo) | V |
| Versión | Indicio de 4.1.2+ | I |
| Diferencial | Título de otra marca (H-01) | V |
| Incidencias | Ninguna visible | V |

### Entorno 12 — aulavirtual.estudia-fp.com

| Campo | Valor | Estado |
|---|---|---|
| Resultado | HTTP 200 | V |
| Nombre visible | «AULA VIRTUAL CENTRE LEARNING» | V |
| Marca aparente | Studia (logo `logo-studia`), con dominio «estudia-fp» | V |
| Versión | Indicio de 4.1.2+ | I |
| Diferencial | Título de otra marca (H-01). El dominio sugiere formación profesional | V / I |
| Incidencias | Ninguna visible | V |

---

## 5. Lo que este inventario no puede responder

Queda pendiente de la organización (registro de preguntas): quién administra cada entorno, si son instalaciones independientes o comparten servidor, la versión real, el método de autenticación interno, cuántos usuarios tiene cada uno, qué cursos o colectivos atiende cada marca y si hay más entornos fuera de esta lista.

## 6. Control de versiones

| Versión | Fecha | Autor | Cambios |
|---|---|---|---|
| 0.1 | 2026-10-30 | Claude (Analista / Especialista Moodle) | Primera observación pasiva de los doce entornos: 11 observados, 1 bloqueado por `robots.txt` |
