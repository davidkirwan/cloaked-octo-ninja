####################################################################################################
# @author 	David Kirwan <dkirwan@tssg.org>
# @description 	Script for examining basics of Ruby Hash's
#
# @date 	08-06-2013
####################################################################################################
# STDLIB: http://ruby-doc.org/core-2.0/Hash.html

# The hash is a non-homogeneous key -> value data structure. Every key is assigned a value, which 
# could potentially contain no value i.e. nil

# Create a hash with formal declaration of class and calling the constructor
test1 = Hash.new

# In the test1 hash, create a new string key called "test" and assign it the value 5
test1["test"] = 5

# In the test1 hash, create a new fixnum key called 5 and assign it the value "test"
test1[5] = "test"

# Example of how to access the "test" key inside the hash
puts test1["test"]
# 5

# example how to access the 5 key inside the hash
puts test1[5]
# test

# print out the inspected contents of the hash
puts test1.inspect


#####################################################################################

# Hashes can also be constructed using hash literal syntax shown below. In hash literals
# we use the {}'s to denote it being a hash literal, and one => two for the key, values

# Construct a hash literal with 3 key value pairs
test2 = {1=>2, 6=>65.3, "three"=>54.3}

# Print out the inspected contents of the hash
puts test2.inspect
# {1=>2, 6=>65.3, "three"=>54.3}

# Print out the key, value contents of the hash
test2.each do |key, value|
  puts "Key: " + key.to_s + " is of type #{key.class} and the Value: " + value.to_s + 
  " is of type #{value.class}"
end
# Key: 1 is of type Fixnum and the Value: 2 is of type Fixnum
# Key: 6 is of type Fixnum and the Value: 65.3 is of type Float
# Key: three is of type String and the Value: 54.3 is of type Float

#####################################################################################

# Construct another Hash
test3 = {1 => 'a', 2 => 'b', 3 => nil}

# If a key, value pair does not exist, we can instruct the hash to return a default value
# of 0
test3.default = 0

# Print out a non existant key, value pair and it should return 0 instead of nil
puts test3[33333]
# 0

puts test3[1].inspect
# a

puts test3[2].inspect
# b

puts "You can't print out a nil value, so nothing appears here: =>#{test3[3]}<="
# 

# Inspect converts the nil to a string before printing it out
puts test3[3].inspect
# nil

# You can check for a nil value using .nil?
puts test3[3].nil?
# true
