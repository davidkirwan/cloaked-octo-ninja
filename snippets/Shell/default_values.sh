#!/bin/bash
#####################################################
# Author:  David Kirwan <davidkirwanirl@gmail.com>
# Github:  https://github.com/davidkirwan
# Licence: GPL 3.0
#####################################################
# $ ./test.sh 1 2
# 1
# 2
# No 3rd parameter passed
# No 4th parameter passed
# No 5th parameter passed
# TEST variable default
#
# $ ./test.sh abc def hij
# abc
# def
# hij
# No 4th parameter passed
# No 5th parameter passed
# hij

echo ${1:-"No parameter passed"}
echo ${2:-"No 2nd parameter passed"}
echo ${3:-"No 3rd parameter passed"}
echo ${4:-"No 4th parameter passed"}
echo ${5:-"No 5th parameter passed"}

TEST='TEST variable default'
TEST=${3:-${TEST}}

echo $TEST
