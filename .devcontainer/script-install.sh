#!/bin/sh

# docker ps
# frankenphp -v

# frankenphp validate --config /etc/caddy/Caddyfile
# frankenphp fmt /etc/caddy/Caddyfile --overwrite
# frankenphp run --config /etc/caddy/Caddyfile

# ls -lah

composer -V

composer install --quiet --no-progress --no-suggest --no-interaction --optimize-autoloader

php artisan migrate:fresh --seed --force
