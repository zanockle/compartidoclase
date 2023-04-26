#!/bin/bash

# Ejemplo 0010: mostrando mensajes en pantalla

echo Hoy como estas
edad=20
echo Creo que tienes $edad años
echo -e "Esta \nfrase \nmostrará \ncada \npalabra \nen \nuna \nlinea \ndistinta"
echo -e "Suprimir lo que viene a continuación \cel salto de linea"
echo Imprimir todos los ficheros y carpetas a modo de comando ls
echo *
echo Imprimir todos lo ficheros de un formato en concreto
echo *.sh
echo "Esta frase se direcciona a un archivo donde queda grabado " > salvar.txt
echo "Esto que sigue se añade al archivo" >> salvar.txt
echo -n "Omitimos el salto de linea"
