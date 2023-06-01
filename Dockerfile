# Use an official Tomcat base image
FROM tomcat:latest

# Set the working directory to Tomcat webapps directory
WORKDIR /usr/local/tomcat/webapps

# Remove default Tomcat application
RUN rm -rf ROOT

# Copy the war file of your web application to the Tomcat webapps directory
COPY onlinebookstore.war ROOT.war

# Expose the default Tomcat port
EXPOSE 8080

# Start Tomcat when the container launches
CMD ["catalina.sh", "run"]
