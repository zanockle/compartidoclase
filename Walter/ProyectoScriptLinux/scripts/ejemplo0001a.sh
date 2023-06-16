#!/bin/bash

# Ejemplo 0001a: Determinar si un número es mayor que otro. Usar corchete simple.

echo -n "Introduzca el primer número a comparar: "
read n1
echo -n "Introduzca el segundo número a comparar: "
read n2

if [ $n1 -gt $n2 ]
then
	echo "$n1 es mayor que $n2"
else
	echo "$n2 es mayor que $n1"
fi;
