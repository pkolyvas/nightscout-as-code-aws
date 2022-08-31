#!/bin/bash
echo "Sleeping to ensure completion of other initialization"
sleep 35 #Ensuring the docker command is available
echo "Adding ubuntu user to the docker group"
sudo usermod -aG docker ubuntu
echo "Sleeping to ensure the next shell is ready"
sleep 35 #Ensuring the docker command is available
echo "Done!"
echo "Forcing reconnection"
exit 