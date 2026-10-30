# 02 — Fuentes y metodología de observación

| Campo | Valor |
|---|---|
| Versión | 0.2 |
| Fecha | 2026-10-30 |
| Estado | Revisión del propietario |
| Alumno | Carlos García Rallo |
| Tutor/a | *(en blanco)* |
| Redacción | Claude (roles Analista y Especialista Moodle), a petición del alumno |

## 1. Autorización

El alumno autorizó el 2026-10-30 trabajar **solo con información pública** y realizar la observación pasiva de los doce entornos (registro de preguntas, P-A04 y P-A05). No hay autorización del tutor todavía; no se ha hecho nada que la ficha reserve a esa autorización (credenciales, acceso a sistemas, datos reales o intervención sobre servicios).

## 2. Qué se ha hecho y qué no

**Se ha hecho**

- Una única petición HTTP de lectura por cada URL de la lista, a la página exacta facilitada, siguiendo solo las redirecciones automáticas del servidor.
- Lectura del texto visible de la página de acceso y de los nombres de las imágenes y metadatos que vienen en la misma página.

**No se ha hecho**

- No se ha iniciado sesión, ni enviado ningún formulario, ni probado usuarios o contraseñas.
- No se ha seguido ningún enlace interno (recuperar contraseña, registro, política de datos, etc.).
- No se han hecho escaneos, enumeración, descargas masivas ni pruebas de seguridad.
- No se ha insistido cuando un sitio ha rechazado la consulta automatizada (caso del entorno 7, ver inventario).
- No se ha registrado ningún dato personal. Los contactos que se anotan son canales de la organización publicados en la propia página (correo de soporte y teléfono gratuito), no de personas.

## 3. Herramientas

| Intento | Herramienta | Resultado |
|---|---|---|
| 1 | `curl` desde el entorno de trabajo en la nube | Bloqueado por la política de red del entorno (respuesta 403 del proxy de salida). No llegó a contactar con los campus. |
| 2 | Herramienta de lectura web de Claude (WebFetch), una petición por URL, respetando `robots.txt` | 11 de 12 páginas leídas. El entorno 7 rechazó la lectura por su `robots.txt`. |

Limitación: la herramienta de lectura convierte la página a texto. Permite ver títulos, textos, formularios, enlaces y nombres de imágenes, pero no la apariencia visual exacta (colores, disposición). Esa revisión visual queda pendiente (P-V01).

## 4. Criterio de clasificación de cada dato del inventario

| Estado | Cuándo se usa |
|---|---|
| **Verificado** | Se ha leído literalmente en la página pública en la fecha indicada. Ejemplo: el título de la página. Ojo: «verificado» significa que la página lo muestra, no que el dato sea cierto (por ejemplo, un nombre de responsable del tratamiento publicado no confirma que lo sea de todo el servicio). |
| **Indicio** | Se deduce de lo observado pero no se lee directamente. Ejemplo: deducir la versión de Moodle de un parámetro técnico, o que dos campus comparten plantilla porque tienen el mismo título. |
| **Pendiente de confirmar** | No se ha podido observar o solo puede confirmarlo la organización. Ejemplo: quién administra el campus. |

## 5. Esquema de la ficha de observación

Campos que se recogen de cada entorno, tal como pide el prompt inicial (sección 3):

1. N.º y URL facilitada
2. Fecha de consulta y resultado de la petición (código HTTP, redirecciones)
3. Nombre visible (título de la página y cabecera)
4. Entidad o marca aparente (logotipo, textos) — sin darla por confirmada
5. Estado de acceso público (¿se ve la página sin identificarse?)
6. Página de acceso: campos, recuperación de contraseña, registro propio, acceso de invitados, botones de inicio de sesión con terceros
7. Idioma por defecto e idiomas disponibles
8. Identidad visual observable (tema de Moodle, logotipo, imagen de fondo)
9. Ayuda y contacto publicados (canales de la organización)
10. Señales visibles de Moodle
11. Versión de Moodle, solo si se puede confirmar sin técnicas intrusivas
12. Responsable del tratamiento que se nombra en la página
13. Características diferenciales
14. Incidencias de disponibilidad o anomalías observadas
15. Preguntas para su responsable

## 6. Registro de fuentes

| ID | Fuente | Entidad | Fecha de consulta | Qué respalda |
|---|---|---|---|---|
| F-01 | *Ficha 01 — Plataforma centralizada para los entornos Moodle* (PDF facilitado) | Organización / tutor | 2026-10-30 | Fases, entregables, límites, evaluación, plantilla de seguimiento |
| F-02 | *Prompt inicial del proyecto Plataforma Moodle* (DOCX facilitado) | Alumno | 2026-10-30 | Lista de los doce entornos, reglas de rigor, roles |
| F-03 a F-14 | Página pública de acceso de cada entorno (URL en el inventario, F-03 = entorno 1 … F-14 = entorno 12) | Cada campus | 2026-10-30 | Todos los datos marcados como «verificado» en el inventario |
| F-15 | *Releases*, Moodle Developer Resources — https://moodledev.io/general/releases | Moodle HQ | 2026-10-30 | Tabla «Moodle 4.1 (LTS)»: 2022112802 = Moodle 4.1.2 (13-03-2023); 2022112819 = Moodle 4.1.19 (09-06-2025). «Bug fixes for general core bugs in 4.1.x ended 11 December 2023» y «Bug fixes for security issues in 4.1.x ended 8 December 2025». En la fecha de consulta, las versiones con soporte listadas son 4.5 (LTS), 5.1, 5.2 y 5.3 (LTS). |
| F-16 | Web corporativa de Grupo ATU — https://www.grupoatu.com/ | Grupo ATU | 2026-10-30 | Solo se obtuvo la cabecera (página generada con JavaScript): título y descripción «9 áreas formativas». No respalda nada sobre enlaces a campus (P-V07) |

## 7. Control de versiones

| Versión | Fecha | Autor | Cambios |
|---|---|---|---|
| 0.1 | 2026-10-30 | Claude (Analista) | Primera versión: autorización, método, herramientas, criterio de clasificación, esquema de ficha y fuentes. [Archivada](historico/02-fuentes-y-metodologia_v0.1.md) |
| 0.2 | 2026-10-30 | Claude (Analista) | Fuente F-16 (web corporativa) |
