#!/bin/bash

echo "configuring the development environment..."

echo "building the dkirwan/base:latest container image"
sudo docker build -t dkirwan/base:latest base/

echo "building the dkirwan/nginx:latest container image"
sudo docker build -t dkirwan/nginx:latest nginx/

echo "building the dkirwan/node_app:latest container image"
sudo docker build -t dkirwan/node_app:latest node_app

exit 0
