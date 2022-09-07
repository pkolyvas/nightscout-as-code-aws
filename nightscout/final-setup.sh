#!/bin/bash

# There's a lot of sleeping going on here. T3 instances, while fast once they've built up credits,
# are not quick on boot. They need some time to "warm up". This means we get slightly unpredictable 
# behaviour when trying to immediately start our docker stack. This is even worse when we run T3 instances
# in "standard" credit mode vs. the higher performance "unlimited" mode. See the Terraform root module variable 
# declarations to control the credit specification.

# Beacause Terraform doesn't wait for CloudInit (via user_data) to complete before starting the provisioner process, 
# we need to find a way to wait an indeterminate amount of time. Using `sleep` exclusively is brittle. 
# At the same time this janky function risks getting stuck in a loop forever if something goes wrong.
checkDocker () {
    if pgrep -x "dockerd" >/dev/null
    then
        echo "Docker is running..."
    else
        echo "Oops. Docker is not running yet. Waiting..."
        sleep 15
        checkDocker        
    fi
}

echo "Checking for the installation of Docker to complete..."
checkDocker
echo "Adding ubuntu user to the docker group..."
sudo usermod -aG docker ubuntu
echo "Done!"
echo "Forcing reconnection...bye!"
exit 