#!/usr/bin/env ruby

####################################################################################################
# @author 	David Kirwan <dkirwan@tssg.org>
# @description 	Snippet showing basic usage of Ruby exceptions and  handling
#
# @date 	24-08-2012
####################################################################################################

class SampleException < Exception
end


begin
  puts "We are testing exceptions the following is going to raise a SampleException"
  raise SampleException
  puts "This line should never execute in this example"

rescue SampleException => e
  puts "SampleException exception occured and execution rescued."
  puts e.message
  puts e.backtrace
rescue Exception => e
  puts e.message
  puts e.backtrace
end

