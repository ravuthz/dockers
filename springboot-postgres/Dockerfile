# FROM maven:3.8-openjdk-11-slim AS BUILDER
FROM openjdk:11-jdk-slim AS BUILDER

# COPY ./app/pom.xml /build/
# COPY ./app/src /build/src/
# COPY ./app/.mvn /build/.mvn/
# COPY ./app/mvnw /build/mvnw
COPY ./app /build/

WORKDIR /build/
# RUN mvn package -DskipTests
RUN ./mvnw package -DskipTests

FROM openjdk:11-jdk-slim
WORKDIR /app
COPY --from=BUILDER /build/target/app.jar /app/

ENTRYPOINT ["java", "-jar", "app.jar"]