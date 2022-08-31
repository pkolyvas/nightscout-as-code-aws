#!/bin/bash
sleep 60 #Ensuring the docker command is available
sudo usermod -aG docker ubuntu
docker create network caddy
docker-compose up -d