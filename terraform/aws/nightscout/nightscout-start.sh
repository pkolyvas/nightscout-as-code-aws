#!/bin/bash
echo "Sleeping to ensure completion of other initialization"
sleep 60 #Ensuring the docker command is available
sudo usermod -aG docker ubuntu
docker network create caddy
docker-compose up -d