# 01 — Supuestos de partida

| Campo | Valor |
|---|---|
| Versión | 0.1 |
| Fecha | 2026-11-03 |
| Estado | Revisión del propietario |
| Redacción | Claude (rol Analista), a petición del alumno |
| Alumno | Carlos García Rallo |
| Tutor/a | *(en blanco)* |

La organización no ha respondido a las preguntas de la Fase 1. Para poder escribir requisitos, este documento fija **qué se da por supuesto**, en qué se basa, qué requisitos dependen de cada supuesto y qué cambiaría si resultara falso. Ningún supuesto está confirmado salvo que se indique. Cuando llegue una respuesta, se actualiza aquí y en la [matriz de trazabilidad](05-matriz-trazabilidad.md).

## 1. Supuestos

| ID | Supuesto | Base | Pregunta abierta | Requisitos afectados | Si resulta falso |
|---|---|---|---|---|---|
| SF-01 | El problema principal es **encontrar y llegar al campus correcto**, no gestionar contenidos ni cursos | Ficha 01 **[D]**; S-04; observaciones PR-01 a PR-04 y PR-08 **[O]** | P-N01, P-U04 | Todos los RF | Si la organización espera más (cursos, avisos), se añaden requisitos *Could* y se revisa la prioridad de RF-15 a RF-17 |
| SF-02 | **No hay una identidad común** para todos los campus | S-05; ningún campus muestra acceso con proveedores externos (H-06) **[O]** | P-I01, P-C03 | RF-15, RF-16 (*Could*) | Si existe, la personalización («mis campus») puede subir a *Should* |
| SF-03 | El catálogo puede ser **público**, sin inicio de sesión, porque solo muestra lo que ya es público en cada campus (nombre, marca y página de acceso) | PG-04 **[R]**; las páginas de acceso son públicas **[O]** | P-N03 | RF-01, RF-13, RNF-SEG-01 | Si debe ser privado, se añade un requisito de acceso restringido y la plataforma pasa a tratar datos personales (RS-03) |
| SF-04 | **Todos los campus pueden aparecer juntos.** Aun así, el catálogo debe poder ocultar uno sin borrarlo | Todos son de Grupo ATU **[D]**; relación de cada marca sin confirmar (P-V06) | P-O05 | RF-01, RF-07, RF-10 | Si alguna marca no debe aparecer con otras, se segmenta el catálogo (RS-07) |
| SF-05 | Una **persona de la organización** mantendrá el catálogo, sin necesidad de conocimientos de programación | PU-06 **[R]**; RS-01 | P-O04, P-R02 | RF-06 a RF-09, RNF-MAN-01, RNF-MAN-04 | Sin responsable, ninguna opción es sostenible (RS-01, RS-09). Se trasladaría a la conclusión de viabilidad |
| SF-06 | Los campus **cambian pocas veces** (altas, bajas o cambios de dirección: pocos al año) | Doce campus estables en la observación **[O]**; frecuencia desconocida | P-C06 | RF-09, RF-11, RNF-MAN-06 | Si cambian a menudo, la gestión del catálogo debe ser más ágil y la comprobación de enlaces más frecuente |
| SF-07 | El **español** es el idioma principal. El entorno 4 está en inglés y se describe en español en el catálogo | Público hispanohablante **[S]**; H-02, H-08 **[O]** | P-U08 | RNF-UX-06 | Si se pide inglés u otro idioma, se añade un requisito de interfaz multilingüe |
| SF-08 | Una parte importante del alumnado entra **desde el móvil** | Formación para el empleo y online **[S]** | P-U06 | RNF-UX-02, RNF-REN-01 | Si casi todos entran desde ordenador, la prioridad de la adaptación móvil no cambia (lo exige la ficha), pero sí las pruebas |
| SF-09 | **Carga baja**: como referencia, unos cientos de visitas al día con picos al inicio de cada convocatoria | Doce campus de un grupo de formación **[S]**; sin datos de uso (P-U02) | P-U02 | RNF-REN-03 | Si la carga es muy superior, se revisan RNF-REN-03 y la elección de alojamiento en la Fase 3 |
| SF-10 | La primera versión **no se integra con Moodle** (ni API ni cambios en los campus) | Indicio de Moodle 4.1 sin soporte (H-04, RS-06); alcance preliminar **[R]** | P-C01, P-C04 | RF-17 (*Could*), W-01 | Si los campus están actualizados y hay API, RF-17 puede valorarse en la Fase 3 |
| SF-11 | La **clasificación útil** para buscar es la marca y, si se confirma su relación con los campus, el área formativa de la web | Logotipos **[O]**; 9 áreas de la web corporativa (E-04) **[O]**; relación sin confirmar (PR-08) | P-N04, P-V09 | RF-03, RF-10 | Si no hay relación entre áreas y campus, RF-10 filtra solo por marca |
| SF-12 | El **contacto común del CAU** (correo y teléfono que ya muestran los campus) puede mostrarse en la plataforma | Publicado en los campus **[O]** | — | RF-05, RF-12 | Si no, se muestra el canal que indique la organización |
| SF-13 | **WCAG 2.2 AA** es la referencia de accesibilidad, sin afirmar obligación legal concreta | Prompt inicial **[D]**; PG-06 | P-L04, P-V10 | RNF-UX-01 | Si existe una obligación legal o una declaración corporativa, se ajusta el requisito a ella |
| SF-14 | La plataforma **no usa cookies ni analítica** que exijan consentimiento en la primera versión | Minimización (RS-03) **[R]** | P-L02 | RNF-SEG-05, RF-18 (*Could*) | Si se quiere analítica, debe seguir la política corporativa y pasar por RF-18 |

## 2. Qué no se supone

Para no ocultar supuestos (indicador de la ficha: «necesidades verificadas y no suposiciones ocultas»), se deja constancia de lo que **no** se da por hecho:

- Que el problema afecte a muchos usuarios. Sigue sin medirse (PR-07). Los requisitos se escriben para poder comprobarlo en la Fase 7 (RNF-UX-03, CP-UX-01).
- Que todos los campus tengan la misma versión, configuración o responsable (límite de la ficha).
- Que el inicio de sesión único sea necesario (P-N02).

## 3. Control de versiones

| Versión | Fecha | Autor | Cambios |
|---|---|---|---|
| 0.1 | 2026-11-03 | Claude (Analista) | Primera versión: 14 supuestos de partida |
