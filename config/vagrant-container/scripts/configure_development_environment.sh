#!/bin/bash

echo "configuring the development environment..."

echo "building the base:latest container image"
sudo docker build -t base:latest /home/vagrant/docker/base

echo "building the nginx:latest container image"
sudo docker build -t nginx:latest /home/vagrant/docker/nginx

echo "building the node_app:latest container image"
sudo docker build -t nodeapp:latest /home/vagrant/docker/nodeapp

echo "building the redis:latest container image"
sudo docker build -t redis:latest /home/vagrant/docker/redis

exit 0
