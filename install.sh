#!/usr/bin/env bash

APPNAME="gitea"
DOCKER_HUB_URL="gitea/gitea:latest"

sudo mkdir -p "$DATADIR"
sudo chmod -Rf 777 "$DATADIR"

if docker ps -a | grep "$APPNAME" >/dev/null 2>&1; then
  sudo docker pull "$DOCKER_HUB_URL"
  sudo docker restart "$APPNAME"
else
  sudo docker run -d \
    --name "$APPNAME" \
    --privileged \
    -v "$DATADIR":/data \
    -p 3000:3000 \
    -p 7822:7822 \
    --restart=always \
    "$DOCKER_HUB_URL"
fi
