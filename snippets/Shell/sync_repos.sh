#!/bin/bash
#####################################################
# Author:  David Kirwan <davidkirwanirl@gmail.com>
# Github:  https://github.com/davidkirwan
# Licence: GPL 3.0
#####################################################

# Perform a git pull on each sub directory on the path supplied as a parameter
function sync_git {
  for I in $(ls $1)
  do
    STARTDIR=$(pwd)
    echo "Checking $I"
    cd $1
    if [[ -d $I ]]
    then
      cd $I 
      echo "Syncing: $I"
      git pull 
      cd ..
    fi
    cd $STARTDIR
  done
}

echo $1
sync_git $1
