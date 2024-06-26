FROM maven:3.5.2-jdk-8-alpine AS MAVEN_BUILD

COPY pom.xml /build/
COPY src /build/src/
WORKDIR /build/
RUN mvn package

FROM openjdk:8-jre-alpine
WORKDIR /app
COPY --from=MAVEN_BUILD /build/target/*.jar /app/app.jar

RUN addgroup -S spring && adduser -S spring -G spring
USER spring:spring
ENTRYPOINT ["java", "-jar", "app.jar"]    
