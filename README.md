Official website : https://www.php.net/  
  
# Usage :
      php:
        image: mihokookayami/php-fpm:latest
        container_name: php
        volumes:
          - /my/conf.d/path/opache.ini:/etc/php8/conf.d/opache.ini:ro
    	  - /my/php-fpm.d/path/www.conf:/etc/php8/php-fpm.d/www.conf:ro
        restart: unless-stopped