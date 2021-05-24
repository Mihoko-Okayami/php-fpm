FROM php:7-fpm-alpine

MAINTAINER Mihoko-Okayami <https://hub.docker.com/r/mihokookayami/php-fpm/>

RUN set -eux; \
	docker-php-source extract; \
	apk add --no-cache --virtual .build-dependencies $PHPIZE_DEPS; \
	apk add --no-cache bzip2-dev freetype-dev imagemagick imagemagick-dev libjpeg-turbo-dev libpng-dev libwebp-dev libxpm-dev libzip-dev tidyhtml-dev; \
	docker-php-ext-configure gd --with-freetype --with-jpeg --with-webp --with-xpm; \
	docker-php-ext-install -j "$(nproc)" bz2 exif gd mysqli opcache tidy zip; \
	pecl install imagick redis; \
	docker-php-ext-enable imagick redis; \
	addgroup -g 101 -S nginx; \
	adduser -S -D -H -u 101 -h /var/www -s /sbin/nologin -G nginx -g nginx nginx; \
	docker-php-source delete; \
	apk del .build-dependencies; \
	rm -rf /tmp/* /var/cache/apk/*

COPY opcache-recommended.ini /usr/local/etc/php/conf.d/