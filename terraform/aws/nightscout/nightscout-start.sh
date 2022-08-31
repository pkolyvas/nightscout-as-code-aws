#!/bin/bash
sleep 60 #Ensuring the docker command is available
docker create network caddy
docker-compose up -d