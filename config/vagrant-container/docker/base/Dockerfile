# base container
# VERSION 0.0.1

# Base Ubuntu Trusty 14.04 LTS image
FROM ubuntu:latest

# The maintainer
MAINTAINER David Kirwan <davidkirwanirl@gmail.com>

# Provisioning the image
RUN apt-get update;\
    apt-get install -y git;\
    apt-get install -y zip;\
    apt-get install -y unzip;\
    apt-get install -y supervisor;\
    apt-get install -y wget;\
    apt-get install -y curl;\
    apt-get install -y build-essential;\
    apt-get install -y software-properties-common;\
    apt-get install -y sudo;
