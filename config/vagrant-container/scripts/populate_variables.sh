#!/bin/sh

IP=$1
PORT=$2

echo $1:$2
sed "s/{{ IP }}/${IP}/g" /srv/vagrant/docker/nginx/templates/default.template > /tmp/default.conf_1
sed "s/{{ PORT }}/${PORT}/g" /tmp/default.conf_1 > /srv/vagrant/docker/nginx/default.conf
