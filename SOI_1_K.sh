#!/bin/bash

if [ $# -lt 2 ] # || [ $i!=[0-9]+ ]
then echo "Error de sintaxis"
else
	opcion="op"
	until [[ ("$opcion" = "F") || ("$opcion" = "f") ]]
	do
		echo -e "Menú\t[R] Recuento"
		echo -e "\t[M] Mayor/Menor"
		echo -e "\t[F] FIN"
		echo -e "Opciones:"

		read opcion

		case $opcion in

		# Solicita nombre de dos ficheros y comprueba permiso escritura. Si los tiene, almacena en el fichero recuento el num de lineas, palabras y bytes de cada fichero
		# Si alguno de los dos fichero no existe o no tiene este permiso, muestra el mensaje
		R|r)
			echo Introduzca el nombre del primer fichero:
			read fichero1
			echo Introduzca el nombre del segundo fichero:
                        read fichero2
			([ -r $fichero1 ] && [ -r $fichero2 ] && wc $fichero1 $fichero2 > recuento) || echo "Alguno o los dos ficheros no tiene permiso de lectura";;

		# Muestra el mayor y menor numero de los parametros introducidos
		M|m)
			# menor=999999999
			# mayor=0
			menor=$1
			mayor=$1


			for i in $*
			do
				#Comprobacion menor
				if [ "$i" -le $menor ]
				then let menor=$i
				fi

				#Comprobacion mayor
        			if [ "$i" -ge $mayor ]
        			then let mayor=$i
        			fi
			done

			echo "Menor: $menor"
			echo "Mayor: $mayor";;

		# Sale del programa
		F|f)
			echo "Fin del programa";;
		esac
	done
fi
