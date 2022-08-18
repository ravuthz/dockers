# Build and Run Spring Boot with PostgreSQL on Docker

### Go to Spring Boot with PostgreSQL project if existing or create one using the following this [link](https://start.spring.io/#!type=maven-project&language=java&platformVersion=2.7.2&packaging=jar&jvmVersion=11&groupId=com.docker&artifactId=sb_postgres&name=sb_postgres&description=Spring%20Boot%20with%20PostgreSQL%20database&packageName=com.docker.sb_postgres&dependencies=lombok,actuator,web,postgresql)

```bash

mkdir springboot_postgresql
cd springboot_postgresql
```

### Dockerfile and docker-compose.yml files
```bash
touch Dockerfile
touch docker-compose.yml
```

### Start build and run the docker compose all services
```bash
docker-compose up --build --force-recreate -d
# time docker-compose up --build --force-recreate -d

docker-compose logs
```

### Test the services
```bash

docker ps

docker exec -it springboot-postgres_api_1 bash
docker exec -it springboot-postgres_db_1 psql -U postgres

docker compose exec -it api bash
docker compose exec -it db psql -U postgres


curl -i http://localhost:8080/actuator/health

```