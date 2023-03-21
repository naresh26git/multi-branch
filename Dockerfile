FROM tomcat:8.0-alpine

LABEL maintainer=”naresh”

COPY target/onlinebookstore.war /usr/local/tomcat/webapps/

EXPOSE 8080

