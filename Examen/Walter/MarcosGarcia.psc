Algoritmo MarcosGarcia
	Definir cheque, billete20, billete10, billete5, billete1 Como Entero
	
	cheque <- 0
	billete20 <- 0
	billete10 <- 0
	billete5 <- 0
	billete1 <- 0
	
	Escribir "Introduzca cantidad a cambiar: "
	Leer cheque
	
	billete20 <- TRUNC (cheque / 20)
	cheque <- cheque mod 20
	billete10 <- TRUNC (cheque / 10)
	cheque <- cheque Mod 10
	billete5 <- TRUNC (cheque / 5)
	billete1 <- cheque mod 5
	
	
	Escribir "Billetes de 20 = ", billete20
	Escribir "Biletes de 10 = ", billete10
	Escribir "Billetes de 5 = ", billete5
	Escribir "Billetes de 1 = ", billete1
FinAlgoritmo
