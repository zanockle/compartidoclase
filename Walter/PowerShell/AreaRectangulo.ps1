clear

$longitud = Read-Host "Introduzca longitud: "
$ancho = read-Host "Introduzca ancho: "

$longitud = [double]::Parse($longitud)
$ancho = [double]::Parse($ancho)

$area = $longitud * $ancho

Write-Host "Area : $area"
Write-Host "Área: ", $area

pause