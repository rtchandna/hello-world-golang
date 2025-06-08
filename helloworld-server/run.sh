#!/bin/bash

docker build -t helloworld-server .

# Ensures that the containers will restart if they fail for some reason.
docker run -d --restart unless-stopped --name helloworld -e LISTEN_PORT=8080 -p 8080:8080 helloworld-server
