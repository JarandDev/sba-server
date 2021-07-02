#!/bin/bash

APP=sba-server
NET=jarand-net

docker build -t $APP:latest .

docker rm -f $APP || true

docker network create $NET || true

docker run -d --name $APP --network $NET -p 8090:8080 \
  $APP:latest
