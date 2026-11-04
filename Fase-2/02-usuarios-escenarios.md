# 02 — Usuarios y escenarios de uso

| Campo | Valor |
|---|---|
| Versión | 0.2 |
| Fecha | 2026-11-04 |
| Estado | Revisión del propietario |
| Redacción | Claude (roles Analista y UX), a petición del alumno |
| Alumno | Carlos García Rallo |
| Tutor/a | *(en blanco)* |

> **v0.2.** Con el enfoque de gestión interna (DT-01 a DT-06), los usuarios son el personal que gestiona las aulas y los escenarios describen su trabajo. Los escenarios de la v0.1, centrados en el alumnado, están en el [histórico](historico/02-usuarios-escenarios_v0.1.md).

## 1. Usuarios

Se usan los perfiles de la Fase 1 en su versión 0.4 ([documento 04](../Fase-1/04-mapa-actores-perfiles.md#4-perfiles-de-usuario-hipótesis)). Siguen siendo **hipótesis**: ninguno se ha validado con personas reales (P-G01).

| Perfil | Quién | Qué necesita de la plataforma | Tipo |
|---|---|---|---|
| PU-08 | Gestor/a de e-learning (DPE) | Llegar a la gestión de cualquier aula desde un único punto y, si es viable, consultar información de varias aulas sin entrar en ellas | **Principal** |
| PU-09 | Técnico/a de Informática | Instalar y mantener la plataforma, dar y quitar permisos, conocer el estado técnico de las aulas | **Principal (técnico)** |
| PU-10 | Responsable del DPE | Vista de conjunto de las aulas y, si se aprueba, indicadores | Principal |
| PU-05 | Agente del CAU / tutoría virtual | Consultar en qué aula está un curso y su estado | Secundario (solo consulta) |

**Fuera del enfoque:** el alumnado, el profesorado y las empresas (PU-01 a PU-04) no usan la plataforma, porque reciben la URL de su curso (DT-03).

**Necesidades de acceso.** La ficha pide tener en cuenta «distintas capacidades» para cualquier persona usuaria. Aunque la herramienta sea interna, se asume que alguien del personal puede usar lector de pantalla, solo teclado o ampliación (ES-12).

## 2. Escenarios de uso

Cada escenario describe una situación concreta, sin decidir pantallas ni tecnología. Los nombres son inventados y no corresponden a personas reales. Las tareas de gestión que aparecen son las habituales en Moodle (SF-02); se confirmarán con el DPE (P-G01).

### ES-01. Empezar la jornada con una vista de conjunto

- **Perfil:** PU-08, PU-10 · **Necesidades:** N-12 · **Base:** [S]
- **Contexto:** Ana, del DPE, empieza el día y quiere saber si todas las aulas funcionan y si alguna está en mantenimiento.
- **Pasos:** se identifica en la plataforma → ve la lista de las doce aulas con su estado, su responsable y la fecha de la última revisión.
- **Resultado esperado:** sabe en segundos qué aulas están operativas, sin abrir ninguna.

### ES-02. Ir directamente a la gestión de cursos de un aula

- **Perfil:** PU-08 · **Necesidades:** N-11 · **Problemas:** PR-09 · **Base:** DT-01 [D]
- **Contexto:** Ana tiene que crear un curso en el aula de Tierra Más Ecológica. Hoy tendría que buscar la dirección, entrar y navegar hasta el menú de cursos.
- **Pasos:** en la plataforma, busca «tierra» → elige el acceso «Gestión de cursos» de esa aula → llega a la página de gestión de cursos del aula (si no tiene la sesión abierta en esa aula, el aula le pide identificarse).
- **Resultado esperado:** llega a la página de gestión correcta en pocas acciones, sabiendo en todo momento en qué aula está.

### ES-03. Matricular a un grupo en un aula

- **Perfil:** PU-08 · **Necesidades:** N-11 · **Base:** [S]
- **Contexto:** una empresa ha contratado un curso y hay que matricular a 15 trabajadores.
- **Pasos:** en la plataforma, elige el aula → acceso «Matriculaciones» o «Usuarios» → realiza la matrícula **en el aula**, como hasta ahora.
- **Resultado esperado:** ahorra la búsqueda y la navegación. Hacer la matrícula desde la propia plataforma, sin entrar en el aula, queda como futuro (RF-15).

### ES-04. No confundir dos aulas con el mismo título

- **Perfil:** PU-08 · **Necesidades:** N-03 · **Problemas:** PR-03 · **Base:** H-01 [O]
- **Contexto:** cinco aulas se llaman «AULA VIRTUAL CENTRE LEARNING». Luis va a cambiar la configuración de un curso y no quiere hacerlo en el aula equivocada.
- **Pasos:** en la plataforma cada aula tiene un nombre propio, su marca y su dominio → al usar un acceso directo, la plataforma indica a qué aula y a qué dominio lleva.
- **Resultado esperado:** Luis sabe siempre en qué aula está actuando (RS-11).

### ES-05. Saber en qué aula está un curso

- **Perfil:** PU-08, PU-05 · **Necesidades:** N-13, N-05 · **Base:** [S]
- **Contexto:** llaman al CAU preguntando por el curso «Prevención de riesgos laborales básico», pero no saben en qué aula está.
- **Pasos:** busca el nombre del curso en la plataforma → ve en qué aula o aulas aparece → abre su página de gestión.
- **Resultado esperado:** lo encuentra sin entrar en las doce aulas una por una.
- **Nota:** depende de los servicios web (RF-12, *Should*, SF-06).

### ES-06. Preparar un resumen de varias aulas

- **Perfil:** PU-10 · **Necesidades:** N-13 · **Base:** [S]
- **Contexto:** la responsable del DPE quiere saber cuántos cursos activos y cuántas matrículas hay en cada aula este mes.
- **Pasos:** consulta en la plataforma los datos agregados de cada aula, con la fecha de su última actualización.
- **Resultado esperado:** tiene el resumen sin entrar en cada aula ni pedirlo a varias personas.
- **Nota:** depende de los servicios web (RF-11, *Should*). No muestra datos de personas concretas (SF-12).

### ES-07. Dar de alta un aula nueva en la plataforma

- **Perfil:** PU-08, PU-09 · **Necesidades:** N-06, N-15 · **Base:** DT-04, DT-05 [D]
- **Contexto:** Informática pone en marcha una nueva aula para una marca.
- **Pasos:** Informática avisa al DPE con los datos técnicos → el DPE añade el aula con los datos obligatorios y sus accesos directos → la plataforma comprueba que las direcciones pertenecen a un dominio permitido → el cambio queda registrado.
- **Resultado esperado:** el alta se hace en pocos minutos, sin programar y sin tocar el aula.

### ES-08. Cambiar, poner en mantenimiento o retirar un aula

- **Perfil:** PU-08, PU-09 · **Necesidades:** N-06, N-10 · **Base:** [R]
- **Contexto:** un aula cambia de dirección, entra en mantenimiento o se cierra.
- **Pasos:** se actualiza la dirección, se marca el estado o se oculta → el cambio queda registrado con fecha y autor.
- **Resultado esperado:** todo el personal ve la información correcta; un aula retirada no se borra, se oculta.

### ES-09. Detectar un aula que no responde

- **Perfil:** PU-09 · **Necesidades:** N-10 · **Base:** [R]
- **Contexto:** un aula deja de responder un domingo.
- **Pasos:** la comprobación periódica detecta que no responde → avisa a Informática → Informática la revisa y la marca en mantenimiento.
- **Resultado esperado:** el DPE lo sabe antes de intentar trabajar en ella.

### ES-10. Revisar el estado técnico de las aulas

- **Perfil:** PU-09 · **Necesidades:** N-12 · **Problemas:** PR-10 · **Base:** H-04 [S]
- **Contexto:** Informática quiere saber qué aulas siguen en una versión de Moodle sin soporte.
- **Pasos:** consulta en la plataforma la versión y el estado técnico de cada aula.
- **Resultado esperado:** tiene la lista para planificar actualizaciones (RF-13).

### ES-11. Dar acceso a una persona nueva y retirarlo cuando se va

- **Perfil:** PU-09 · **Necesidades:** N-14, N-15 · **Base:** [R]
- **Contexto:** se incorpora una persona al DPE y otra deja el departamento.
- **Pasos:** Informática da de alta a la nueva persona con el rol que le corresponde → retira el acceso a la que se va → los dos cambios quedan registrados.
- **Resultado esperado:** solo el personal autorizado entra en la plataforma, y cada persona ve y hace solo lo que le corresponde.

### ES-12. Usar la plataforma con lector de pantalla o solo con teclado

- **Perfil:** cualquiera · **Necesidades:** N-08 · **Base:** Ficha 01, «Experiencia de uso» [D]
- **Contexto:** Pedro, del DPE, tiene baja visión y usa un lector de pantalla.
- **Pasos:** recorre la plataforma con el teclado → el lector anuncia el buscador, el número de resultados, el nombre de cada aula y a qué lleva cada acceso.
- **Resultado esperado:** completa ES-02 en las mismas condiciones que cualquier otra persona.

### ES-13. La plataforma no está disponible

- **Perfil:** todos · **Necesidades:** N-10 · **Base:** Ficha 01, «Continuidad» [D]
- **Contexto:** la plataforma cae o se está actualizando.
- **Pasos:** el personal entra en las aulas por su dirección directa, como hasta ahora (la guía incluye la lista de direcciones) → Informática restaura el servicio con el procedimiento documentado.
- **Resultado esperado:** la caída **no impide** gestionar ninguna aula y el servicio se recupera en el plazo fijado (RNF-REN-06).

## 3. Escenarios descartados en esta fase

| Escenario | Motivo | Dónde queda |
|---|---|---|
| Un alumno busca su aula en la plataforma | El alumnado entra con la URL de su curso (DT-03) | W-04, *Won't* |
| Entrar una sola vez y acceder a la gestión de todas las aulas (inicio de sesión único) | Requiere un directorio común y cambios en la autenticación de cada aula (SF-04, SF-05) | RF-16, *Could* |
| Crear un curso o matricular desde la plataforma, sin entrar en el aula | Requiere permisos de escritura en las aulas; más riesgo (RS-10, RS-11) | RF-15, *Could* |
| Buscar a una persona en todas las aulas | Trata datos personales del alumnado; necesita una finalidad y base legal (RS-03) | RF-17, *Could* |

## 4. Control de versiones

| Versión | Fecha | Autor | Cambios |
|---|---|---|---|
| 0.1 | 2026-11-03 | Claude (Analista / UX) | Primera versión: 13 escenarios y 3 descartados. [Archivada](historico/02-usuarios-escenarios_v0.1.md) |
| 0.2 | 2026-11-04 | Claude (Analista / UX) | Enfoque de gestión interna: perfiles PU-08, PU-09, PU-10 y PU-05; 13 escenarios nuevos y 4 descartados |
