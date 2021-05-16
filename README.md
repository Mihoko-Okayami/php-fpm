Official website : https://www.php.net/  
  
# Usage :
    version: "3.7"
    services:
      php:
        image: mihokookayami/php-fpm:latest
        container_name: php
        volumes:
          - /my/conf.d/path/exemple.ini:/etc/php8/conf.d/exemple.ini:ro
          - /my/php-fpm.d/path/www.conf:/etc/php8/php-fpm.d/www.conf:ro
        restart: unless-stopped