Algoritmo serie
	Definir n1, n2, resultado Como Entero
	Mientras 0 = 0 Hacer
		
		n1 <- 0
		n2 <- -1
		resultado <- 0
		Mientras n1 >= n2 Hacer
			Escribir "Introduzca primer número: "
			Leer n1
			Escribir "Introduzca segundo número: "
			Leer n2
		FinMientras
		si n1 < n2 Entonces
			Para i <- n1 Hasta n2 Hacer
				resultado <- resultado + i
			FinPara
			Escribir "La suma es igual a " resultado
		FinSi
	FinMientras
FinAlgoritmo
