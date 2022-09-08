#!/bin/bash

echo "Configuring the instance environment"

# Docker configuration options
echo "export COMPOSE_HTTP_TIMEOUT=300" >> /home/ubuntu/.env

# Nightscout configuration options
echo 'export NS_API_KEY="${api_key}"' >> /home/ubuntu/.env
echo 'export NS_DOMAIN="${domain}"' >> /home/ubuntu/.env
echo 'export NS_FEATURES="${features}"' >> /home/ubuntu/.env

# AWS CLI configuration values
echo 'export AWS_ACCESS_KEY_ID="${access_key}"' >> /home/ubuntu/.env
echo 'export AWS_SECRET_ACCESS_KEY="${secret_key}"' >> /home/ubuntu/.env
echo 'export AWS_DEFAULT_REGION="${region}"' >> /home/ubuntu/.env

# AWS Docker Composed Advanced Options
echo 'export MONGO_IMAGE="${mongo_image}"' >> /home/ubuntu/.env
echo 'export MONGO_IMAGE_TAG="${mongo_image_tag"' >> /home/ubuntu/.env
echo 'export NIGHTSCOUT_IMAGE="${nightscout_image}"' >> /home/ubuntu/.env
echo 'export NIGHTSCOUT_IMAGE_TAG="${nighscout_image_tag}"' >> /home/ubuntu/.env

cat /home/ubuntu/.env >> /home/ubuntu/.profile

# echo "Updating the system and installing Docker CE"
# apt-get install -y apt-transport-https ca-certificates curl software-properties-common
# curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
# echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
# apt-get update
# apt-get install -y docker-ce docker-compose awscli