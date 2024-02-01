FROM ghcr.io/hassio-addons/base:14.3.3

COPY rootfs /

# Set the working directory
WORKDIR /var/www
RUN adduser superuser -G root -D -H
RUN apk update
RUN apk add sudo

RUN apk add git
RUN cd /var/www/
RUN git clone https://github.com/marchorst/WineStorageApi.git /var/www/

RUN apk add php81
RUN apk add php81-fpm php81-cli php81-curl php81-zip php81-simplexml php81-gd php81-iconv php81-openssl php81-fileinfo php81-common php81-json php81-opcache php81-mbstring php81-pdo_sqlite php81-ctype php81-session php81-dom php81-cgi php81-tokenizer php81-xml php81-xmlreader php81-xmlwriter php81-phar

#RUN apk add php81 php81-fpm php81-cli php81-common php81-json php81-opcache php81-mbstring php81-zip
#RUN apk add php81-curl php81-gd php81-pdo_sqlite php81-pecl-apcu php81-ctype php81-session php81-dom php81-bcmath php81-cgi
#RUN apk add php81-ctype php81-curl php81-dba php81-dom php81-embed
#RUN apk add php81-enchant php81-exif php81-ffi php81-fileinfo php81-gd php81-gettext php81-gmp php81-iconv php81-imap
#RUN apk add php81-intl php81-odbc php81-openssl php81-pdo php81-pdo_dblib
#RUN apk add php81-pdo_sqlite php81-pear php81-pecl-apcu
#RUN apk add php81-pecl-ssh2 php81-pecl-uuid php81-pecl-yaml php81-pecl-zstd php81-pgsql php81-phar php81-session
#RUN apk add php81-simplexml php81-sockets php81-sqlite3 php81-sysvsem
#RUN apk add php81-tokenizer php81-xml php81-xmlreader php81-xmlwriter php81-xsl
RUN apk add nginx
RUN cd /var/www/
RUN curl -s https://getcomposer.org/installer | php 
RUN cd /var/www
RUN ls /var/www
RUN php composer.phar install --optimize-autoloader

RUN mkdir /var/www/tmp/

RUN chmod -R 777 /var/www/
RUN chmod -R 777 /var/log/
RUN chmod -R 777 /var/lib/nginx/ /var/lib/nginx/tmp/
RUN chmod +x /localshare/setup.sh

EXPOSE 8080

# Command to start the webserver
CMD ["/bin/bash", "-c", "sh /localshare/setup.sh && php-fpm81 && chmod 777 /var/www/* && nginx -g 'daemon off;' && chown -R superuser:root /var/www"]