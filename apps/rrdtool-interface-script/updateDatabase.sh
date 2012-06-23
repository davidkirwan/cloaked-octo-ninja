#!/bin/bash

a=0
while [ "$a" == 0 ]; do

	RX=`ifconfig bond0 | grep -o -m 1 'RX bytes:[0-9]* (' | tr 'RX bytes:' '\n' | grep [0-9]`
	TX=`ifconfig bond0 | grep -o -m 1 'TX bytes:[0-9]* (' | tr 'TX bytes:' '\n' | grep [0-9]`

# Convert the number of bytes to Megabytes for RX and TX
	RXMB=`echo "scale=2; $RX / 1048576" | bc`
	TXMB=`echo "scale=2; $TX / 1048576" | bc`

# Now holds the number of seconds elapsed since 1st January 1970.
	NOW=`date +%s`
	echo Time $NOW bond0 RX: $RXMB TX: $TXMB

# Update the bandwidth.rrd rrtool database with the time:rx:tx values.
     `rrdtool update bandwidth.rrd $NOW:$RX:$TX`

# sleep until the next 3 seconds are full
     perl -e 'sleep 3 - time % 3'
done # end of while loop
