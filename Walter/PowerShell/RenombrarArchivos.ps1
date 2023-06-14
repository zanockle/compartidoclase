clear
$lista = Get-ChildItem "*.txt" -file -R
for($i=0; $i -lt $lista.count; $i++)
{
    Write-Host $lista[$i].Name
    copy $lista[$i] -Destination C:\Marcos\Walter\Copias
}