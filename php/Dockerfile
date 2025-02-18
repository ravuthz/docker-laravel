ARG PHP_VERSION=8.3.15

FROM php:${PHP_VERSION}-fpm-alpine3.21

ENV COMPOSER_VERSION=2.8.4

RUN echo "UTC" > /etc/timezone

# ENV COMPOSER_ALLOW_SUPERUSER=1
# ENV COMPOSER_HOME=/composer
# ENV PATH=$PATH:/composer/vendor/bin

RUN apk add --update --no-cache git zip wget curl bash sudo shadow

COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/local/bin/
# ADD --chmod=0755 https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/
RUN install-php-extensions gd zip pcntl bcmath sockets opcache pdo_mysql pdo_pgsql

COPY --from=composer:2.8.4 /usr/bin/composer /usr/bin/composer

# Installing composer from official repository
# RUN curl -sS https://getcomposer.org/installer -o composer-setup.php
# RUN php composer-setup.php --install-dir=/usr/local/bin --filename=composer
# RUN rm -rf composer-setup.php

RUN rm -rf /var/cache/apk/*

RUN chown -R www-data:www-data /var/www/html

WORKDIR /var/www/html

EXPOSE 9000

CMD ["php-fpm"]