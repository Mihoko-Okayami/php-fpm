FROM alpine:latest

LABEL maintainer="Mihoko-Okayami (https://hub.docker.com/r/mihokookayami/php-fpm/)"

RUN set -eux; \
	apk add --no-cache imagemagick php7-bcmath php7-brotli php7-bz2 php7-calendar php7-cgi php7-common php7-ctype php7-curl php7-dom php7-exif php7-fileinfo php7-fpm php7-ftp php7-gd php7-gettext php7-iconv php7-intl php7-mbstring php7-mysqli php7-mysqlnd php7-opcache php7-openssl php7-pdo php7-pdo_mysql php7-pdo_pgsql php7-pdo_sqlite php7-pecl-imagick php7-pecl-maxminddb php7-pecl-oauth php7-pecl-redis php7-pecl-timezonedb php7-pecl-uploadprogress php7-phar php7-session php7-simplexml php7-sockets php7-sodium php7-sqlite3 php7-tidy php7-tokenizer php7-xml php7-xmlreader php7-xmlwriter php7-zip; \
	addgroup -g 82 -S www-data && adduser -u 82 -D -S -H -h /var/www -s /sbin/nologin -G www-data www-data; \
	addgroup -g 101 -S nginx && adduser -u 101 -D -S -H -h /var/www -s /sbin/nologin -G nginx nginx; \
	rm -rf /tmp/* /var/cache/apk/*

CMD php-fpm7