FROM ubuntu:18.04

RUN apt-get update \
&& apt-get install -y \
wget=1.19.4-1ubuntu2.2 \
curl=7.58.0-2ubuntu3.19 \
default-jre=2:1.11-68ubuntu1~18.04.1 \
openjdk-17-jre-headless=17.0.3+7-0ubuntu0.18.04.1 \
&& rm -rf /var/lib/apt/lists/*

WORKDIR /app

ARG SERVER_VERSION
RUN wget -c "$(curl https://mcversions.net/download/${SERVER_VERSION} | grep -Po https://launcher\.mojang\.com/v1/objects/[0-9a-f]{40}/server\.jar)" -O minecraft_server.jar

COPY server.properties eula.txt /app/
