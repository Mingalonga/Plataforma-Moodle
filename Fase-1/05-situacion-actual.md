# 05 — Situación actual, necesidades y problemas

| Campo | Valor |
|---|---|
| Versión | 0.1 |
| Fecha | 2026-10-30 |
| Estado | Revisión del propietario |
| Alumno | Carlos García Rallo |
| Tutor/a | *(en blanco)* |
| Redacción | Claude (rol Analista), a petición del alumno |

Etiquetas: **[O]** observado · **[D]** dato de la organización o del alumno · **[S]** supuesto · **[R]** recomendación.

## 1. Situación actual (lo que se puede describir hoy)

1. Hay al menos doce entornos Moodle en doce direcciones distintas, repartidas en once dominios diferentes (dos son subdominios de grupoatu.com) **[D]**.
2. Los once observados se presentan como servicio de Grupo ATU: mismo soporte, mismo bloque corporativo y mismo responsable del tratamiento **[O]**.
3. Cada campus tiene su propia página de acceso con usuario y contraseña. No se ve ningún acceso común **[O]**.
4. No se ha encontrado ninguna página pública que liste todos los campus. Los campus enlazan a la web corporativa (grupoatu.com), pero no a los otros campus **[O]**. La web corporativa se consultó el 2026-10-30, pero su contenido se genera con JavaScript y la herramienta de lectura solo obtuvo la cabecera: título «GRUPO ATU — Enfoca tu futuro» y la descripción «Descubre las 9 áreas formativas de Grupo ATU» **[O]**. No se pudo ver si enlaza a los campus; queda para revisión manual en navegador (P-V07).
5. Las páginas de acceso piden a los buscadores que no las indexen (`noindex`) **[O]**. Un usuario que busque «aula virtual + marca» probablemente no llegue a su campus desde un buscador **[S]**.
6. Cinco campus con marcas distintas comparten el mismo título; uno está en inglés y con textos de plantilla sin completar **[O]** (inventario, H-01 y H-02).
7. Hay indicios de que los campus usan una versión de Moodle sin soporte de seguridad **[S]** (inventario, H-04).
8. La ayuda se centraliza en un CAU común y en documentos de SharePoint **[O]**.

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

## 3. Problemas detectados

| ID | Problema | Evidencia | Necesidad afectada | Estado |
|---|---|---|---|---|
| PR-01 | No hay un punto público que reúna todos los campus | No encontrado en las páginas de los campus **[O]**; la web corporativa no se pudo leer completa (P-V07) | N-01, N-02, N-05 | Indicio |
| PR-02 | Los campus no son localizables desde buscadores | `robots: noindex` en todas las páginas observadas **[O]** | N-02 | Observado. Puede ser intencionado (P-V08) |
| PR-03 | Cinco campus no se distinguen por el título | H-01 **[O]** | N-03 | Observado |
| PR-04 | Configuración incoherente entre campus (idioma, plantilla, ayuda) | H-02, H-03 **[O]** | N-03, N-08 | Observado |
| PR-05 | Cuentas separadas por campus | H-06 **[O]** + supuesto sobre usuarios de varios campus **[S]** | N-04 | Indicio |
| PR-06 | Posible versión de Moodle sin soporte de seguridad | H-04 **[S]** | N-07, N-10 | Indicio. Fuera del alcance del proyecto resolverlo; sí condiciona integraciones |
| PR-07 | No sabemos cuántos usuarios sufren realmente el problema de localización | Sin datos de soporte ni de uso | Todas | Laguna de información (P-U04) |

> PR-07 es el problema más importante para el proyecto: **sin datos del CAU o de los usuarios no se puede demostrar que el problema principal existe ni medir su tamaño.** El diagnóstico debe decirlo así y no darlo por supuesto.

## 4. Lo que no es un problema del proyecto

Para no confundir el problema con una solución (ficha, comprobación final):

- Que cada campus tenga su propio Moodle no es en sí un problema: puede ser una decisión correcta de negocio.
- La falta de inicio de sesión único es una **posible** necesidad (N-04), no un problema confirmado.
- Actualizar Moodle en los campus queda fuera del encargo; el proyecto solo lo registra como riesgo y condicionante.

## 5. Guion de entrevista (preparado para cuando haya contacto)

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
| 0.1 | 2026-10-30 | Claude (Analista) | Primera versión: situación actual, 10 necesidades, 7 problemas, límites del problema y guion de entrevista |
