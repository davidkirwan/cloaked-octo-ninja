#!/bin/bash
##############################################################
# @Author David Kirwan https://github.com/davidkirwan
# Bash script to find the name of a file from a file path
#
# @Date 2013-07-04
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
