# Use an official JDK runtime as a parent image
FROM openjdk:17-jdk-slim

# Set the working directory in the container
WORKDIR /app

# Copy the JAR file from the target directory to the container
COPY target/*.jar app01.jar

# Expose the application's port (change if needed)
EXPOSE 8081

# Run the application
ENTRYPOINT ["java", "-jar", "app01.jar"]
