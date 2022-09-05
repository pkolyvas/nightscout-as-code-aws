#!/bin/bash

INSTANCE_ID=`aws ec2 describe-instances --filters Name=tag:Name,Values=Hightscout | grep -o -E '\"i-[a-z0-9]*\"' | grep -o 'i-[a-z0-9]*'`

echo "Creating caddy network for Docker..."
docker network create caddy
echo "Running Docker Compose..."
docker-compose -f /home/ubuntu/docker-compose.yml up -d

echo "Changing EC2 instance credit spec to standard..."
aws ec2 modify-instance-credit-specification --instance-credit-specifications InstanceId=$INSTANCE_ID,CpuCredits=standard --no-cli-pager

echo "Remove AWS credentials from intance environment & files..."
sed -i '5,6d' ~/.env
unset AWS_ACCESS_KEY_ID
unset AWS_SECRET_ACCESS_KEY

echo "Done!"