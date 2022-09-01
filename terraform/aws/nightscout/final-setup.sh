#!/bin/bash

# There's a lot of sleeping going on here. T3 instances, while fast once they've built up credits,
# are not quick on boot. They need some time to "warm up". This means we get slightly unpredictable 
# behaviour when trying to immediately start our docker stack.

echo "Sleeping to ensure completion of other initialization processes..."
sleep 30 #Ensuring the docker command is available
echo "Adding ubuntu user to the docker group..."
sudo usermod -aG docker ubuntu
echo "Sleeping to ensure the next shell and additional software is ready..."
sleep 30 #Ensuring the docker command is available
echo "Done!"
echo "Forcing reconnection...bye!"
exit 