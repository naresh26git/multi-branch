FROM tomcat:8.0-alpine

LABEL maintainer=”naresh”

ADD onlinebookstore.war /usr/local/tomcat/webapps/

EXPOSE 8080

CMD [“catalina.sh”, “run”]
