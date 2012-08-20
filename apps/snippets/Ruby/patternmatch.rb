#!/usr/bin/env ruby

####################################################################################################
# @author 	David Kirwan <dkirwan@tssg.org>
# @description 	Script for checking if a string begins with ABC
#
# @date 	23-2-2012
####################################################################################################

s = "ABCDEFG"
t = "/^ABC/"
r = Regexp.new(eval(t))



puts "The string is: " + s
puts "The regex is: " + t.to_s

puts "The following is a test to see where in the string is the pattern found, in this test\nit should be 0"
puts s =~ r

puts "\nWhen we scan the string using the regex this is what we find"
puts s.scan(r)
