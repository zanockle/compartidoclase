Algoritmo invertir_numero_2_digitos
	Definir cociente, resto, invertir, num como entero
	Escribir "Ingrese número: "
	Leer num
	invertir = (num % 10) * 10 + trunc(num / 10)
	Escribir "Invertido es " invertir
FinAlgoritmo
