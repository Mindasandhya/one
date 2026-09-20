# Stage 1 - Build Application

FROM maven:3.9.6-eclipse-temurin-8 AS builder

WORKDIR /app

COPY . .

RUN mvn clean package

# Stage 2 - Deploy to Tomcat

FROM tomcat:8.0.20-jre8

COPY tomcat-users.xml /usr/local/tomcat/conf/

COPY --from=builder /app/target/*.war /usr/local/tomcat/webapps/myweb.war

EXPOSE 8080

CMD ["catalina.sh", "run"]
