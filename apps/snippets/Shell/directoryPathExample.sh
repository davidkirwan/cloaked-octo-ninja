#!/bin/bash
##############################################################
#
# @Author 	David Kirwan <dkirwan@tssg.org>
# @Description 	Script takes a path to a file as a parameter
#              	and prints the base directory that file is in
#               as output
#
# @Date 8th February 2012
##############################################################

output="/path/to/test/something.txt"

echo "output before the change is: " $output

echo ${output%/*}
