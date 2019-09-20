FROM openjdk:8-jdk-alpine
VOLUME /tmp
COPY target/*.jar app.jar

# Debug Port
EXPOSE 8000
# JMX Port
EXPOSE 8010
# HTTP Port
EXPOSE 8080


ENTRYPOINT [ \
	"java", \
	"-agentlib:jdwp=transport=dt_socket,address=8000,server=y,suspend=n", \
	"-Djava.security.egd=file:/dev/./urandom", \
	"-Dcom.sun.management.jmxremote", \
	"-Dcom.sun.management.jmxremote.port=8010", \
	"-Dcom.sun.management.jmxremote.local.only=false", \
	"-Dcom.sun.management.jmxremote.authenticate=false", \
	"-jar","/app.jar"]
