FROM tomcat:8.0

COPY target/onlinebookstore.war /usr/local/tomcat/webapps/
