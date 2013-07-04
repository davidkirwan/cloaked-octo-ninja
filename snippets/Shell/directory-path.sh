#!/bin/bash
##############################################################

# @Author David Kirwan https://github.com/davidkirwan
# Bash script to get the parent directory of a file path
#
# @Date 2013-07-04
##############################################################

output="/path/to/test/something.txt"

echo "output before the change is: " $output

echo ${output%/*}
