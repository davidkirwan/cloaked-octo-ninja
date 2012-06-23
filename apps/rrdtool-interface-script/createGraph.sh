#!/bin/bash

a=0
while [ "$a" == 0 ]; do

#Generate the PNG image from the database
rrdtool graph bandwidth.png \
-w 640 -h 480 -a PNG \
--slope-mode \
--start -600 --end now \
--font DEFAULT:7: \
--title "Bandwidth over Linux Bonding Link" \
--watermark "`date`" \
--vertical-label "bytes transferred" \
--right-axis-label "bytes transferred" \
--lower-limit 0 \
DEF:in=bandwidth.rrd:in:AVERAGE \
DEF:out=bandwidth.rrd:out:AVERAGE \
LINE1:in#00FF00:"RX bytes"  \
LINE2:out#0000FF:"TX bytes"

     # sleep until the next 6 seconds are full
     perl -e 'sleep 6 - time % 6'
done # end of while loop

