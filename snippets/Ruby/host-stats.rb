#!/usr/bin/env ruby
####################################################################################################
# @author David Kirwan https://github.com/davidkirwan
# @description  Simple ruby script to parse /proc/cpuinfo and /proc/meminfo to produce load and 
#               memory statistics for a given Linux host
#
# @usage ruby host-stats.rb
# @licence (BY-SA 3.0) http://creativecommons.org/licenses/by-sa/3.0/
#
# @date 27-05-2013
####################################################################################################

# Get cpuinfo
begin # Checking for multi-core CPU
  cpuinfo = File.read('/proc/cpuinfo')
  coreinfo = cpuinfo.scan(/cpu cores\s+:\s+\d+/)

  tempVal = coreinfo[0]
  numOfCores = tempVal.scan(/\d+/)[0].to_i
  numOfThreadsPerCore = coreinfo.size / numOfCores
  maxLoad = (numOfThreadsPerCore * numOfCores).to_f

  puts "I have found #{numOfCores} cores on this system with #{numOfThreadsPerCore} threads per core"
  puts "This gives a max desirable cpu load of #{maxLoad}"

rescue Exception => e
  puts "Cannot find 'cpu cores' info in /proc/cpuinfo, assuming system has a single core"
  maxLoad = 1.0
  puts "This gives a max desirable cpu load of #{maxLoad}"
end

# Get loadavg
loadavg = File.read('/proc/loadavg')
loads = loadavg.scan(/\d+.\d+/)
onemin = loads[0]
fivemin = loads[1]
fifteenmin = loads[2]

puts "The loads for the system are as follows: 1min #{onemin}, 5min #{fivemin}, 15min #{fifteenmin}"

loadval = (onemin.to_f / maxLoad)
currentLoadPercentage = loadval * 100

puts "The system is currently running at #{'%.2f' % currentLoadPercentage}% of max load"

# Get mem usage
memhash = Hash.new
meminfo = File.read('/proc/meminfo')
meminfo.each_line do |i| 
  key, val = i.split(':')
  if val.include?('kB') then val = val.gsub(/\s+kB/, ''); end
  memhash["#{key}"] = val.strip
end

totalMem = memhash["MemTotal"].to_i
freeMem = memhash["MemFree"].to_i + memhash["Buffers"].to_i + memhash["Cached"].to_i
usedMem = totalMem - freeMem

puts "Total Memory: #{totalMem} (100%)"
puts "Used Memory: #{usedMem} (#{'%.2f' % ((usedMem / totalMem.to_f) * 100)}%)"
puts "Free Memory: #{freeMem} (#{'%.2f' % ((freeMem / totalMem.to_f) * 100)}%)"