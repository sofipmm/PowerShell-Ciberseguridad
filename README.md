# PowerShell-Ciberseguridad
¿Qué contiene?
El script contiene una función llamada Validar-Archivo que permite verificar si un archivo existe en una ruta específica. Además, genera un reporte con la fecha y hora en que se realizó la validación, indicando si el archivo fue encontrado o no.

¿Qué scripts se incluyen?
Se incluye el script Evidencia10_validar_archivos.ps1.

¿Qué tareas de ciberseguridad resuelve?
Disponibilidad de archivos críticos: Permite comprobar si archivos importantes (como respaldos, configuraciones o logs) existen y son accesibles.
Integridad básica: Aunque no valida hashes, ayuda a garantizar que los archivos no se hayan perdido o movido.
Trazabilidad: Al generar un reporte con fecha, deja evidencia de la validación realizada.

¿Qué aprendiste al desarrollarlo?
El uso de funciones en PowerShell para modularizar tareas.
Manejo de errores con Try/Catch/Finally para mejorar la robustez.
La importancia de automatizar validaciones de archivos en sistemas críticos.
Cómo generar reportes fechados que sirven como evidencia de auditoría.
