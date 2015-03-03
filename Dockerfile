FROM shafan/php5_apache_with_french_locale

# install the PHP extensions we need
RUN apt-get update && apt-get install -y libmcrypt-dev libpng12-dev libjpeg-dev \
    libfreetype6-dev libjpeg62-turbo-dev php5-pecl-http \
    &&  rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr
RUN docker-php-ext-install pdo pdo_mysql mcrypt gd mbstring

RUN pecl install memcache
COPY ext-memcache.ini /usr/local/etc/php/conf.d/

CMD ["apache2-foreground"]
