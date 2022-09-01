#!/bin/bash

echo "Creating caddy network for Docker.."
docker network create caddy
echo "Running Docker Compose..."
docker-compose -f /home/ubuntu/docker-compose.yml up -d
echo "Done!"