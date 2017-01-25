#!/bin/bash

echo "configuring the development environment..."

echo "building the dkirwan/base:latest container image"
sudo docker build -t dkirwan/base:latest /srv/vagrant/docker/base

echo "building the dkirwan/nginx:latest container image"
sudo docker build -t dkirwan/nginx:latest /srv/vagrant/docker/nginx

echo "building the dkirwan/node_app:latest container image"
sudo docker build -t dkirwan/node_app:latest /srv/vagrant/docker/node_app

echo "building the dkirwan/redis:latest container image"
sudo docker build -t dkirwan/redis:latest /srv/vagrant/docker/redis

exit 0
