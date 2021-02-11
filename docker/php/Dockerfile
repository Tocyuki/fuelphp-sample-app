FROM php:7.4.6-fpm

ENV COMPOSER_ALLOW_SUPERUSER=1 \
    COMPOSER_HOME=/composer

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN apt-get update \
 && apt-get install -y \
    git \
    curl \
    libmcrypt-dev \
    zip \
    unzip \
    libzip-dev \
    default-mysql-client \
 && curl https://get.fuelphp.com/oil | sh
