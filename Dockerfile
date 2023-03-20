FROM tomcat9
# Take the war and copy to webapps of tomcat
COPY output/*.newbook.war /usr/local/tomcat9/webapps/
