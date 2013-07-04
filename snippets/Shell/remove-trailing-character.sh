#!/bin/bash
##############################################################
# @Author David Kirwan https://github.com/davidkirwan
# Bash script to remove trailing / character which might be passed
# in a file path.
#
# @Date 2013-07-04
##############################################################

output="test/"

echo "output before the change is: " $output


if [ "${output#${output%?}}" = "/" ]; then
echo "the final character in output is "${output#${output%?}}
output=${output%?}
echo "output after the change is: " $output
fi

