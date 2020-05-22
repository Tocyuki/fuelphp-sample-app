FROM php:7.4.6-fpm

RUN apt-get update \
 && apt-get install -y git curl libmcrypt-dev zip unzip \
 && curl https://get.fuelphp.com/oil | sh

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/sample_app
