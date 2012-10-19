#########################################################################################
#  Author:		David Kirwan https://github.com/davidkirwan
#  Description: 	Script to get the IP address for the Ethernet eth0 interface
#			and the wlan0 wireless interface, then convert them to format
#   			suitible for playing through espeak
#
#  License:		http://creativecommons.org/licenses/by-sa/3.0/
#
#########################################################################################

wlan0 = `ifconfig wlan0`
eth0 = `ifconfig eth0`


if ( wlan0.match(/(\d+\.\d+\.\d+\.\d+)/) ).nil?
  puts "Interface wlan0 is not connected to a network currently"
else
  wlan0_ip = wlan0.match(/(\d+\.\d+\.\d+\.\d+)/)[1]
  puts wlan0_ip.gsub(/\./, " dot ")
end

sleep(2)

if ( eth0.match(/(\d+\.\d+\.\d+\.\d+)/) ).nil?
  puts "Interface eth0 is not connected to a network currently"
else
  eth0_ip = eth0.match(/(\d+\.\d+\.\d+\.\d+)/)[1]
  puts eth0_ip.gsub(/\./, " dot ")
end

