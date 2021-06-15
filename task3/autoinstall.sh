#!/bin/bash
sudo yum remove -y docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-engine\
                  docker-ce\
                  docker-ce-cli
sudo yum install -y yum-utils 
sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install -y docker-ce docker-ce-cli containerd.io 
sudo systemctl start docker
sudo systemctl enable docker
sudo docker run hello-world