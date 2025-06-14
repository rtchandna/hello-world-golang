# Hello-world-runtime Containerised 
  Simple Hello World App written in golang Listens on a port from `LISTEN_PORT` env var and Responds with "Hello, World!"

# Services used
  * Docker for containerisation. App runs in a container with restart policy
  * EC2 instances for hosting proxy server and backend application.
  * Nginx as Proxy solution from VMA to proxy requests to app on VMB
  * OpenSSL Self Signed certificates for Proxy on HTTPS.
  * Docker named volumes instead of bind mounts used for Proxy config and SSL certs. 


# Steps Followed
1. Use multi-stage builds to create final image
    * Using an official go base image (golang:1.22-alpine) for builder stage.
    * Using alpine as minimal for final image.

2. Create the two t2.micro EC2 instances using Amazon Linux
    * Install the docker using ./docker-install.sh
    * Allow inbound 8080 port on VMB
    * Allow inbound 80 (for testing without ssl)and 443 tcp for TLS on VMA

3. Run the Container image from Part 1 on VMB while ensuring the application will be accessible from VMA
    * Test evidences at ./helloworld-server/test-evidence/README.md

4. Run the proxy as a container on VM A using nginx and proxy attached as volume to the container-without TLS
    * Test evidences at ./setup-proxy/test-evidence/README.md

5. Run the proxy as a container on VM A using nginx and proxy attached as volume to the container-with TLS
    * Test evidences at ./setup-proxy/test-evidence/README.md
