Official website : https://www.php.net/  
  
# Usage :
    version: "3.7"
    services:
      php:
        image: mihokookayami/php-fpm:latest
        container_name: php
        volumes:
          - /my/conf.d/path/exemple.ini:/etc/php8/conf.d/exemple.ini:ro
          - /my/php-fpm.d/path:/etc/php8/php-fpm.d:ro
        restart: unless-stopped