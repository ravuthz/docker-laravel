ARG PHP_VERSION=8.3.15

FROM php:${PHP_VERSION}-fpm-alpine3.21

ENV COMPOSER_VERSION=2.8.4

RUN echo "UTC" > /etc/timezone

RUN apk add --update --no-cache git zip wget curl bash sudo shadow supervisor nodejs npm

COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/local/bin/

RUN install-php-extensions gd zip pcntl bcmath sockets opcache pdo_mysql pdo_pgsql

COPY --from=composer:2.8.4 /usr/bin/composer /usr/bin/composer

RUN rm -rf /var/cache/apk/*

RUN chown -R www-data:www-data /var/www/html

WORKDIR /var/www/html

EXPOSE 7000 8000 9000 7070 8080 9090

CMD ["php-fpm"]