# PowerShell-Ciberseguridad
Informe 1: Evidencia10_validar_archivos.ps1
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

Informe 2: auditoria_usuarios.ps1
¿Qué contiene?
El script contiene un proceso de auditoría de usuarios locales en un sistema Windows. Extrae información sobre si los usuarios han iniciado sesión, la fecha y hora del último acceso, y si las cuentas están habilitadas o no. También captura posibles errores durante la ejecución.

¿Qué scripts se incluyen?
Se incluye el script auditoria_usuarios.ps1.

¿Qué tareas de ciberseguridad resuelven?
Control de accesos: Identifica usuarios que nunca han iniciado sesión, lo cual ayuda a detectar cuentas innecesarias o huérfanas.
Gestión de cuentas inactivas: Permite localizar cuentas sin uso, que podrían ser aprovechadas para accesos no autorizados.
Monitoreo de seguridad: Facilita mantener un registro de cuándo fue el último acceso de cada usuario.
Detección de errores: Documenta fallos en la auditoría, asegurando transparencia en el proceso.

¿Qué aprendiste al desarrollarlo?
Cómo usar cmdlets de PowerShell (Get-LocalUser, Get-CimInstance) para obtener información detallada de usuarios.
El manejo de propiedades dinámicas en objetos y cómo procesarlas de forma segura.
La importancia de auditar periódicamente cuentas de usuario para evitar riesgos de seguridad.
Cómo estructurar resultados en listas separadas (usuarios con logon, sin logon y con errores) para una mejor claridad.
