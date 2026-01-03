#!/bin/bash

# Update 
sudo apt update -y

# Install Docker
sudo apt install -y docker.io

# Start Docker service
sudo systemctl start docker

# Make sure Docker starts automatically if the server reboots
sudo systemctl enable docker

# Add ubuntu user to docker group
sudo usermod -aG docker ubuntu

# Move to home directory
cd /home/ubuntu

# Clone Docker project
git clone https://github.com/phyuhanthwe/docker-nginx-web-app.git
cd docker-nginx-web-app

# Build docker image
sudo docker build -t custom-nginx .

# Pull the Nginx image and runs it on Port 80
sudo docker run -d -p 80:80 --name my-web-server custom-nginx