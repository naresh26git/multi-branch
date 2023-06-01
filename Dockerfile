FROM tomcat:9
COPY target/newbook*.war /usr/local/tomcat/webapps/
