FROM openjdk:11 AS JAVA_VERSION
ARG JAR_FILE=target/booking-0.0.1-SNAPSHOT.jar
ADD ${JAR_FILE} booking_service.jar
ENTRYPOINT ["java","-jar","/booking_service.jar"]