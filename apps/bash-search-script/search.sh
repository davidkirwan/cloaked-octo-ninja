#!/bin/bash

####################################################
# @author 	David Kirwan
# @description 	Script for browsing simple database
#  		of useful commands and urls.
#
# @date 	10-01-2012
####################################################

DATA=files
search=$1

if [ "$search" == "" ]
then
echo "Did you forget to enter a search term?"
echo ""
echo "    Useage: search.sh @searchterm"
exit 1
fi


echo "The string you searched for was: " $search
echo ""
echo "Found this in the commands.txt file:"
A=`grep $search $DATA/commands.txt`
echo $A | tr ";" "\n"
echo""
echo "Found this in the urls.txt file:"
B=`grep $search $DATA/urls.txt`
echo $B | tr ";" "\n"

