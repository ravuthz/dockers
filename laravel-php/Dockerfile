# Set build arguments
ARG PHP_VERSION=8.3

FROM --platform=linux/amd64 php:${PHP_VERSION}-fpm

ARG NODE_VERSION=18.x

ENV COMPOSER_ALLOW_SUPERUSER 1
ENV COMPOSER_HOME /composer
ENV PATH $PATH:/composer/vendor/bin

WORKDIR /var/www/html/

RUN apt-get update
RUN apt-get install -y zip unzip iputils-ping build-essential
RUN apt-get install -y zlib1g-dev libzip-dev libpq-dev 
RUN docker-php-ext-install zip pdo_mysql pdo_pgsql

# default-mysql-client
# vim git curl default-mysql-client gnupg procps

# intl
RUN apt-get install -y libicu-dev \
  && docker-php-ext-configure intl \
  && docker-php-ext-install intl

# gd
RUN apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libpng-dev && \
docker-php-ext-configure gd --with-freetype=/usr/include/ --with-jpeg=/usr/include/ && \
docker-php-ext-install gd

# redis
#RUN pecl install redis && docker-php-ext-enable redis

# pcov
#RUN pecl install pcov && docker-php-ext-enable pcov

# Xdebug
# RUN pecl install xdebug \
# && docker-php-ext-enable xdebug \
# && echo ";zend_extension=xdebug" > /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

# Node.js, NPM, Yarn
RUN curl -fsSL "https://deb.nodesource.com/setup_${NODE_VERSION}" | bash -
RUN apt-get install -y nodejs
RUN npm install npm@latest -g
RUN npm install yarn -g

# Composer
# Install from Official Source by php - Just need php installed
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"
RUN mv composer.phar /usr/local/bin/composer

# Install from Official Source by sh, curl - Required curl installed
#RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN chown -R www-data:www-data /var/www/html/

EXPOSE 9000

ENTRYPOINT ["php-fpm"]
