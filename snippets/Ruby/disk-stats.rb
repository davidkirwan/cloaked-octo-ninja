#!/usr/bin/env ruby
####################################################################################################
# @author David Kirwan https://github.com/davidkirwan
# @description Simple ruby script to parse the output from the Linux disk utility df
#
# @usage ruby disk-stats.rb
# @licence (BY-SA 3.0) http://creativecommons.org/licenses/by-sa/3.0/
#
# @date 2013-09-12
####################################################################################################
 
=begin
Filesystem Size Used Avail Use% Mounted on
/dev/sda3 29G 14G 14G 50% /
dev 1002M 0 1002M 0% /dev
run 1004M 832K 1003M 1% /run
tmpfs 1004M 188K 1004M 1% /dev/shm
tmpfs 1004M 0 1004M 0% /sys/fs/cgroup
tmpfs 1004M 240K 1004M 1% /tmp
/dev/sda1 99M 48M 46M 52% /boot
/dev/sda4 201G 25G 166G 14% /home
=end
 
diskusage = Array.new
 
fileinfo = `df -h`
 
lines = fileinfo.split("\n")
lines.delete_at(0)
 
lines.each do |i|
i.gsub!(/\s+/, " ")
device, size, used, avail, use, mount = i.split(" ")
diskusage << {:device=>device, :size=>size, :used=>used, :avail=>avail, :use=>use, :mount=>mount}
end
 
diskusage.each do |i|
puts i.inspect
end
 
=begin
{:device=>"/dev/sda3", :size=>"29G", :used=>"14G", :avail=>"14G", :use=>"50%", :mount=>"/"}
{:device=>"dev", :size=>"1002M", :used=>"0", :avail=>"1002M", :use=>"0%", :mount=>"/dev"}
{:device=>"run", :size=>"1004M", :used=>"832K", :avail=>"1003M", :use=>"1%", :mount=>"/run"}
{:device=>"tmpfs", :size=>"1004M", :used=>"188K", :avail=>"1004M", :use=>"1%", :mount=>"/dev/shm"}
{:device=>"tmpfs", :size=>"1004M", :used=>"0", :avail=>"1004M", :use=>"0%", :mount=>"/sys/fs/cgroup"}
{:device=>"tmpfs", :size=>"1004M", :used=>"240K", :avail=>"1004M", :use=>"1%", :mount=>"/tmp"}
{:device=>"/dev/sda1", :size=>"99M", :used=>"48M", :avail=>"46M", :use=>"52%", :mount=>"/boot"}
{:device=>"/dev/sda4", :size=>"201G", :used=>"25G", :avail=>"166G", :use=>"14%", :mount=>"/home"}
=end
