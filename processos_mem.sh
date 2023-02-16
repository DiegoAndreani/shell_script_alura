#!/bin/bash

### Verificar a existencia do diretorio log, caso não, criar o diretório
if [ ! -d log ]
then
	mkdir log
fi

### Executar os 10 processos de maior consumo de memória alocada
### Analisar os PID e exibir apenas nomes dos programas associados

processo_memoria(){
processos=$(ps -e -o pid --sort -size | head -n 11 | grep [0-9])
for pid in $processos
do
	nome_processo=$(ps -p $pid -o comm=)
	### Informar data/hora da excução do script
	echo -n $(date +%F,%H:%M:%S,) >> log/$nome_processo.log
	### armazenar as informações em MB em um aruivo .log
	tamanho_processo=$(ps -p $pid -o size | grep [0-9])
	echo "$(bc <<< "scale=2;$tamanho_processo/1024") MB" >> log/$nome_processo.log
done
}

processo_memoria
if [ $? -eq 0 ]
then
	echo "Os arquivos foram salvos no diretório log com sucesso"
else
	echo "Falha ao salvar o arquivo log"
fi

