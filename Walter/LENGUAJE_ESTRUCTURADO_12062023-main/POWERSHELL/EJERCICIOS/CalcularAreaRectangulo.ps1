Clear-Host
Write-Host "CALCULAR EL AREA DE UN RECTANGULO"
Write-Host "---------------------------------"

$Longitud = Read-Host "Ingrese Longitud? " 
$Ancho    = Read-Host "Ingrese Ancho?    "

$Longitud = [double]::Parse($Longitud)
$Ancho = [double]::Parse($Ancho)

$Area = $Longitud * $Ancho

Write-Host "Longitud: ", $Longitud
Write-Host "Ancho   : ", $Ancho
Write-Host "Area    : ", $Area
Pause
