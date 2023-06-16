#!/bin/bash

# Ejemplo 0003: Determinar si un número está entre otros dos dados. Usar corchete doble.

echo -n "Introduzca el primer número extremo: "
read n1
echo -n "Introduzca el segundo número extremo: "
read n2
echo -n "Introduzca el número a valorar como intermedio: "
read n3

if [[ $n3 -gt $n1 && $n3 -lt $n2 ]]
then
	echo "$n3 ESTÁ entre $n1 y $n2"
else
	echo "$n3 NO ESTÁ entre $n1 y $n2"
fi;
