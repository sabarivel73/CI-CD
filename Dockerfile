FROM openjdk:17
WORKDIR /app
COPY target/CI-CD-0.0.1-SNAPSHOT.jar /app
EXPOSE 8080
CMD ["java","-jar","CI-CD-0.0.1-SNAPSHOT.jar"]