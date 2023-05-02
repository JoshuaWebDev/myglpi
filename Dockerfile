FROM php:7.4-apache

RUN echo "Atualizando dependências do sistema"
RUN apt-get update

RUN echo "Instalando dependências do sistema Linux"
RUN apt-get install -y vim g++ libicu-dev libpq-dev libzip-dev zip libbz2-dev zlib1g-dev libldap2-dev curl \
libldb-dev libfreetype6-dev libjpeg62-turbo-dev libpng-dev exiftool

RUN echo "Instalando e habilitando extensões do PHP"
RUN docker-php-ext-install bcmath intl mysqli pdo zip bz2
RUN docker-php-ext-configure zip
RUN docker-php-ext-configure gd --with-freetype --with-jpeg
RUN docker-php-ext-install -j$(nproc) gd
RUN echo "Habilitando otimizações no OPcache"
RUN docker-php-ext-configure opcache --enable-opcache
RUN docker-php-ext-install opcache
RUN echo "Instalando e habilitando exif"
RUN docker-php-ext-configure exif
RUN docker-php-ext-install exif
RUN docker-php-ext-enable exif
# Enable Apache ldap auth module
RUN echo "Habilitando LDAP"
RUN docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu/
RUN docker-php-ext-install ldap

COPY ./docker/install.sh /usr/local/bin
COPY ./docker/apache/000-default.conf /etc/apache2/sites-available/000-default.conf
COPY ./docker/apache/start-apache /usr/local/bin
COPY ./docker/php/php.ini-development /usr/local/etc/php/php.ini-development
COPY ./docker/php/php.ini-production /usr/local/etc/php/php.ini-production

RUN mkdir /var/www/html/glpi
COPY ./glpi /var/www/html/glpi

WORKDIR /var/www/html/glpi

# RUN chmod -R 775 /var/www/html/glpi
# RUN chmod 777 /var/www/html/glpi/files
# RUN chmod 777 /var/www/html/glpi/config
# RUN chmod 777 /var/www/html/glpi/files/_dumps
# RUN chmod 777 /var/www/html/glpi/files/_sessions
# RUN chmod 777 /var/www/html/glpi/files/_cron
# RUN chmod 777 /var/www/html/glpi/files/_cache
# RUN chmod 777 /var/www/html/glpi/files/_log
# RUN chmod 777 /var/www/html/glpi/files/_lock
# RUN chmod 777 /var/www/html/glpi/files/_graphs
# RUN chmod 777 /var/www/html/glpi/files/_pictures
# RUN chmod 777 /var/www/html/glpi/files/_rss
# RUN chmod 777 /var/www/html/glpi/files/_tmp
# RUN chmod 777 /var/www/html/glpi/files/_uploads
# RUN chmod 777 /var/www/html/glpi/files/_plugins
# RUN chown -R www-data:www-data /var/www/html/glpi

RUN chmod +x /usr/local/bin/start-apache