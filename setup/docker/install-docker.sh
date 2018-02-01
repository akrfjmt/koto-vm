#!/bin/sh

# install docker
# https://docs.docker.com/engine/installation/linux/docker-ce/centos/#install-using-the-repository

yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2

yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

yum install -y docker-ce

# install docker-compose
# https://docs.docker.com/compose/install/
curl -L https://github.com/docker/compose/releases/download/1.18.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

curl -L https://raw.githubusercontent.com/docker/compose/1.18.0/contrib/completion/bash/docker-compose -o /etc/bash_completion.d/docker-compose

# start docker
systemctl enable docker
systemctl start docker
