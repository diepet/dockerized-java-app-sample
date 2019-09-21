FROM openjdk:8-jdk-alpine

# Copy the Spring Boot fat JAR built as /app.jar inside the container
COPY target/*.jar app.jar

# Debug Port
EXPOSE 8000
# HTTP Port
EXPOSE 8080
# JMX Port
EXPOSE 9010

# Java launcher
ENTRYPOINT [ \
	"java", \
	"-agentlib:jdwp=transport=dt_socket,address=8000,server=y,suspend=n", \
	"-Djava.security.egd=file:/dev/./urandom", \
	"-Dcom.sun.management.jmxremote", \
	"-Dcom.sun.management.jmxremote.port=9010", \
	"-Dcom.sun.management.jmxremote.local.only=false", \
	"-Dcom.sun.management.jmxremote.authenticate=false", \
	"-Dcom.sun.management.jmxremote.ssl=false", \
	"-jar","/app.jar"]
