FROM tomcat:9-jdk17

COPY taxi-booking/target/*.war /usr/local/tomcat/webapps/taxi.war

EXPOSE 8080
