# docker image for prestashop container
Docker image to run Prestashop (with memcached and french locale)

##Running the docker image with docker-compose
```
prestashop:
    image: shafan:php-for-prestashop
    restart: always
    ports: 
        - ":80"
    links:
        - yout-mysql-container:mysql
        - yout-memcached-container:memcached
    volumes:
        - /yout-code-folder:/var/www/html 
```
