FROM tomcat:8

# Remove the default ROOT application
#RUN rm -rf /usr/local/tomcat/webapps/

# Copy your Java WAR file to the container
COPY target/mybook.war /usr/local/tomcat/webapps/

# Expose the default Tomcat port
#EXPOSE 8080

# Start Tomcat when the container launches
#CMD ["catalina.sh", "run"]
