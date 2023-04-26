clear
$procesos = Get-Process
$cantidadMemoria = 100000000
foreach($proceso in $procesos)
{
    if($proceso.WorkingSet64 -gt $cantidadMemoria)
    {
        Write-Host "Proceso $($proceso.processname) más de 100MB de RAM"
    }
}