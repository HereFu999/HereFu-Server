FROM eclipse-temurin:17-jre
WORKDIR /app
COPY . .
RUN echo "eula=true" > eula.txt
CMD ["java","-Xmx2G","-Xms1G","-jar","paper-1.21.8-60.jar","nogui"]