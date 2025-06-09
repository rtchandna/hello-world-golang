#!/bin/bash

# Create the docker named volume for nginx config
docker volume create nginx-volume

# Volume for nginx certs
docker volume create nginx-certs

# Copy the nginx config to the Volume created via temporary container
docker run --rm -v nginx-volume:/config -v $(pwd)/nginx.conf:/tmp/nginx.conf alpine sh -c "cp /tmp/nginx.conf /config/nginx.conf"

# Copy the nginx certs to the Volume created via temporary container
docker run --rm -v nginx-certs:/certs -v $(pwd)/certs:/tmp alpine sh -c "cp /tmp/* /certs"

# Run the NGINX proxy container using the volume created
docker run -d --name nginx-proxy  --restart unless-stopped -p 443:443 -v nginx-volume:/etc/nginx -v nginx-certs:/etc/nginx/certs nginx:alpine