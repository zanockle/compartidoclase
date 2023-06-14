Algoritmo binario_a_decimal
	Definir b0, b1, b2, b3, d Como Entero
	Escribir  "Ingrese número binario posición 0: "
	Leer b0
	Escribir "posición 1: "
	Leer b1
	Escribir "posición 2: "
	Leer b2
	Escribir "posición 3: "
	Leer b3
	d = b3*2^3 + b2*2^2 + b1*2^1 + b0*2^0
	Escribir "El decimal es " d
FinAlgoritmo
