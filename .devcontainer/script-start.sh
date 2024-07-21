#!/bin/sh

# ls -lah
# whoami && pwd

composer require laravel/octane

php artisan octane:install --server=frankenphp

php artisan octane:start --server=frankenphp --port=9000 --workers=1 --host=0.0.0.0
