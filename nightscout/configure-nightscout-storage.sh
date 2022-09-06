#!/bin/bash

checkMongoMount () {
    if findmnt --target /data > /dev/null; then
    echo "Mongo data directory mounted..."
    else
        echo "Mongo data is not mounted. Configuring..."
    fi
}

checkMongoMount
exit