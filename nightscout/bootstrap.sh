#!/bin/bash
echo "Updating the system and installing Docker CE and AWS CLI..."
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

checkDocker () {
    if pgrep -x "dockerd" >/dev/null
    then
        echo "Docker is running..."
    else
        echo "Oops. Docker is not running yet. Reinstalling..."
        sleep 15
        sudo apt-get update
        sudo apt-get install -y --force-yes docker-ce docker-compose awscli
        checkDocker        
    fi
}

echo "Checking for the installation of Docker to complete..."
checkDocker

echo "Done!"
exit