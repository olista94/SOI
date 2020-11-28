#!/bin/bash

if [ $# -lt 2 ]
then echo "Error de sintaxis"
else
	opcion="op"
	until [[ ("$opcion" = "F") || ("$opcion" = "f")]]
	do

		echo -e "Menú\t[R] Recuento"
		echo -e "\t[M] Mayor/Menor"
		echo -e "\t[F] FIN"
		echo -e "Opciones:"

		read opcion
		case $opcion in
		R|r)
			echo Introduzca el nombre del primer fichero:
			read fichero1
			echo Introduzca el nombre del segundo fichero:
                        read fichero2
			([ -r $fichero1 ] && [ -r $fichero2 ] && wc $fichero1 $fichero2 > recuento) || echo "Alguno o los dos ficheros no tiene permiso de lectura";; 
		M|m)
			menor=9999
			mayor=0
			#Comprobacion menor
			for i in $*
			do
				if [ $menor -le $i ]
				then (menor=$i) 
				fi
			done

			i=0
			#Comprobacion mayor
			for i in $*
			do
                                if [ $i -ge $mayor ]
                                then (mayor=$i)
                                fi
			done

			echo "Menor: $menor"
			echo "Mayor: $mayor";;
		F|f)
			echo Fin del programa;;
		esac
	done
fi

