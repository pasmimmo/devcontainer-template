FROM mcr.microsoft.com/openjdk/jdk:17-distroless

COPY target/*.jar app.jar

CMD ["-Xmx256m", "-jar", "/app.jar"]