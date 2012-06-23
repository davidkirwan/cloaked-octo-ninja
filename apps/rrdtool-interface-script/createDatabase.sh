#!/bin/bash

# Generate the rrdtool database
rrdtool create bandwidth.rrd -s 3 \
DS:in:COUNTER:6:U:U \
DS:out:COUNTER:6:U:U \
RRA:AVERAGE:0.5:1:60 \
RRA:AVERAGE:0.5:5:600

