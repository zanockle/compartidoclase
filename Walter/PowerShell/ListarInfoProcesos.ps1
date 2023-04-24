clear
$procesos = Get-service -Name themes
foreach($p in $procesos)
{
    $p | Format-List *
}