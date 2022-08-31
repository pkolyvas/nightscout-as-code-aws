#!/bin/bash
echo "Sleeping to ensure completion of other initialization"
sleep 35 #Ensuring the docker command is available
echo "Adding ubuntu user to the docker group"
sudo usermod -aG docker ubuntu
echo "Checking group membership"
groups
echo "Sleeping to ensure the next shell is ready"
# For debugging
sleep 35 #Ensuring the docker command is available
echo "Printing env vars"
source /home/ubuntu/.profile
env
echo "Done!"