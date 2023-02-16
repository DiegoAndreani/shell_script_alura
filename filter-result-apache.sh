#!/bin/bash

cd ~/Documentos/scripts/apache-log
## Verificando se é um endereço IP com o site https://regex101.com/
## Usando expresão regular, para aceitar apenas numero
## Com até 3 casas decimais a cada ponto e negar letras
## \b é para informar que não acita caracteres alem do solicitado, nem antes e nem depois. Ou seja, nada alem de 3 casas decimais.  
regex="\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"

if [[ $1 =~ $regex ]]
then
	cat apache.log | grep $1
	if [ $? -ne 0 ]
	then
		echo "O IP solicitado não esta na lista do apache.log"
	fi
else
	echo "Formato não é valido"
fi

