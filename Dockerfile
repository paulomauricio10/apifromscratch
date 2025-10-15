# Multi-stage build para Spring Boot
FROM eclipse-temurin:21-jdk AS build
WORKDIR /app
COPY api/pom.xml ./api/pom.xml
COPY api/mvnw api/mvnw.cmd ./api/
COPY api/.mvn ./api/.mvn
RUN --mount=type=cache,target=/root/.m2 \
    cd api && ./mvnw -q dependency:go-offline
COPY api ./api
RUN --mount=type=cache,target=/root/.m2 cd api && ./mvnw -q -DskipTests package

FROM eclipse-temurin:21-jre AS runtime
WORKDIR /app
# Copiar jar gerado
COPY --from=build /app/api/target/api-*.jar app.jar
EXPOSE 8080
ENV JAVA_OPTS=""
ENTRYPOINT ["sh","-c","java $JAVA_OPTS -jar app.jar"]
