help:
	@echo "Usage: make [target]"
	@echo "\nTargets:"
	@echo "  clear-all: Force Clear all resources"
	@echo "  build-laravel-php: Build Laravel PHP image"

clear-all:
	docker system prune -af
	docker image prune -af
	docker volume prune -af
	docker network prune -af
	docker builder prune -af

build-laravel-php:
	# PHP 8.3
	@echo "Building & Publish Laravel PHP 8.3"
	@docker buildx build --platform=linux/amd64 \
		-t ravuthz/laravel-php:8.3 \
		-f ./laravel-php/Dockerfile \
		--build-arg PHP_VERSION=8.3 --build-arg NODE_VERSION=20.x ./laravel-php/
	@docker push ravuthz/laravel-php:8.3
	# PHP 8.3-fpm
	@echo "Building & Publish Laravel PHP 8.3 - FPM"
	@docker buildx build --platform=linux/amd64 \
		-t ravuthz/laravel-php:8.3-fpm \
		-f ./laravel-php/Dockerfile.fpm \
		--build-arg PHP_VERSION=8.3 --build-arg NODE_VERSION=20.x ./laravel-php/
	@docker push ravuthz/laravel-php:8.3-fpm
	# PHP 8.3-alpine
	@echo "Building & Publish Laravel PHP 8.3 - Alpine"
	@docker buildx build --platform=linux/amd64 \
		-t ravuthz/laravel-php:8.3-alpine \
		-f ./laravel-php/Dockerfile.alpine \
		--build-arg PHP_VERSION=8.3 --build-arg NODE_VERSION=20.x ./laravel-php/
	@docker push ravuthz/laravel-php:8.3-alpine	