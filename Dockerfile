FROM google/cloud-sdk:alpine

RUN apk add --no-cache \
    grep \
    openjdk17-jre-headless \
    screen

WORKDIR /mc

ARG SERVER_VERSION
RUN wget \
    -c $(wget -qO- https://mcversions.net/download/${SERVER_VERSION} \
            | grep -Po https://piston-data\.mojang\.com/v1/objects/[0-9a-f]{40}/server\.jar) \
    -O minecraft_server.jar

COPY server.properties eula.txt ./
COPY backup_daily.sh /etc/periodic/daily/
COPY backup_weekly.sh /etc/periodic/weekly/
