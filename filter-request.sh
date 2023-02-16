#!/bin/bash

cd ~/Documentos/scripts/apache-log

## Caso o cliente não coloque o parametro para executar o script
## informar que não foi colocado e ao colocar, armazenar na variável requisicao
if [ -z $1 ]
then
	while [ -z $requisicao ]
	do
		read -p "Favor coloque o parametro GET, PUT, POST OU DELETE: " requisicao
		letra_maiuscula=$(echo $requisicao | awk '{ print toupper($1) }')
	done
else
	## Caso seja digitado get, post, put ou delete
	## muda para GET, POST, PUT ou DELETE
	letra_maiuscula=$(echo $1 | awk '{ print toupper($1) }')
fi

## Filtrar o arquivo apache.log de acordo com o a requsição do usuário
## elif é o mesmo que "else if" "se não se"

case $letra_maiuscula in
	GET) 
	cat apache.log | grep GET
	;;
	POST)
	cat apache.log | grep POST
	;;
	PUT)
	cat apache.log | grep PUT
	;;
        DELETE)
        cat apache.log | grep DELETE
        ;;
	*)
	echo "Parametro não é valido"
	;;
esac

