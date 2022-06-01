FROM ubuntu:18.04

RUN apt-get update
RUN apt-get install wget curl default-jre openjdk-17-jre-headless -y

ENV mc_tag=1.16.3
RUN wget -c "$(curl https://mcversions.net/download/${mc_tag} | grep -o https://launcher\.mojang.*server\.jar)" -O minecraft_server.jar

COPY server.properties server.properties
COPY eula.txt eula.txt

CMD ["java", "-Xmx1024M", "-Xms1024M", "-jar", "minecraft_server.jar", "nogui"]