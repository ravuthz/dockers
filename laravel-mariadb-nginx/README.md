# Laravel 9 with MariaDB on Nginx

```bash
# Run & build all services with specific environment variables (./backend/app/.env)
docker compose --env-file ./backend/app/.env up --build --force-recreate -d 

# Run & build all services with default environment variables (./env)
docker-compose up --build --force-recreate -d

# List all services
docker-compose ps

# Clean and install all dependencies for laravel app
docker-compose exec backend ls -lah
docker-compose exec backend rm -rf vendor composer.lock
docker-compose exec backend composer install
docker-compose exec backend php artisan key:generate

# Refresh migrations for development
docker-compose exec backend php artisan migrate:fresh
docker-compose exec backend php artisan tinker
# docker-compose exec backend php artisan tinker --execute "User::count()"


# Test running applocation
curl -I http://localhost:8080/

```