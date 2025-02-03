ARG NODE_VERSION=20.18.1

FROM node:${NODE_VERSION}-alpine3.21

RUN apk add --update --no-cache git zip bash sudo shadow

RUN mkdir -p /var/www/html && \
    addgroup -g 82 www-data || addgroup www-data && \
    adduser -u 82 -G www-data -s /sbin/nologin -D www-data || \
    adduser -G www-data -s /sbin/nologin -D www-data

RUN rm -rf /var/cache/apk/*

RUN chown -R www-data:www-data /var/www/html

WORKDIR /var/www/html

EXPOSE 3000 4000

CMD ["node"]



