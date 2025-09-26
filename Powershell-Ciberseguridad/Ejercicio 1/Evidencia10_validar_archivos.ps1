# Editado por Sofia Lizbeth Perez Muñiz el 26/09/2025
function Validar-Archivo {
    param ([string]$Ruta)
    try {
        if (Test-Path $Ruta) {
            $contenido = Get-Content $Ruta -ErrorAction Stop
            return "Archivo encontrado y accesible: $Ruta"
        } else {
            throw "El archivo no existe."
        }
    }
    catch {
        return "Error: $_"
    }
    finally {
        Write-Host "Validación finalizada para: $Ruta" -ForegroundColor Cyan
    }
}
 
# Prueba de la función con un archivo inexistente
$resultado1 = Validar-Archivo -Ruta "C:\archivo_inexistente.txt"
 
# Ahora probamos con tu Escritorio real en OneDrive
$resultado2 = Validar-Archivo -Ruta "$env:USERPROFILE\OneDrive\Escritorio\archivo.txt"
 
# Definimos la fecha para el nombre del reporte
$fecha = Get-Date -Format "yyyy_MM_dd"
 
# Ruta del reporte
$rutaReporte = "C:\Users\AULA203-12\Desktop\Evidencia10_reporte_$fecha.txt"
 
# Contenido del reporte
@"
===== REPORTE DE VALIDACIÓN DE ARCHIVOS =====
Fecha: $(Get-Date -Format 'dd/MM/yyyy HH:mm:ss')
 
$resultado1
$resultado2
"@ | Out-File -FilePath $rutaReporte -Encoding UTF8
 

Write-Host "Reporte generado en: $rutaReporte"

