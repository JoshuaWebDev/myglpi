# My GLPI (1.0)

Docker Image with php 7.4, apache 2, mysql 5.7, and glpi 10

## Documentação Oficial

* [Documentação de Instalação](https://glpi-install.readthedocs.io/en/latest/)
* [Documentação de Usuário](https://glpi-user-documentation.readthedocs.io/fr/latest/)

## Configurando o Ambiente de Desenvolvimento

Clone o repositório do projeto

```
git clone git@github.com:JoshuaWebDev/myglpi.git
```

Acesse o diretório do projeto

```
cd myglpi
```

**0bservação: Este projeto não possui o diretório com os arquivos de instalação do GLPI, então é necessário que você acesse o [site oficial](https://glpi-project.org/pt-br/baixar/) e faça o download do arquivo de instalação antes de prosseguir com as instruções posteriores. Em seguida faça a descompactação do arquivo baixado, renomeie a pasta para glpi e copie para dentro do diretório myglpi.**

Copie o arquivo **.env.example** renomeando-o para **.env** e altere o valor das variáveis de acordo com as credenciais da sua base de dados (usuário, senha, porta, etc).

```
cp .env.example .env
```

Execute o comando

```
docker-compose up -d
```

## Timezone

Acesse o container do mysql

```
docker exec -it glpi_db bash
```

Execute o comando a seguir

```
mysql_tzinfo_to_sql /usr/share/zoneinfo | mysql -p -u root mysql
```

Informe a senha do usuário root definida no arquivo .env (DB_ROOT_PASSWORD)

## Instalação

Verificando os requisitos da aplicação.

```
docker exec -it glpi10 php bin/console glpi:system:check_requirements
```

<img src="doc/images/setup12.png">

Execute o script de instalação.

```
docker exec -it glpi10 bash install.sh
```

## Usuários e Senhas Padrão

Os usuários e senhas padrões são:

- **glpi/glpi** para a conta do usuário administrador
- **tech/tech** para a conta do usuário técnico
- **normal/normal** para a conta do usuário normal
- **post-only/postonly** para a conta do usuário postonly

Você pode excluir ou modificar estes usuários bem como os dados iniciais.