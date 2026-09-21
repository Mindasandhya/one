# Stage 1 - Build Application

FROM maven 
COPY . .
RUN mvn clean install

