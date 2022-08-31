#!/bin/bash

# For debugging
echo "Sleeping for 10 seconds..."
sleep 10 #Ensuring the docker command is available
echo "Printing env vars"
source /home/ubuntu/.profile
env
pwd

echo "Creating caddy network for Docker.."
docker network create caddy
echo "Running Docker Compose..."
docker-compose -f /home/ubuntu/docker-compose.yml up -d
echo "Done."