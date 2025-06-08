
#!/bin/bash

sudo mkdir -p certs
cd certs

# Generate a private key
sudo openssl genrsa -out server.key 2048

# Generate a Certificate Signing Request (CSR)
sudo openssl req -new -key server.key -out server.csr -subj "/CN=44.220.163.16"

# Generate a self-signed certificate (valid for 365 days)
sudo openssl x509 -req -days 365 -in server.csr -signkey server.key -out server.crt
