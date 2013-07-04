#!/bin/bash
##############################################################
# @Author David Kirwan https://github.com/davidkirwan
# Bash script to check if a particular volume is mounted
#
# @Date 2013-07-04
##############################################################

volume="/home"

mount | grep "on ${volume} type" > /dev/null
if [ $? -eq 0 ]; then
 echo "its mounted"
else
 echo $?
fi
