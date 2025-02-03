ARG NGINX_VERSION=1.25.3

FROM nginx:${NGINX_VERSION}-alpine3.18

RUN mkdir -p /var/www/html && \
    addgroup -g 82 www-data || addgroup www-data && \
    adduser -u 82 -G www-data -s /sbin/nologin -D www-data || \
    adduser -G www-data -s /sbin/nologin -D www-data

RUN apk add --update --no-cache git zip bash sudo shadow

RUN rm -rf /var/cache/apk/*

RUN chown -R www-data:www-data /var/www/html

WORKDIR /var/www/html

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]