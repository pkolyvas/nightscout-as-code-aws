#!/bin/bash

echo "Configuring the instance environment"
echo NS-API-KEY="${api_key}" > /home/ubuntu/.profile
echo NS-DOMAIN="${domain}" > /home/ubuntu/.profile
echo NS-FEATURES="${features}" /home/ubuntu/.profile

echo "Updating the system and installing Docker CE"
apt-get install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update
apt-get install -y docker-ce docker-compose
usermod -aG docker ubuntu