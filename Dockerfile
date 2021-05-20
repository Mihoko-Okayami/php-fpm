FROM alpine:latest

LABEL maintainer="Mihoko-Okayami (https://hub.docker.com/r/mihokookayami/php-fpm/)"

RUN apk add --no-cache php8-brotli php8-bz2 php8-calendar php8-cgi php8-ctype php8-curl php8-exif php8-fpm php8-ftp php8-gd php8-gettext php8-iconv php8-intl php8-mbstring php8-mysqli php8-opcache php8-openssl php8-pecl-imagick php8-pecl-memcached php8-pecl-oauth php8-pecl-redis php8-pecl-uploadprogress php8-phar php8-session php8-simplexml php8-sockets php8-sqlite3 php8-tidy php8-tokenizer php8-xml php8-xmlreader php8-xmlwriter php8-zip

COPY opcache-recommended.ini /etc/php8/conf.d/

CMD php-fpm8