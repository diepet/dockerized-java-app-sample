FROM openjdk:8-jdk-alpine
VOLUME /tmp
COPY target/*.jar app.jar


ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-Dcom.sun.management.jmxremote", "-Dcom.sun.management.jmxremote.port=8010", "-Dcom.sun.management.jmxremote.local.only=false", "-Dcom.sun.management.jmxremote.authenticate=false", "-Dcom.sun.management.jmxremote.ssl=false", "-jar","/app.jar"]
