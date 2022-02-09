#!/bin/bash


# echo -e "#!/bin/bash \n$archivo" > ./"$1.sh"

# Comprobamos si el directorio en el que estamos es de un repositorio git
# if [ ! -d '.git' ]; then
# 	echo 'Esta carpeta no contiene un repositorio Git'
# 	exit -1
# fi


# Ahora comprobamos si se le paso algun parametro
if [ $# == 0 ]; then
	echo "pushGit: ¡Error! No se le a pasado ningún parámetro"
	echo "pushGit nombre_del_archivo"
	exit -1
else
    # Comprobamos si el directorio en el que estamos es de un repositorio git
    if [ ! -e 'README.md' ]; then
        echo 'Esta carpeta no contiene un repositorio Git'
        exit -1
    fi
    # compruebo si el archivo existe
    if [ -e '$1' ]; then
        echo "pushGit: $1 ya existe"
        exit -1
    fi

    # pedimos la linea de codigo
    read -p "Codigo: " archivo
    # Escribimos la linea de codigo en el archivo 
    echo -e "#!/bin/bash \n$archivo" > ./"$1"

    # Agregando los permisos
    chmod u+x ./"$1"
	
	# Si llegamos hasta aquí, indicamos a Git los archivos a subir
	git add $1
	
	# Esto nos pedira el mensaje del commit
	read -p "Introduce el mensaje del commit: " TXT
	# read TXT
    # echo "Tu mensaje fue $TXT"
	git commit -m "$TXT"

	# Y terminamos subiendo los archivos
	git push

fi

