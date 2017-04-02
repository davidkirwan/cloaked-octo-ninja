#!/bin/bash
##############################################################
# @Author David Kirwan https://github.com/davidkirwan
# Bash script to rename all image files in the current dir
# with a incrementing number
#
# @Date 2017-04-01
##############################################################
a=1
for i in *.jpg; do
  new=$(printf "%04d.jpg" "$a")
  mv -- "$i" "$new"
  let a=a+1
done
