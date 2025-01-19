FROM php:5.6-fpm-alpine

LABEL maintainer="Dedy Irawan <dedy.irawan.inc@gmail.com>"

RUN apk update
RUN apk upgrade

RUN apk add --update --no-cache autoconf
RUN apk add --update --no-cache g++
RUN apk add --update --no-cache imagemagick
RUN apk add --update --no-cache imagemagick-dev
RUN apk add --update --no-cache icu-dev
RUN apk add --update --no-cache libpng-dev
RUN apk add --update --no-cache libtool
RUN apk add --update --no-cache libzip-dev
RUN apk add --update --no-cache make
RUN apk add --update --no-cache pcre-dev

RUN docker-php-ext-install exif
RUN docker-php-ext-install gd
RUN docker-php-ext-install intl
RUN docker-php-ext-install mysqli
RUN docker-php-ext-install opcache
RUN docker-php-ext-install zip

RUN printf "\n" | pecl install -o -f imagick

RUN docker-php-ext-configure opcache --enable-opcache

RUN docker-php-ext-enable imagick
RUN docker-php-ext-enable mysqli

RUN kill -USR2 1

CMD ["php-fpm"]
