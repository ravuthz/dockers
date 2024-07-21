# PHP CLI

```bash
docker run -it ravuthz/php-cli:8-3 bash
docker run -it ravuthz/php-cli:8-3 composer -V
```

## Build image and push to docker hub

```bash
docker build -t ravuthz/php-cli:8.2 --build-arg VERSION_PHP=8.2 --no-cache ./php-cli
docker push ravuthz/php-cli:8.2

docker build -t ravuthz/php-cli:8.3 --build-arg VERSION_PHP=8.3 --no-cache ./php-cli
docker push ravuthz/php-cli:8.3


curl -s "https://laravel.build/example-app?with=mysql,redis" | bash

curl -s "https://laravel.build/example-app?with=pgsql,redis" | bash
curl -s "https://laravel.build/example-app?with=pgsql,redis&devcontainer" | bash


docker compose -f .devcontainer/docker-compose.yaml up

docker compose -f .devcontainer/docker-compose.yaml up --build --force-recreate

docker run -it --rm --network laravel-net postgres psql -h pgsql -U adminz -d 'laravel-api'
psql -h localhost -U adminz -d laravel-api

http://localhost:9090/?pgsql=db_pgsql&username=adminz&db=laravel-api

https://github.com/mlocati/docker-php-extension-installer

```
