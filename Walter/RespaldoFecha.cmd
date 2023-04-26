@ECHO OFF
set dia=%date:~0,2%
set mes=%date:~3,2%
set anio=%date:~6,4%
set hora=%time:~0,2%
set minutos=%time:~3,2%
set segundos=%time:~6,2%
set carpeta=C:\MARCOS\WALTER\trabajando_%dia%-%mes%-%anio%_%hora%-%minutos%-%segundos%
xcopy C:\MARCOS\ACTIVIDADES "%carpeta%" /E /I  /F 
PAUSE