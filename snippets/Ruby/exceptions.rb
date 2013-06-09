####################################################################################################
# @author 	David Kirwan https://github.com/davidkirwan
# @description 	Snippet showing basic usage of Ruby exceptions and  handling
#
# @date 	09-06-2013
####################################################################################################

# First construct the exception definition. Exceptions are classes which are subclasses
# of the Exception class
class SampleException < Exception
end


# Test the exception with an example
begin
  puts "We are testing exceptions the following is going to raise a SampleException"
  
  # We are manually raising the SampleException
  raise SampleException, "Some message here to explain what happened"
  puts "This line should never execute in this example"

# This is a rescue block designed to recover from the SampleException event
rescue SampleException => e
  puts "SampleException exception occured and execution rescued."
  puts e.message
  puts e.backtrace
  
# This is a catch all other Exception block, Exception is the highest level of exception
# All others derive from it  
rescue Exception => e
  puts e.message
  puts e.backtrace
end

puts "done"
