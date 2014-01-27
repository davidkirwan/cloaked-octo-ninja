#!/bin/bash
##############################################################
# @Author David Kirwan https://github.com/davidkirwan
# Bash script to discover the newst file in a directory.
#             This potentially includes hidden files
#
# @Date 2013-11-25
##############################################################
#!/bin/bash

THEPATH=/path/to/directory

echo `/bin/date`
echo "===========BEGIN============="
echo "Finding the newest file in $THEPATH"
NEWEST=`/bin/ls -ABrt1 --group-directories-first $THEPATH | /usr/bin/tail -n1`
echo "Newest file: $NEWEST"
echo "===========END============="
echo "Done."
