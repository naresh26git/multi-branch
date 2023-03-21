FROM tomcat:8.0-alpine

LABEL maintainer=”deepak@softwareyoga.com”

ADD newbook.war /usr/local/tomcat/webapps/

EXPOSE 8080
