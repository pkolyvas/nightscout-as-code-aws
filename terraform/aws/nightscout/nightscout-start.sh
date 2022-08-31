#!/bin/bash
echo "Sleeping to ensure completion of other initialization"
sleep 60 #Ensuring the docker command is available
sudo usermod -aG docker ubuntu
echo "Creating caddy network for Docker.."
docker network create caddy
echo "Running Docker Compose..."
docker-compose up -d