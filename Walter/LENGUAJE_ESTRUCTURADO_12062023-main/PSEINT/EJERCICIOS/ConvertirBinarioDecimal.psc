Algoritmo ConvertirBinarioDecimal
	//Deninir datos
	Definir b0,b1,b2,b3,resultado Como Entero
	//Entrada
	//Al hablar de numero binario hay que tener en cuenta que el primer dígito es el de la derecha del todo
	Escribir "Escribir 0 o 1 para el primer d�gito"
	Leer b0
	Escribir "Escribir 0 o 1 para el segundo d�gito"
	Leer b1
	Escribir "Escribir 0 o 1 para el tercero d�gito"
	Leer b2
	Escribir "Escribir 0 o 1 para el cuarto d�gito"
	Leer b3
	//Proceso 
	resultado = b3*2^3+b2*2^2+b1*2^1+b0*2^0
	//Salida
	Escribir "El binario transformado en decimal es: ",resultado
FinAlgoritmo
