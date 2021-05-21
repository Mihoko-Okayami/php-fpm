Official website : https://www.php.net/  
  
# Usage :  
    version: "3.7"
    services:
      php:
        image: mihokookayami/php-fpm:latest
        container_name: php
        volumes:
          - /my/conf.d/path/exemple.ini:/usr/local/etc/php/conf.d/exemple.ini:ro
          - /my/php-fpm.d/path:/usr/local/etc/php-fpm.d:ro
        restart: unless-stopped
  
# Requires :  
( /my/php-fpm.d/path/**docker.conf** )  

    [global]
    daemonize = no
    error_log = /proc/self/fd/2
    log_limit = 8192
  
( /my/php-fpm.d/path/**www.conf** )  

    [www]
    ; ... your configuration here ... 
    catch_workers_output = yes
    decorate_workers_output = no
