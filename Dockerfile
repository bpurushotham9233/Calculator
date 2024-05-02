FROM ubuntu
WORKDIR /app
RUN sudo apt update
RUN sudo insatll git -y
COPY . .
EXPOSE 8080
CMD ["java", "-jar", "app.jar"]    
