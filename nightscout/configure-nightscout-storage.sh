#!/bin/bash

checkMongoMount () {
    if findmnt --target /data > /dev/null; then
    echo "Mongo data directory mounted..."
    else
        echo "Mongo data is not mounted. Configuring..."
        echo "Partitioning disk..."
        sudo parted -s -a optimal /dev/nvme1n1 mklabel gpt
        sudo parted -s -a optimal /dev/nvme1n1 mkpart primary ext4 0% 100%
        echo "Formatting disk..."
        echo "Adding disk to the filesystem table..."
        OUTPUT="$(sudo blkid -s UUID -o value /dev/sdc$partnumber)"
        echo "UUID=$OUTPUT    /data   ext4    defaults    0    1" | sudo tee -a /etc/fstab
        echo "Mounting Mongo data directory"
        sudo mount /data
        echo "Checking mount..."
        checkMongoMount
    fi
}

checkMongoMount
exit