# Use a base image with JRE pre-installed
FROM openjdk:11-jre-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the JAR file from the host into the container
COPY target/Calculator-1.0-SNAPSHOT.jar /app/app.jar

# Expose any ports your application uses
EXPOSE 8082

# Specify the command to run your application when the container starts
CMD ["java", "-jar", "app.jar"]
