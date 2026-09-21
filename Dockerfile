# Stage 1 - Build Application

FROM maven 
COPY . .
RUN mvn clean install

#stage2 for deploy the application
FROM tomcat:9.0
COPY tomcat-users.xml /usr/local/tomcat/conf/
COPY --from=builder /app/target/*.war /usr/local/tomcat/webapps/myweb.war
CMD ["catalina.sh", "run"]
