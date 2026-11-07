# Use official Tomcat base image
FROM tomcat:9.0-jdk17-corretto

# Optional: Remove default webapps to keep container lightweight
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy the built WAR file from the target directory into Tomcat's webapps
COPY target/clothing-store.war /usr/local/tomcat/webapps/ROOT.war

# Expose container port
EXPOSE 8080

# Start Tomcat server
CMD ["catalina.sh", "run"]
