#!/bin/bash

#Installing the binaries
sudo yum update -y
sudo yum -y install docker

#Setting Docker as Service
sudo systemctl enable docker.service
sudo systemctl start docker.service

sudo usermod -a -G docker ec2-user
sudo chmod 666 /var/run/docker.sock