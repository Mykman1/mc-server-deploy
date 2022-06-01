#/bin/bash

docker stop mcserver
docker rm $(docker ps -a -q -f status=exited)
docker build --rm -t mcserver .
docker run -d --name mcserver -p 25565:25565 mcserver
