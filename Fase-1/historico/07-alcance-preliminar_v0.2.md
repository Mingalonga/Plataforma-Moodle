# 07 — Alcance preliminar

| Campo | Valor |
|---|---|
| Versión | 0.2 |
| Fecha | 2026-10-30 |
| Estado | Revisión del propietario |
| Alumno | Carlos García Rallo |
| Tutor/a | *(en blanco)* |
| Redacción | Claude (roles Coordinador, Arquitecto y UX), a petición del alumno |

> Este documento es el **hito de la Fase 1** según la ficha: «alcance preliminar validado». Es una **hipótesis** para que el tutor la valide. No elige tecnología, arquitectura ni diseño; eso corresponde a las Fases 3 y 4.

## 1. Problema que se propone abordar

Las personas usuarias de los entornos Moodle de la organización no disponen de un punto común donde identificar qué campus les corresponde y llegar a él con seguridad. Hay al menos doce campus en once dominios distintos, varios no se distinguen por su título, no son localizables en buscadores y ni siquiera la web corporativa enlaza a ellos (necesidades N-01 a N-03, problemas PR-01 a PR-04 y PR-08).

**Condición:** el tamaño real del problema no está demostrado (PR-07). El alcance se propone para poder validar esa hipótesis, no da por hecho que exista.

## 2. Objetivo preliminar

Estudiar y, si resulta viable, demostrar una forma de que cualquier usuario identifique su campus y llegue a su página de acceso de forma clara, segura, accesible y fácil de mantener, sin modificar los campus existentes.

## 3. Alcance propuesto por prioridad (MoSCoW)

Método: **MoSCoW** (*Must, Should, Could, Won't*), porque permite separar con claridad lo imprescindible, lo conveniente y lo futuro, como pide la ficha. Prioridades provisionales: se fijarán con criterios de aceptación en la Fase 2.

### Imprescindible (Must) — hipótesis de MVP

| ID | Capacidad | Necesidad |
|---|---|---|
| AL-01 | Catálogo de los campus con nombre comprensible, marca o área, descripción breve y URL | N-01, N-03 |
| AL-02 | Búsqueda por texto (nombre de marca, área o palabras clave) | N-01, N-02 |
| AL-03 | Acceso directo a la página de acceso del campus, indicando claramente que se sale a otro sitio | N-02, N-03 |
| AL-04 | Diseño adaptable a móvil y accesible (WCAG 2.2 AA como referencia) | N-08 |
| AL-05 | Procedimiento para dar de alta, modificar y retirar campus, con responsable y fecha de última revisión | N-06 |
| AL-06 | Ningún dato personal ni credencial de los campus | N-07 |

### Conveniente (Should)

| ID | Capacidad | Necesidad |
|---|---|---|
| AL-07 | Filtros por marca, temática o ubicación, solo si la organización confirma que son útiles y los mantiene (P-N04). Candidata: las 9 áreas formativas que ya usa la web corporativa, si se confirma su relación con los campus (P-V09) | N-01 |
| AL-08 | Comprobación periódica y no abusiva de que los enlaces responden | N-06, N-10 |
| AL-09 | Página de ayuda con el canal del CAU | N-05 |
| AL-10 | Vista para el CAU con estado y contacto de escalado de cada campus | N-05 |

### Futuro (Could) — solo si se confirma necesidad, viabilidad y permisos

| ID | Capacidad | Condición previa |
|---|---|---|
| AL-11 | Personalización («mis campus») | Fuente de identidad común (P-I01) |
| AL-12 | Inicio de sesión único entre campus | Necesidad confirmada (P-N02), identidad común, colaboración de administradores, Moodle con soporte |
| AL-13 | Consulta de cursos o datos de los campus mediante la API de Moodle | Servicios web habilitados (P-C04) y versión confirmada (P-C01) |
| AL-14 | Analítica mínima de uso | Finalidad legítima definida y respetuosa con la privacidad (P-L02) |

### Fuera del alcance (Won't) en este proyecto

- Modificar, actualizar o configurar los campus Moodle existentes.
- Unificar los campus en un único Moodle.
- Gestionar matrículas, usuarios o contenidos de los cursos.
- Pedir, guardar o reenviar contraseñas de los campus.

## 4. Alternativas que deberá comparar la Fase 3

Para no prejuzgar la solución, se dejan anotadas, sin evaluar, las opciones que la Fase 3 debe comparar con criterios y pesos definidos antes de puntuar:

1. No desarrollar nada y mejorar lo existente (títulos, indexación, comunicación al alumnado).
2. Página o catálogo estático de enlaces, de bajo mantenimiento.
3. Aplicación web con gestión del catálogo.
4. Usar la web corporativa (hoy sin acceso a los campus) o una herramienta ya contratada (P-R03).
5. Integración con servicios web de Moodle.
6. Autenticación federada o inicio de sesión único.
7. Solución por etapas que combine las anteriores.

## 5. Supuestos y condiciones del alcance

- Se asume que no existe identidad común (S-05). Si existiera, AL-11 podría subir de prioridad.
- Se asume que la organización designará una persona para mantener el catálogo (P-O04). Sin ella, el riesgo RS-01 hace inviable cualquier opción.
- La relación entre marcas (P-O05, P-V06) puede obligar a segmentar el catálogo.

## 6. Cómo se comprobará (propuesta para la Fase 2)

Indicadores provisionales (ver PG-10 en el registro de preguntas): proporción de usuarios de prueba que encuentran su campus sin ayuda, tiempo hasta la página de acceso correcta, errores de elección, enlaces válidos en el catálogo y resultado de la revisión de accesibilidad.

## 7. Decisión que se pide al tutor

1. ¿Valida el problema y el objetivo preliminar, sabiendo que el tamaño del problema no está demostrado?
2. ¿Está de acuerdo con el MVP hipotético (AL-01 a AL-06) y con dejar SSO e integraciones como futuro?
3. ¿Puede facilitar datos agregados del CAU o un contacto en la organización para reducir el riesgo RP-01?

## 8. Control de versiones

| Versión | Fecha | Autor | Cambios |
|---|---|---|---|
| 0.1 | 2026-10-30 | Claude (Coordinador / Arquitecto / UX) | Primera versión del alcance preliminar. [Archivada](historico/07-alcance-preliminar_v0.1.md) |
| 0.2 | 2026-10-30 | Claude (Coordinador) | Web corporativa sin enlaces a campus (PR-08) y áreas formativas como posible clasificación |
