#!/bin/bash

workdir=/var/www/html/glpi
db_host=db
db_name=glpi
db_user=glpi
db_password=glpi
db_port=3306

echo "Configurando usuário e grupo www-data no diretório $workdir"

if chown -R www-data:www-data $workdir
then
    echo "Usuário e grupo www-data configurados configurados com sucesso!"
else
    echo "Não foi possível configurar o usuário e grupo www-data"
fi

echo "Configurando permissões de acesso ao diretório $workdir"

if chmod -R 775 $workdir
then
    echo echo "Permissões de acesso ao diretório $workdir configuradas com sucesso!"
else
    echo "Não foi possível configurar as permissões de acesso ao diretório $workdir"
fi

echo "Configurando permissões de acesso ao diretório $workdir/files"

if chmod 777 $workdir/files
then
    echo echo "Permissões de acesso ao diretório $workdir/files configuradas com sucesso!"
else
    echo "Não foi possível configurar as permissões de acesso ao diretório $workdir/files"
fi

echo "Configurando permissões de acesso ao diretório $workdir/config"

if chmod 777 $workdir/config
then
    echo echo "Permissões de acesso ao diretório $workdir/config configuradas com sucesso!"
else
    echo "Não foi possível configurar as permissões de acesso ao diretório $workdir/config"
fi

echo "Configurando permissões de acesso ao diretório $workdir/files/_dumps"

if chmod 777 $workdir/files/_dumps
then
    echo echo "Permissões de acesso ao diretório $workdir/files/_dumps configuradas com sucesso!"
else
    echo "Não foi possível configurar as permissões de acesso ao diretório $workdir/files/_dumps"
fi

echo "Configurando permissões de acesso ao diretório $workdir/files/_sessions"

if chmod 777 $workdir/files/_sessions
then
    echo echo "Permissões de acesso ao diretório $workdir/files/_sessions configuradas com sucesso!"
else
    echo "Não foi possível configurar as permissões de acesso ao diretório $workdir/files/_sessions"
fi


echo "Configurando permissões de acesso ao diretório $workdir/files/_cron"

if chmod 777 $workdir/files/_cron
then
    echo echo "Permissões de acesso ao diretório $workdir/files/_cron configuradas com sucesso!"
else
    echo "Não foi possível configurar as permissões de acesso ao diretório $workdir/files/_cron"
fi

echo "Configurando permissões de acesso ao diretório $workdir/files/_cache"

if chmod 777 $workdir/files/_cache
then
    echo echo "Permissões de acesso ao diretório $workdir/files/_cache configuradas com sucesso!"
else
    echo "Não foi possível configurar as permissões de acesso ao diretório $workdir/files/_cache"
fi

echo "Configurando permissões de acesso ao diretório $workdir/files/_log"

if chmod 777 $workdir/files/_log
then
    echo echo "Permissões de acesso ao diretório $workdir/files/_log configuradas com sucesso!"
else
    echo "Não foi possível configurar as permissões de acesso ao diretório $workdir/files/_log"
fi

echo "Configurando permissões de acesso ao diretório $workdir/files/_lock"

if chmod 777 $workdir/files/_lock
then
    echo echo "Permissões de acesso ao diretório $workdir/files/_lock configuradas com sucesso!"
else
    echo "Não foi possível configurar as permissões de acesso ao diretório $workdir/files/_lock"
fi

echo "Configurando permissões de acesso ao diretório $workdir/files/_graphs"

if chmod 777 $workdir/files/_graphs
then
    echo echo "Permissões de acesso ao diretório $workdir/files/_graphs configuradas com sucesso!"
else
    echo "Não foi possível configurar as permissões de acesso ao diretório $workdir/files/_graphs"
fi

echo "Configurando permissões de acesso ao diretório $workdir/files/_pictures"

if chmod 777 $workdir/files/_pictures
then
    echo echo "Permissões de acesso ao diretório $workdir/files/_pictures configuradas com sucesso!"
else
    echo "Não foi possível configurar as permissões de acesso ao diretório $workdir/files/_pictures"
fi

echo "Configurando permissões de acesso ao diretório $workdir/files/_rss"

if chmod 777 $workdir/files/_rss
then
    echo echo "Permissões de acesso ao diretório $workdir/files/_rss configuradas com sucesso!"
else
    echo "Não foi possível configurar as permissões de acesso ao diretório $workdir/files/_rss"
fi

echo "Configurando permissões de acesso ao diretório $workdir/files/_tmp"

if chmod 777 $workdir/files/_tmp
then
    echo echo "Permissões de acesso ao diretório $workdir/files/_tmp configuradas com sucesso!"
else
    echo "Não foi possível configurar as permissões de acesso ao diretório $workdir/files/_tmp"
fi

echo "Configurando permissões de acesso ao diretório $workdir/files/_uploads"

if chmod 777 $workdir/files/_uploads
then
    echo echo "Permissões de acesso ao diretório $workdir/files/_uploads configuradas com sucesso!"
else
    echo "Não foi possível configurar as permissões de acesso ao diretório $workdir/files/_uploads"
fi

echo "Configurando permissões de acesso ao diretório $workdir/files/_plugins"

if chmod 777 $workdir/files/_plugins
then
    echo echo "Permissões de acesso ao diretório $workdir/files/_plugins configuradas com sucesso!"
else
    echo "Não foi possível configurar as permissões de acesso ao diretório $workdir/files/_plugins"
fi

if php bin/console db:install -vvv --default-language=pt_BR --db-host=$db_host --db-port=$db_port --db-name=$db_name --db-user=$db_user --db-password=glpi --no-interaction --no-telemetry --force
then
    echo "Instalação Realizada com Sucesso!"
elif php bin/console db:install -vvv --default-language=pt_BR --db-host=$db_host --db-port=$db_port --db-name=$db_name --db-user=$db_user --db-password=glpi --no-interaction --no-telemetry --force --reconfigure
then
    echo "Instalação Realizada com Sucesso!"
else
    echo "Não foi possível concluir a instalação"
fi