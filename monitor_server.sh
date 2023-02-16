#!/bin/bash
 
retorno_http=$(curl --write-out %{http_code} --silent --output /dev/null http://localhost)
## -ne significa: não é igua. -eq significa: igual á.
if [ $retorno_http -ne 200 ]
then
mail -s "Servidor apache offline" diego.consultoria.ti@gmail.com<<del
Houve uma falha de comunicação com o servidor web esta offline.
del
else	
	systemctl restart apache2
fi
