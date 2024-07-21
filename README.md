# Laravel PHP Docker Images

```bash

docker login -u <username> -p <password> https://index.docker.io/v1/

cd laravel-php

# Build the 'ravuthz/laravel-php' image and push to docker hub
docker build -t ravuthz/laravel-php . --build-arg PHP_VERSION=8.3 --build-arg NODE_VERSION=20.x
docker push ravuthz/laravel-php

# Build the 'ravuthz/laravel-php:8.3' image and push to docker hub
docker build -f ./Dockerfile.fpm -t ravuthz/laravel-php:8.3 . \
--build-arg PHP_VERSION=8.3 --build-arg NODE_VERSION=20.x
docker push ravuthz/laravel-php:8.3

# Build the 'ravuthz/laravel-php:8.3-alpine' image and push to docker hub
docker buildx build --platform=linux/amd64 -t ravuthz/laravel-php:8.3-alpine \
-f ./Dockerfile.alpine --build-arg PHP_VERSION=8.3 --build-arg NODE_VERSION=20.x .
docker push ravuthz/laravel-php:8.3-alpine

# Running the 'ravuthz/laravel-php:8.3-alpine' image
docker run --rm --platform linux/amd64 --name laravel-php -p 9999:80 -v $(pwd):/var/www/html ravuthz/laravel-php:8.3-alpine

docker run -it --platform linux/amd64 ravuthz/laravel-php:8.3-alpine /bin/sh -v $(pwd):/var/www/html

# Access the container shell
docker exec -it laravel-php /bin/sh
docker exec -it laravel-php composer -V
docker exec -it laravel-php frankenphp -v

```
