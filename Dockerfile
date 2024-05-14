# Use the base image with JDK
FROM adoptopenjdk/openjdk11:alpine

# Set the working directory
WORKDIR /opt/app

# Install Maven and run Maven build
RUN apk --no-cache add maven && \
    apk --no-cache add openjdk11

COPY . ./

RUN mvn clean package

CMD ["java","-jar", "target/spring-boot-web.jar"]
