# Set build arguments
ARG VERSION_PHP=8.3

FROM php:${VERSION_PHP}-fpm

ENV TZ=UTC
ENV APT_PACKAGES="vim git curl gnupg procps iputils-ping"
ENV PHP_EXTENSIONS="zip pdo_mysql pdo_pgsql pgsql"

ENV COMPOSER_ALLOW_SUPERUSER 1
ENV COMPOSER_HOME /composer
ENV PATH $PATH:/composer/vendor/bin

RUN apt-get update \
  && apt-get install -y unzip build-essential zlib1g-dev libzip-dev libpq-dev gnupg procps \
  && apt-get install -y $APT_PACKAGES \
  && docker-php-ext-install $PHP_EXTENSIONS

RUN apt-get install -y libicu-dev \
  && docker-php-ext-configure intl \
  && docker-php-ext-install intl

RUN apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libpng-dev && \
docker-php-ext-configure gd --with-freetype=/usr/include/ --with-jpeg=/usr/include/ && \
docker-php-ext-install gd

RUN rm -rf /var/lib/apt/lists/*

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"
RUN mv composer.phar /usr/local/bin/composer

CMD ["/bin/sh"]

