# Run default container will run the php-frm

```bash
docker run -it --rm -p 9000:9000 ravuthz/laravel-php:8.3
# [13-Jan-2025 09:13:40] NOTICE: fpm is running, pid 1
# [13-Jan-2025 09:13:40] NOTICE: ready to handle connections
```

# Check php, composer version in running container

```bash
docker run -it --rm -p 9000:9000 ravuthz/laravel-php:8.3 php -v
# PHP 8.3.15 (cli) (built: Jan  8 2025 20:00:52) (NTS)
# Copyright (c) The PHP Group
# Zend Engine v4.3.15, Copyright (c) Zend Technologies
#     with Zend OPcache v8.3.15, Copyright (c), by Zend Technologies

docker run -it --rm -p 9000:9000 ravuthz/laravel-php:8.3 composer -V
# Composer version 2.8.4 2`024-12-11 11:57:47
# PHP version 8.3.15 (/usr/local/bin/php)
# Run the "diagnose" command to get more detailed diagnostics output.`
```

# Running with docker command in project with src directory

```bash
# List all files in current project directory
docker run --rm -p 9000:9000 \
    -v $(pwd):/var/www/html \
    ravuthz/laravel-php:8.3 ls -lah

# Run the php localhost server with src directory as public directory
docker run --rm -p 9000:9000 \
    -v $(pwd):/var/www/html \
    ravuthz/laravel-php:8.3 php -S 0.0.0.0:9000 -t ./src/

# Run the laravel server with current laravel project directory
docker run --rm -p 8000:8000 \
    -v $(pwd):/var/www/html \
    ravuthz/laravel-php:8.3 php artisan serve --host=0.0.0.0

```

# Run use docker compose

```bash
# docker-compose.yml
services:
  php:
    image: "ravuthz/laravel-php:8.3"
    ports:
      - "8000:8000"
      - "9000:9000"
    volumes:
      - ./src:/var/www/html

  nginx:
    image: "ravuthz/laravel-nginx:1.25"
    ports:
      - "90:80"
    volumes:
      - ./src:/var/www/html
      - ./nginx/config/default.conf:/etc/nginx/conf.d/default.conf
      - ./nginx/config/nginx.conf:/etc/nginx/nginx.conf
    # command: ls -lah /var/www/html
    command: nginx -g "daemon off;"
    healthcheck:
      test: ["CMD", "curl", "-f", "http://localhost:90"]
      interval: 30s
      timeout: 30s
      retries: 5
      start_period: 30s
    depends_on:
      php:
        condition: service_healthy

```

```bash

docker compose build
# docker compose push php nginx

docker compose up --build --force-recreate
docker compose up --build --force-recreate -d

docker compose down

docker compose ps

# docker compose push php nginx

```

```bash

docker build --build-arg PHP_VERSION=8.3 -t ravuthz/laravel-php:8.3 ./php

docker run -it --rm -p 9000:9000 ravuthz/laravel-php:8.3

docker run --rm -p 9000:9000 -v $(pwd)/php:/var/www/html ravuthz/laravel-php:8.3 php -S 0.0.0.0:9000 -t /var/www/html

docker run --rm -p 9000:9000 -v $(pwd):/var/www/html ravuthz/laravel-php:8.3 php artisan serve --host=0.0.0.0 --port=9000

curl http://localhost:9000/api

docker run --rm -p 8000:8000 -v $(pwd):/var/www/html ravuthz/laravel-php:8.3 php artisan serve --host=0.0.0.0

docker run --rm -p 8000:8000 -p 9000:9000 -v $(pwd):/var/www/html ravuthz/laravel-php:8.3 php artisan serve --host=0.0.0.0 --port=9000

docker run --rm -p 8000:8000 -p 9000:9000 -v $(pwd):/var/www/html ravuthz/laravel-php:8.3 serve

docker run --rm -p 9000:9000 ravuthz/laravel-php:8.3 composer -V

docker run --rm --interactive --tty composer -V

```
