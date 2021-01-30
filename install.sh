#!/usr/bin/env bash

APPNAME="gitea"

mkdir -p "$DATADIR" && chmod -Rf 777 "$DATADIR"

if docker ps -a | grep "$APPNAME" >/dev/null 2>&1; then
  docker pull gitea/gitea:latest && docker restart "$APPNAME"
else
  docker run -d \
    --name "$APPNAME" \
    --privileged \
    -v "$DATADIR":/data \
    -p 3000:3000 \
    -p 7822:7822 \
    --restart=always \
    gitea/gitea:latest
fi
