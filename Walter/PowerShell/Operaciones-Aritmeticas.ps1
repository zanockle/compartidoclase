clear
#Definir datos
$a = 0
$b= 0

#Entrada

$a = Read-Host "Introduzca a: "
$b = Read-Host "Introduzca b: "

Write-Host $a.GetType().Name

$a = [double] $a
$b = [double] $b

Write-Host $a.GetType().Name

# Proceso
$suma = $a + $b 
$resta = $a -$b
$multiplicacion = $a * $b
$division = $a / $b
$resto = $a % $b



#Salida
Write-Host "Suma: $suma"
Pause