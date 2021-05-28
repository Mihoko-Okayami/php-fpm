Official website : https://www.php.net/  
  
# Usage :  
    version: "3.7"
    services:
      php:
        image: mihokookayami/php-fpm:latest
        container_name: php
        volumes:
          - /my/conf.d/path/exemple.ini:/etc/php7/conf.d/exemple.ini:ro
          - /my/php-fpm.d/path:/etc/php7/php-fpm.d:ro
          - /my/sock/path:/run/php-fpm
        restart: unless-stopped
  
# Requires :  
( /my/php-fpm.d/path/**docker.conf** )  

    [global]
    daemonize = no
    error_log = /proc/self/fd/2
    log_limit = 8192
  
( /my/php-fpm.d/path/**www.conf** )  

    [www]
    user = www-data
    group = www-data
    listen = /run/php-fpm/www.sock
    listen.owner = nginx
    listen.group = nginx
    listen.mode = 0660
    ; ... your configuration here ... 
    catch_workers_output = yes
    decorate_workers_output = no
  
Host user :
  
    addgroup -g 82 -S www-data
    adduser -u 82 -D -S -H -h /my/data/path -s /sbin/nologin -G www-data www-data
  