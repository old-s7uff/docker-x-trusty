#!/bin/bash

lvcreate -L 500G -n docker /dev/dopehosting
mkdir /docker

service docker stop
rm -Rf /docker; mkdir /docker
rm -Rf /var/lib/docker/
mkfs.btrfs -f /dev/dopehosting/docker
mount -t btrfs /dev/dopehosting/docker /docker
rm -Rf /etc/default/docker
cd /etc/default; wget https://raw.githubusercontent.com/systemroot/docker-x-trusty/master/etc/default/docker

service docker start
docker info
