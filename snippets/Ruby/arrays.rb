####################################################################################################
# @author 	David Kirwan https://github.com/davidkirwan/
# @description 	Script showing the basics of working with Ruby Arrays
#
# @date 	08-06-2013
####################################################################################################
# STDLIB: http://ruby-doc.org/core-2.0/Array.html

# Array Literal
testArray1 = [1, 2, 3]

# Appending elements to an Array
testArray1 << 4 << 5 << 5 << 6

# Print the inspected contents of testLiteral array
puts testArray1.inspect
# [1, 2, 3, 4, 5, 6]

###################################################################

# Test data
val1 = 50.5
val2 = '50.5'
val3 = "50.5"
val4 = 50

# Formal declaration using Class name and calling the constructor
testArray2 = Array.new

# Ruby Arrays are non-homogenous, ie: They can contain different types of element.
# In this example I add a float, fixnum, and a string to the same array.
testArray2 << val1 << val2 << val3 << val4

# Inspect the contects of the testArray2
puts testArray2.inspect
# [50.5, "50.5", "50.5", 50]

# Loop through the testArray2 and print out the name of the class and 
# the contents of the to_s or to string for each element
testArray2.each {|i| puts i.class; puts i.to_s}
# Float
# 50.5
# String
# 50.5
# String
# 50.5
# Fixnum
# 50

###################################################################

# To add arrays see the following
addArray1 = [1, 2, 3, 4]
addArray2 = [5, 6, 7, 8]

# Add them together
addArrayResult = addArray1 + addArray2

# Print the inspected contents of the resulting array
puts addArrayResult.inspect
# [1, 2, 3, 4, 5, 6, 7, 8]

# Likewise we can subtract arrays from one another just as easilly
subtractArrayResult = addArrayResult - addArray2

# Print out the inspected contents of the array after the subtraction
puts subtractArrayResult.inspect
# [1, 2, 3, 4]

###################################################################

# Another method of appending elements to the array. Keep in mind the elements of the array
# go from 0 upto the size of the array - 1 in Ruby so for an array of size 3, the elements
# are addressed from 0 - 2
testArray3 = [1, 2, 3]

# Add some new elements
testArray3[3] = 4
testArray3[4] = 5
testArray3[5] = 6

puts testArray3.inspect
# [1, 2, 3, 4, 5, 6]

# Now unlike most languages, Ruby allows us to just put an element out in the middle of no where
# even when there are a number of empty spots between the last element and this new one we just
# added
testArray3[10] = 10

# Print out the inspected contents of testArray3
puts testArray3.inspect
# [1, 2, 3, 4, 5, 6, nil, nil, nil, nil, 10]


###################################################################

# There are a huge number of functions available in the standard library for manipulating
# arrays

# Create an array literal once more
testArray4 = [1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024]

# Print the inspected contents of the array
puts testArray4.inspect
# [1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024]

# Print the inspected contents of the array backwards
puts testArray4.reverse.inspect
# [1024, 512, 256, 128, 64, 32, 16, 8, 4, 2, 1]

# We can even sort arrays which contain primitive elements or which contain elements for which a sort
# function has been written especially for

testArray5 = [1, 4, 2, 66, 99, 0, -66, -222, 5563]

# print out the sorted array
puts testArray5.sort.inspect
# [-222, -66, 0, 1, 2, 4, 66, 99, 5563]
