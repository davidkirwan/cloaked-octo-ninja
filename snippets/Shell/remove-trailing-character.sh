#!/bin/bash
##############################################################
#
# @Author David Kirwan <dkirwan@tssg.org>
# @Description simple bash script to show how it's possible
# to delete a tailing "/" from a string. Can come in handy
# in your scripts.
#
# @Date 8th February 2012
##############################################################

output="test/"

echo "output before the change is: " $output


if [ "${output#${output%?}}" = "/" ]; then
echo "the final character in output is "${output#${output%?}}
output=${output%?}
echo "output after the change is: " $output
fi

