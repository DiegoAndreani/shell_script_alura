#!/bin/bash

## Criando função

converte_imagem(){

## Entrando no diretório imagens-livros
cd ~/Documentos/scripts/imagens-livros
## Verificando a exitência do diretório png, caso não tenha, criar o diretório 
if [ ! -d png ]
then
	mkdir png
fi

## Lendo o conteudo das imagens .jpg 
## Guadando na variável imagem_sem_extensão
## fazendo o corte delimitando até o . da extensão .jpg com o awf -F
## Lendo o conteúdo da variável e convertendo de .jpg para .png
## salvando no diretório imagens-livros/png 
for imagem in *.jpg
do
	local imagem_sem_extensao=$(ls $imagem | awk -F. '{ print $1 }')
	convert $imagem_sem_extensao.jpg png/$imagem_sem_extensao.png
done

## -F é usado quando se deseja especificar um campo delimitador do parâmetro de texto passado, nesse exemplo, o campo delimitador da mensagem será o . ###

}

## Executando a função
## Se valor igual a zero, sem erro, imprime a primeira frase
## Se não, imprime a segunda frase
## Caso ocorra erro direcionar a mensagem de erro 2> para o arquivo erro_conversao.txt
converte_imagem 2>erro_convesao.txt
if [ $? -eq 0 ]
then
## imprimindo valor da variável
	echo "Conversão realizada com sucesso!"
else
	echo "Falha na conversão!"
fi

