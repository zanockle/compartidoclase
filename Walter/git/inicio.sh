#!/bin/bash
# Autor: Marcos García
# Fecha: 18/04/2023
while true; do
echo "MENU"
echo "----"
echo "1) CREAR CONTROL DE VERSION"
echo "2) CONFIGURACION USUARIO, NOMBRE-EMAIL-PASSWORD"
echo "3) REALIZAR PRIMER COMMIT"
echo "4) REALIZAR COMMIT SOBRE EL ULTIMO"
echo "5) CONFIGURACION REPOSITORIO REMOTO"
echo "6) CAMBIAR NOMBRE DE LA RAMA PRINCIPAL, DE NOMBRE A MAIN"
echo "7) SUBIR EL REPOSITORIO LOCAL AL REMOTO"
echo "8) SALIR"

echo
echo -n "ESCRIBA SU OPCION: "
read opcion

case $opcion in
1)
		clear
			echo "CREAR CONTROL DE VERSION"
			echo "------------------------"
			git init
			read -rsp $'\nPress enter to continue...'
	;;
2)
		clear
		echo "2) CONFIGURACION USUARIO, NOMBRE-EMAIL-PASSWORD"
		echo "------------------------"
		git config user.name
		git config user.email 
		git config user.password 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
		read -rsp $'\nPress enter to continue...'
	;;
3)
		clear
		echo "3) REALIZAR PRIMER COMMIT"
		echo "------------------------"
		git add .
		git commit -m "SNAPSHOT-1"
		read -rsp $'\nPress enter to continue...'
	;;
4)
		clear
		echo "4) REALIZAR COMMIT SOBRE EL ULTIMO"
		echo "------------------------"
		git add .
		git commit --amend -m "SNAPSHOT-1"
		read -rsp $'\Press enter to continue...'
	;;
5)
		clear
		echo "5) CONFIGURACION REPOSITORIO REMOTO"
		echo "------------------------"
		git remote add origin "https://github.com/zanockle/ProyectoScriptLinux.git"
		read -rsp $'\Press enter to continue...'
	;;
6)
		clear
		echo "6) CAMBIAR NOMBRE DE LA RAMA PRINCIPAL, DE NOMBRE A MAIN"
		echo "------------------------"
		git branch -M main
		read -rsp $'\Press enter to continue...'
	;;
7)
		clear
		echo "7) SUBIR EL REPOSITORIO LOCAL AL REMOTO"
		echo "------------------------"
		git push -u -f origin main 
			read -rsp $'\nPress enter to continue...'
	;;
8)
clear
echo "8) SALIR"
	echo "------------------------"
	exit 0
	;;
*)
		clear
		echo "OPCION INCORRECTA"
		read -rsp $'\nPress enter to continue...'
	;;
esac
done 