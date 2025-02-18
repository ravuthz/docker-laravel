ARG PHP_VERSION=8.3.15

FROM php:${PHP_VERSION}-fpm-alpine3.21

RUN echo "UTC" > /etc/timezone

RUN apk add --update --no-cache git zip wget curl bash sudo shadow supervisor dcron nodejs npm && rm -rf /var/cache/apk/*

COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/local/bin/

RUN install-php-extensions gd zip intl pcntl bcmath sockets opcache pdo_mysql pdo_pgsql

COPY --from=composer:2.8.4 /usr/bin/composer /usr/bin/composer

RUN mkdir -p /var/run && chmod 777 /var/run

RUN mkdir -p /var/log/supervisor /etc/supervisor/conf.d

RUN chown -R www-data:www-data /var/www/html

WORKDIR /var/www/html

RUN git config --global --add safe.directory /var/www/html

EXPOSE 9000

CMD ["php-fpm"]