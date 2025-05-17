FROM maven:3.9.8-eclipse-temurin-21 AS build
WORKDIR /app
COPY pom.xml .
RUN mvn -q dependency:go-offline

COPY src ./src
RUN mvn -q clean package -DskipTests

FROM eclipse-temurin:21-jre
WORKDIR /app

COPY --from=build /app/target/*-SNAPSHOT.jar app.jar

ENV DB_HOST=oracle-xe \
    DB_PORT=1521 \
    DB_SID=XE \
    DB_USER=system \
    DB_PASS=oracle

EXPOSE 8080
ENTRYPOINT ["java","-jar","app.jar"]
