build:
	docker build --platform linux/amd64,linux/arm64 \
		--build-arg NGINX_VERSION=1.25.3 -t ravuthz/laravel-nginx:1.25 ./nginx

	docker build --platform linux/amd64,linux/arm64 \
		--build-arg PHP_VERSION=8.3 -t ravuthz/laravel-php:8.3 ./php

	docker build --platform linux/amd64,linux/arm64 \
		--build-arg PHP_VERSION=8.3 -t ravuthz/laravel-php:8.3-supervisor ./php-supervisor

publish: build
	docker push ravuthz/laravel-nginx:1.25

	docker push ravuthz/laravel-php:8.3

	docker push ravuthz/laravel-php:8.3-supervisor