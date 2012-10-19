#!/bin/bash
##############################################################
#
# @Author David Kirwan <dkirwan@tssg.org>
# @Description Script to show how to work with filenames, and
#              extensions in a shell script.
#
# @Date 20th February 2012
##############################################################

output="/path/to/test/something.txt"

echo "The original file path is: " $output

echo "The directory path is: "${output%/*}


filename=$(basename $output)

echo "This is the name of the file: " $filename

extension=${output##*.}

echo "This is the file extension: "$extension

filename=${filename%.*}

echo "This should just be the file name itself: " $filename

##################################

