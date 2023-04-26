### SCRIPTS LINUX


##### Ejemplo 0001: Determinar si 2 es mayor que 1. Usar corchete simple.

<pre>
<code>
#!/bin/bash

if [ 2 -gt 1 ]
then
	echo "2 es mayor que 1"
else
	echo "2 no es mayor que 1"
fi;
</pre>
</code>

2 es mayor que 1

##### Ejemplo 0001a: Determinar si un número es mayor que otro. Usar corchete simple.

<pre>
<code>
#!/bin/bash
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
</pre>
</code>

<p>
Introduzca el primer número a comparar: 5
Introduzca el segundo número a comparar: 6
6 es mayor que 5



##### Ejemplo 0002: Determinar si 2 es distinto a 3. Usar corchete simple.

<pre>
<code>
#!/bin/bash
if [ 2 -ne 3 ]
then
	echo "2 es distinto a 3"
else
	echo "2 igual a 3"
fi;
</pre>
</code>

</p>
2 es distinto a 3



##### Ejemplo 0003: Determinar si un número está entre otros dos dados. Usar corchete doble.

<pre>
<code>
#!/bin/bash
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
</pre>
</code>

Introduzca el primer número extremo: 157
Introduzca el segundo número extremo: 579
Introduzca el número a valorar como intermedio: 87
87 NO ESTÁ entre 157 y 579


##### Ejemplo 0004: Determinar si un número está entre otros dos dados. Usar corchete simple.

<pre>
<code>
#!/bin/bash
echo -n "Introduzca el primer número extremo: "
read n1
echo -n "Introduzca el segundo número extremo: "
read n2
echo -n "Introduzca el número a valorar como intermedio: "
read n3

if [ $n3 -gt $n1 -a $n3 -lt $n2 ]
then
	echo "$n3 ESTÁ entre $n1 y $n2"
else
	echo "$n3 NO ESTÁ entre $n1 y $n2"
fi;
</pre>
</code>

Introduzca el primer número extremo: 58
Introduzca el segundo número extremo: 622
Introduzca el número a valorar como intermedio: 13
13 NO ESTÁ entre 58 y 622


