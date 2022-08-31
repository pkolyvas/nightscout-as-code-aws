#!/bin/bash

# There's a lot of sleeping going on here. T3 instances, while fast once they've built up credits,
# are not quick on boot. They need some time to "warm up". This means we get slightly unpredictable 
# behaviour when trying to immediately start our docker stack.

echo "Sleeping for 60 seconds to make sure everything settles down following first-boot..."
sleep 60 #Ensuring the docker command is available
echo "Double checking groups"
groups
echo "Checking if docker is running"
ps -aux | grep docker
echo "Creating caddy network for Docker.."
sleep 5
docker network create caddy
sleep 5
echo "Running Docker Compose..."
docker-compose -f /home/ubuntu/docker-compose.yml up -d
echo "Done!"