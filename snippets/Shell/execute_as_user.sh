#!/usr/bin/bash
##############################################################
# @Author David Kirwan https://github.com/davidkirwan
# Bash script to demonstrate executing as another user
#
# @Date 2017-03-16
# Example:
#   su -s /bin/bash -c ./test_script.sh <user_you_wish>
##############################################################
USER=$(whoami)

echo $USER

