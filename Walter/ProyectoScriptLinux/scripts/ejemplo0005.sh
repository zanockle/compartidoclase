#!/bin/bash

# Ejemplo 0004: Determinar si dos números son distintos. Usar corchete simple.

echo -n "Introduzca el primer número: "
read n1
echo -n "Introduzca el segundo número: "
read n2

if [ $n2 -ne $n1  ]
then
	echo "$n2 es distinto a $n1"
else
	echo "$n2 NO es distinto a $n1"
fi;
