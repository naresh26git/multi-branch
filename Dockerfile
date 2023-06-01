FROM tomcat:8.0.20-jre8
# Take the war and copy to webapps of tomcat
COPY target/newbook.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["cataline.sh","run"]
