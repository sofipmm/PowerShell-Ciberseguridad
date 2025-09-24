# auditoria_usuarios.ps1
# Script para auditar usuarios locales en Windows
# Debe ejecutarse en PowerShell ISE como Administrador

# Obtener todos los usuarios locales
$usuarios = Get-LocalUser

# Arreglos para clasificar
$sinLogon = @()
$conLogon = @()

# Recorrer cada usuario
foreach ($u in $usuarios) {
    if (-not $u.LastLogon) {
        $sinLogon += "$($u.Name): Estado = $($u.Enabled), Último acceso = NUNCA"
    } else {
        $conLogon += "$($u.Name): Estado = $($u.Enabled), Último acceso = $($u.LastLogon)"
    }
}

# Guardar en archivos separados
$sinLogon | Out-File -FilePath "\Users\evada\OneDrive\Desktop\usuarios_sin_logon.txt"
$conLogon | Out-File -FilePath "\Users\evada\OneDrive\Desktop\usuarios_con_logon.txt"

# Generar un reporte general
$reporte = @()
$reporte += "===== REPORTE DE USUARIOS LOCALES ====="
$reporte += "`nUsuarios que NUNCA han iniciado sesión:"
$reporte += $sinLogon
$reporte += "`nUsuarios que SÍ han iniciado sesión:"
$reporte += $conLogon

# Guardar reporte general
$reporte | Out-File -FilePath "\Users\evada\OneDrive\Desktop\reporte_usuarios.txt"

# Mostrar en pantalla
Write-Output "`n===== REPORTE DE USUARIOS LOCALES ====="
Write-Output "`nUsuarios que NUNCA han iniciado sesión:"
$sinLogon | ForEach-Object { Write-Output $_ }
Write-Output "`nUsuarios que SÍ han iniciado sesión:"
$conLogon | ForEach-Object { Write-Output $_ }