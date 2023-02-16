#!/bin/bash

converte_imagem(){
	local caminho_imagem=$1
	local imagem_sem_extensao=$(ls $caminho_imagem | awk -F. '{print $1}')
	convert $imagem_sem_extensao.jpg $imagem_sem_extensao.png
}

varrer_diretorio(){
	cd $1
	for arquivo in *
	do
		local caminho_arquivo=$(find  ~/Documentos/scripts/imagens-novos-livros -name "$arquivo")
		if [ -d $caminho_arquivo ]
		then
			varrer_diretorio $caminho_arquivo
		else
			converte_imagem $converte_imagem
		fi
	done
}

varrer_diretorio ~/Documentos/scripts/imagens-novos-livros 2>erro_conv_novos.txt
if [ $? -eq 0 ]
then
	echo "Conversão realizada com sucesso"
else
	echo "Falha na conversão dos arquivos"
fi
