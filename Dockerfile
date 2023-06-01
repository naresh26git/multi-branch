FROM tomcat:9
COPY target/onlinebookstore*.war /usr/local/tomcat/webapps/
