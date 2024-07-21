FROM php:8.3-fpm

RUN apt-get update \
  && apt-get install -y iputils-ping unzip build-essential zlib1g-dev libzip-dev libpq-dev default-mysql-client \
  && docker-php-ext-install zip pdo_mysql pdo_pgsql pgsql

RUN apt-get install -y vim git curl gnupg procps nginx supervisor openssh-client

RUN apt-get install -y libicu-dev \
  && docker-php-ext-configure intl \
  && docker-php-ext-install intl

RUN apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libpng-dev && \
docker-php-ext-configure gd --with-freetype=/usr/include/ --with-jpeg=/usr/include/ && \
docker-php-ext-install gd

RUN curl -fsSL "https://deb.nodesource.com/setup_18.x" | bash -
RUN apt-get install -y nodejs
RUN npm install npm@latest -g
RUN npm install yarn -g

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"
RUN mv composer.phar /usr/local/bin/composer

ENV COMPOSER_ALLOW_SUPERUSER 1
ENV COMPOSER_HOME /composer
ENV PATH $PATH:/composer/vendor/bin

WORKDIR /var/www

COPY . /var/www

RUN chown -R www-data:www-data /var/www/

RUN chmod +x ./start.sh && ./start.sh

COPY ./docker/nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./docker/nginx/default.conf /etc/nginx/sites-available/default.conf
RUN ln -s /etc/nginx/sites-available/default.conf /etc/nginx/sites-enabled/default.conf

COPY ./docker/supervisor.conf /etc/supervisor/conf.d/supervisor.conf

EXPOSE 80 443
CMD ["/usr/bin/supervisord"]
