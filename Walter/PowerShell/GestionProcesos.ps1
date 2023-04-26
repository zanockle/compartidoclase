# Manejo de puertos
#1. Hacer un script que me permita cerrar los procesos que hagan uso de un puerto

Clear-Host
$puerto = 8081
$idProceso = Get-NetTCPConnection -LocalPort $puerto | Select-Object -ExpandProperty owningprocess
Write-Host "idProceso: $idProceso"
Stop-Process -Id $idProceso -Force

#2. Un bucle para obtener todos los idProceso que ocupan el puerto y cerrarlos dinámicamente

clear
$puerto = 8081
$vector_idprocesos = Get-NetTCPConnection -LocalPort $puerto | Select-Object -ExpandProperty owningprocess
ForEach($id in $vector_idprocesos)
{
    Write-Host "IdProceso: $id"
    Stop-Process -Id $id -Force
}

# Verificar si tengo un proceso ocupando el puerto

clear
$puerto = 8081
$vector_idprocesos = Get-NetTCPConnection -LocalPort $puerto -ErrorAction SilentlyContinue | Select-Object -ExpandProperty owningprocess
If($vector_idprocesos -eq $null){
    Write-Host "No hay procesos ocupando el puerto"
}
else
{
    Write-Host "Sí hay proceso/s ocupando el puerto $puerto"
}

# Ayudas para los comandos de powershell

#Get-Help Select-Object -Online

# Cerrar los procesos que consumen mayor memoria RAM

clear
$vector = Get-Process | Sort-Object WS -Descending | Select-Object -First 10
ForEach($proceso in $vector)
{
    Stop-Process -id $proceso.id -Confirm
}

# Listar los servicios que se están ejecutando

clear
Get-Service | Where-Object {$_.Status -eq "Running"} | foreach {Stop-Service -inputobject $_ -Confirm}