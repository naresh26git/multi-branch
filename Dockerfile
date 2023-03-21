FROM tomcat:8.0

LABEL maintainer=”naresh”

COPY target/onlinebookstore.war /usr/local/tomcat/webapps/
