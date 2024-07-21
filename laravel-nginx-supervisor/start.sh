#!/bin/bash

ls -lah

composer install --quiet --no-dev --no-progress --no-suggest --no-interaction --optimize-autoloader

php artisan key:generate

php artisan optimize:clear

php artisan optimize

php artisan storage:link
