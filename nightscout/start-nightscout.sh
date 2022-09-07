#!/bin/bash

source ~/.env

INSTANCE_ID=`aws ec2 describe-instances --filters Name=tag:Name,Values=Nightscout Name=instance-state-name,Values=running --region ${AWS_DEFAULT_REGION} | grep -o -E '\"i-[a-z0-9]*\"' | grep -o 'i-[a-z0-9]*'`

echo "Remove credit limitation for update process..."
aws ec2 modify-instance-credit-specification --instance-credit-specifications InstanceId=$INSTANCE_ID,CpuCredits=unlimited --region ${AWS_DEFAULT_REGION}
sleep 5 # Buffer to esure the throttle is removed.

echo "Creating caddy network for Docker..."
docker network create caddy
echo "Running Docker Compose..."
docker-compose -f /home/ubuntu/docker-compose.yml up -d

echo "Changing EC2 instance credit spec to standard..."
aws ec2 modify-instance-credit-specification --instance-credit-specifications InstanceId=$INSTANCE_ID,CpuCredits=standard --region ${AWS_DEFAULT_REGION}
echo "Done!"