FROM php:8.2-fpm-alpine

LABEL maintainer="Dedy Irawan <dedy.irawan.inc@gmail.com>"

RUN apk update
RUN apk upgrade

RUN apk add --update --no-cache autoconf
RUN apk add --update --no-cache g++
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
RUN docker-php-ext-install zip

RUN docker-php-ext-enable mysqli

RUN kill -USR2 1

CMD ["php-fpm"]
