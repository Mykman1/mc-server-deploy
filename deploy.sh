#/bin/bash

SERVER_VERSION=$1
SERVER_VERSION=${SERVER_VERSION:-1.16.3}

docker-compose build \
--build-arg SERVER_VERSION=${SERVER_VERSION}

docker-compose up -d
