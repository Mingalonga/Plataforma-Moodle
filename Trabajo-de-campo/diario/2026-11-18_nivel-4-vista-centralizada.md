# Diario · 18 de noviembre de 2026 · Nivel 4: primera vista centralizada

- **Horario:** 17:26 a 18:08 (después del nivel 3 en el aula 2).
- **Objetivo:** un programa propio que pregunte a las dos aulas por la API, junte a las personas por correo y diga qué cuentas llevan más de 90 días sin entrar, están suspendidas o nunca se han usado.
- **Resultado:** conseguido. Con una sola orden sale la lista de las **15 personas distintas** de las dos aulas (4 están en las dos) y las cuentas para revisar (TC-22).

## Qué he hecho

1. **Comprobar que se pueden pedir todos los usuarios de un aula de una vez**: `core_user_get_users` buscando por correo con el comodín `%` (en la URL, `%25`). Devuelve las 15 cuentas del aula 1, incluidas 3 técnicas (`guest`, `admin`, `ws_lectura`) que hay que ignorar.
2. **Primera versión del programa** en un solo archivo, que listaba los usuarios de cada aula. Funcionó (12 y 7 usuarios).
3. Antes de seguir decidí que el código tenía que ser **modular, escalable y muy seguro**, y lo rehicimos en piezas:

| Archivo | Trabajo |
|---|---|
| `aulas.json` | La lista de aulas y los ajustes. Son datos, no código |
| `moodle_api.py` | Lo único que habla con Moodle |
| `informe.py` | Juntar por correo y clasificar cuentas. No usa la red |
| `centralizar.py` | El programa principal |

4. **Juntar por correo y clasificar** cada cuenta: suspendida, nunca ha entrado, inactiva (más de 90 días) o activa.

El código y sus medidas de seguridad están en [`laboratorio/herramienta/`](../laboratorio/herramienta/) (en su día, `scripts/nivel4/`).

## Cómo cumple las tres características

- **Modular:** cada archivo tiene un trabajo. La web del nivel 5 podrá reutilizar `moodle_api.py` e `informe.py` sin cambios.
- **Escalable:** añadir un aula es añadir una línea en `aulas.json`. Si un aula falla, el resto sigue y el informe avisa de que está **INCOMPLETO**. El límite de días también está en la configuración.
- **Seguro:** token fuera del código y con permisos `600` obligatorios, envío por POST, solo HTTPS (salvo `localhost`), lista blanca de funciones de lectura, solo 5 campos por usuario y sin librerías externas. Es seguridad de laboratorio; en producción faltaría guardar los tokens cifrados o en un gestor de secretos.

## Resultado

Los datos coinciden con la consulta SQL del día 16, ahora obtenidos por la API y sin tocar la base de datos:

- **Inactivas:** Bruno (121 días), David (201) y Lucía (401). Fernando, con 61 días, queda por debajo del límite.
- **Suspendida:** Marcos en el aula 1.
- **Nunca han entrado:** Nuria y Sergio en el aula 1, y todas las cuentas del aula 2 (nadie ha iniciado sesión allí todavía).

Lo que **solo se ve con la vista centralizada**:
- Carmen es `carmen.ruiz` en el aula 1 y `cruiz` en el aula 2, y el programa la reconoce como una sola persona por el correo.
- Marcos está **suspendido en el aula 1 pero no en el aula 2**. Mirando cada aula por separado nadie lo notaría. Puede ser correcto o un descuido, y ahora alguien lo puede decidir.

## Problemas y dudas

| Qué pasó | Causa | Solución |
|---|---|---|
| `Expecting value` en la primera prueba | El aula 1 estaba parada | Arrancarla en una terminal nueva (la otra tenía las variables del aula 2) |
| Se cerró Firefox con todas las pestañas | Lo había abierto desde una terminal y al intentar separarlo (`disown`) se cerró | **Ctrl+Shift+N** reabrió la ventana. Abrir Firefox desde el menú, no desde la terminal |
| La terminal pinta mal los pegados largos | Es solo la visualización | El archivo queda bien; se comprueba ejecutándolo |

Dudas para el estudio:
- "Nunca ha entrado" mezcla cuentas olvidadas con alumnos recién matriculados. Haría falta un margen (por ejemplo, ignorar cuentas creadas hace menos de 30 días), pero `core_user_get_users` no devuelve la fecha de creación. Hay que buscar otra función o aceptar ese ruido.
- Si en un aula se permiten varias cuentas con el mismo correo, el programa las agrupa juntas. Habría que avisar de ese caso.

## Qué he aprendido

- Python se parece a PHP: `def` es `function`, un diccionario es un array asociativo, `json.loads` es `json_decode` y `try/except` es `try/catch`. Los bloques se marcan con sangría en vez de llaves.
- La diferencia entre los datos que escribe una persona (qué aulas hay, en `aulas.json`) y los que se piden en el momento (quién hay dentro, por la API).
- Separar la lógica (`informe.py`) de la red (`moodle_api.py`) permite probarla sin aulas encendidas.
- Un informe que calla que le falta un aula es peligroso: avisar de que está incompleto también es seguridad.

## Evidencias

- TC-22 en [`capturas/`](../capturas/): salida del programa con las dos aulas.
- Código en [`laboratorio/herramienta/`](../laboratorio/herramienta/) (en su día, `scripts/nivel4/`).

## Ayuda de la IA en esta sesión

Claude escribió el código siguiendo las tres características que le pedí, me lo explicó parte por parte (comparándolo con PHP) y lo probó antes contra un Moodle simulado. Yo creé los archivos, los ejecuté contra las dos aulas y revisé el resultado. Este borrador lo ha redactado Claude a partir de la sesión y yo lo he revisado.

## Siguiente paso

Nivel 5: una pequeña web con inicio de sesión que muestre esta misma vista centralizada, reutilizando `moodle_api.py` e `informe.py`.
