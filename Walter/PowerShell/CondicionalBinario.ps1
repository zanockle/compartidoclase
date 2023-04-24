clear
$edad = Read-host "Introduzca su edad: "
$edad = [int]$edad
if($edad -gt 18)
{
    write-host "Mayor de edad"
}
else
{
    write-host "menos de edad"
}