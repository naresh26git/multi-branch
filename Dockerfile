FROM tomcat:8.0-alpine

LABEL maintainer=”deepak@softwareyoga.com”

copy target/newbook.war /usr/local/tomcat/webapps/

EXPOSE 8080
