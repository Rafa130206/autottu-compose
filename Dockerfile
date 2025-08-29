# Stage 1: Build (Maven + Temurin JDK 21)
FROM maven:3.9.9-eclipse-temurin-21 AS build
WORKDIR /app

COPY pom.xml .
RUN mvn -q dependency:go-offline

COPY src ./src
RUN mvn -q clean package -DskipTests

# Stage 2: Runtime (OpenJDK slim para ficar leve)
FROM openjdk:21-slim
WORKDIR /app

COPY --from=build /app/target/*-SNAPSHOT.jar app.jar

ENV DB_HOST=mysql \
    DB_PORT=3306 \
    DB_NAME=autottu \
    DB_USER=root \
    DB_PASS=root

EXPOSE 8080
ENTRYPOINT ["java","-jar","app.jar"]

