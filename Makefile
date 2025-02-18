nginx:
	@docker build --platform linux/amd64,linux/arm64 \
		--build-arg NGINX_VERSION=1.25 -t ravuthz/laravel-nginx:1.25 ./nginx
	@echo "Build laravel-nginx"

php:
	@docker build --platform linux/amd64,linux/arm64 \
		--build-arg PHP_VERSION=8.3 -t ravuthz/laravel-php:8.3 ./php
	@echo "Build laravel-php"

php-supervisor:
	@docker build --platform linux/amd64,linux/arm64 \
		--build-arg PHP_VERSION=8.3 -t ravuthz/laravel-php:8.3-supervisor ./php-supervisor
	@echo "Build laravel-php-supervisor"

build: nginx php php-supervisor

buildx:
	@docker buildx build --platform linux/amd64,linux/arm64 \
		--build-arg NGINX_VERSION=1.25 -t ravuthz/laravel-nginx:1.25 ./nginx --push

	@docker buildx build --platform linux/amd64,linux/arm64 \
		--build-arg PHP_VERSION=8.3 -t ravuthz/laravel-php:8.3 ./php --push

	@docker buildx build --platform linux/amd64,linux/arm64 \
		--build-arg PHP_VERSION=8.3 -t ravuthz/laravel-php:8.3-supervisor ./php-supervisor --push


publish: build
	@docker push ravuthz/laravel-nginx:1.25
	@docker push ravuthz/laravel-php:8.3
	@docker push ravuthz/laravel-php:8.3-supervisor