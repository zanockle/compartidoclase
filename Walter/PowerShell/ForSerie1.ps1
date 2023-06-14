Clear-Host

$n = Read-Host "Ingrese n: "
$n = [int]$n
for($i=1; $i -le $n; $i++)
{
    #write-host $i
    Stop-Process -Name notepad
    Stop-Process -Name calc.exe
    #Start-Process notepad.exe
    #start-process calc.exe
}