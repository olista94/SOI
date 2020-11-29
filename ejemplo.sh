#!/bin/bash

if [ $# -lt 2 ]
then echo Error de sintaxis: introduzca al menos dos argumentos
else
	op="xD"
	until [ "$op" = "Fin" ]
	do
		echo Menu 
		echo  "\t[Uno] Sumar argumentos multiplos de 3"
		echo  "\t[Dos] Ficheros con permiso de escritura"
		echo  "\t[Tres] Ocurrencias del nombre del script"
		echo  "\t[Fin] Fin"
		echo Opciones:

		read op
		case $op in
		U|Uno|uno)

			suma=0
			for i #Hay casos como este en los que no hace falta indicarle que argumentos tiene que recorrer
			do
						#Si el valor del argumento es multiplo de 3
				if [ $(($i%3)) -eq 0 ]
				then
					((suma=suma+i))
						##Lo sumamos 
				fi
			done
			echo $suma;;
		
	
		D|Dos|dos)
			echo Introduzca el nombre del fichero:
			read fichero
			[ -f $fichero ] && ([ -w $fichero ] && echo $fichero || echo No tiene permiso de escritura) || echo No existe;; 
		T|Tres|tres)

			cont=0;
			until [ $# -eq 0 ]
			do
				if [ $1 = $0 ]
				then
					let cont = $cont +1
				fi
				shift
			done
			echo $cont;;
		
		Fin)
			echo Fin del programa;;
		esac
	done
fi
