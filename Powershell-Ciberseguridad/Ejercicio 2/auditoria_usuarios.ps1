$usuarios = Get-LocalUser
$sinLogon = @()
$conLogon = @()
$errores = @()

foreach ($u in $usuarios) {
    try {
        $last = $null
        if ($u.PSObject.Properties['LastLogon']) {
            $last = $u.LastLogon
        } else {
            try {
                $cim = Get-CimInstance -ClassName Win32_NetworkLoginProfile -Filter "Name='$($u.Name)'" -ErrorAction Stop
                if ($cim -and $cim.LastLogon) { $last = $cim.LastLogon }
            } catch {
                $last = $null
            }
        }

        if (-not $last) {
            $sinLogon += "$($u.Name): Estado = $($u.Enabled), Último acceso = NUNCA"
        } else {
            if ($last -is [DateTime]) { $lastStr = $last.ToString('yyyy-MM-dd HH:mm:ss') }
            else { $lastStr = $last }
            $conLogon += "$($u.Name): Estado = $($u.Enabled), Último acceso = $lastStr"
        }
    } catch {
        $errores += "Error con $($u.Name): $($_.Exception.Message)"
    }
}

$desktop = [Environment]::GetFolderPath('Desktop')
$pathSin = Join-Path -Path $desktop -ChildPath 'usuarios_sin_logon.txt'
$pathCon = Join-Path -Path $desktop -ChildPath 'usuarios_con_logon.txt'
$pathReporte = Join-Path -Path $desktop -ChildPath 'reporte_usuarios.txt'

$sinLogon | Out-File -FilePath $pathSin -Encoding UTF8
$conLogon | Out-File -FilePath $pathCon -Encoding UTF8

$fechaNow = Get-Date -Format 'yyyy-MM-dd HH:mm:ss'
$reporte = @()
$reporte += "Reporte de auditoría de usuarios locales"
$reporte += "Generado: $fechaNow"
$reporte += "Total usuarios: $($usuarios.Count)"
$reporte += "Usuarios NUNCA logon: $($sinLogon.Count)"
$reporte += "Usuarios con logon: $($conLogon.Count)"
$reporte += ""
$reporte += "-- Usuarios que NUNCA han iniciado sesión --"
$reporte += $sinLogon
$reporte += ""
$reporte += "-- Usuarios que SÍ han iniciado sesión --"
$reporte += $conLogon
if ($errores.Count -gt 0) {
    $reporte += ""
    $reporte += "-- Errores detectados al recopilar datos --"
    $reporte += $errores
}

$reporte | Out-File -FilePath $pathReporte -Encoding UTF8

Write-Host "
Resumen rápido:"
Write-Host "Total usuarios: $($usuarios.Count)"
Write-Host "Usuarios NUNCA logon: $($sinLogon.Count)"
Write-Host "Usuarios con logon: $($conLogon.Count)"
Write-Host "Archivos generados en: $desktop"