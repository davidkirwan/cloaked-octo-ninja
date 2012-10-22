####################################################################################################
# @author 	David Kirwan <dkirwan@tssg.org>
# @description 	Script showing the basics of working with Ruby Arrays
#
# @date 	22-10-2012
####################################################################################################

# Array Literal
testArray = [1, 2, 3]

# Appending elements to an Array
testArray << 4 << 5 << 5 << 6

# Print the array
p testArray.inspect

# Test data
val1 = 50.5
val2 = '50.5'


# Here is another method of declaring an Array
nhArray = Array.new

# Ruby Arrays can be non-homogenous, ie: They can contain different types of element.
# In this example I add a float, and a string to the same array.

nhArray << val1 << val2

puts nhArray.inspect
nhArray.each {|i| puts i.class; puts i.to_s}
