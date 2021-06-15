FROM alpine:latest

LABEL maintainer="Mihoko-Okayami (https://hub.docker.com/r/mihokookayami/php-fpm/)"

RUN set -eux; \
	apk add --no-cache imagemagick php8-bcmath php8-brotli php8-bz2 php8-calendar php8-cgi php8-common php8-ctype php8-curl php8-dom php8-exif php8-fileinfo php8-fpm php8-ftp php8-gd php8-gettext php8-iconv php8-intl php8-mbstring php8-mysqli php8-mysqlnd php8-opcache php8-openssl php8-pdo php8-pdo_mysql php8-pdo_pgsql php8-pdo_sqlite php8-pecl-imagick php8-pecl-maxminddb php8-pecl-oauth php8-pecl-redis php8-pecl-timezonedb php8-pecl-uploadprogress php8-phar php8-session php8-simplexml php8-sockets php8-sodium php8-sqlite3 php8-tidy php8-tokenizer php8-xml php8-xmlreader php8-xmlwriter php8-zip; \
	addgroup -g 82 -S www-data && adduser -u 82 -D -S -H -h /var/www -s /sbin/nologin -G www-data www-data; \
	addgroup -g 101 -S nginx && adduser -u 101 -D -S -H -h /var/www -s /sbin/nologin -G nginx nginx; \
	rm -rf /tmp/* /var/cache/apk/*

CMD php-fpm8