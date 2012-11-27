#!/bin/bash 

DATE=`/bin/date "+%Y%m%d-%H%M%S"`

ftp_host="server aqui"
user_ftp="user"
senha="pass"

arq_host="arquivos do servidor"

mkdir tmp_$DATE
cd tmp_$DATE

#### Conecta no servidor FTP ####

ftp -ivn $ftp_host << fim
                   user $user_ftp $senha

#caso tenha que entrar em alguma pasta
                   cd pasta-onde-tem-os-files
                   get $arq_host
                   bye
                   EOF
fim

#### Compacta ####

tar -zcf $DATE *
mv $DATE ..
cd ..
rm tmp_$DATE
