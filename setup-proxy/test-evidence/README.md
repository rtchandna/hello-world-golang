# Proxy solution using nginx without TLS 

## Run the proxy as a container on VMA.
![alt text](proxy-setup.png)

## Configuration for the proxy attached as a volume to the container.
![alt text](docker-volume.png)


## Proxy accessible from outside the VM.
![alt text](Proxy-test-outside-vm.png)

## Output of the curl command that hits the proxy and the response that comes from the application running on VM B.
![alt text](proxy-curl.png)



# Proxy solution using nginx with TLS 

## Certs creation to configure the proxy with TLS.
![alt text](SSL-certs.png)

## Run the proxy as a container on VMA.
![alt text](proxy-tls-vm.png)


## Configuration for the proxy certs attached as a volume to the container.
![alt text](certs-volume.png)

## Proxy accessible from outside the VM.
![alt text](proxy-tls-outside-vm.png)

## Output of the curl command that hits the proxy and the response that comes from the application running on VM B.
![alt text](curl-output-tls.png)
