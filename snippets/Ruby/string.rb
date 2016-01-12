####################################################################################################
# @author   David Kirwan https://github.com/davidkirwan/
# @description  Script for examining basics of Ruby Strings's
#
# @date   2016-01-12
####################################################################################################
# STDLIB: http://ruby-doc.org/core-2.0/String.html

# A String is an object which holds human readable text. This can potentially be an empty object

# Declare a String using the constructor
test1 = String.new

# Print out the test1 string
puts test1
# 

# You can also pass the initial text to the constructor in the declaration
test2 = String.new('like this')

puts test2
# like this

# Over time you will settle on a syntax that is most comfortable for you, however Ruby does
# not necessarially require you adhere to using brackets, they are optional. Keep this in
# mind because the following is identical in practice

test3 = String.new 'like this';
puts test3
# like this

# And this

test4 = String.new 'like this'
puts test4
# like this

############################################################################################

# Using semicolons allows you to compress lines of ruby code onto a single line. It informs the
# interpreter that the end of the line of Ruby code has been reached, see the following:

test5 = String.new 'Hi I am a String'; test6 = test5.reverse; puts test5; puts test6; 
# Hi I am a String
# gnirtS a ma I iH

#############################################################################################

# We can also construct strings in Ruby using String literals. They are very easy to create
# as the next example demonstrates

test7 = "Hi there this is a String literal"

# Print it out
puts test7
# Hi there this is a String literal

# Print out the inspected contents
puts test7.inspect
# "Hi there this is a String literal"

# String literals are identical to Strings which are declared formally as we can see:

test8 = String.new('Hi there this is a String literal')

puts test7 == test8
# true

# We can add strings together, this is called string concatenation, this is very easy to do
# in Ruby, as we can see below:

# Create a new String literal
test9 = " and I love Ruby!"

# Concatenate the strings together
test10 = test8 + test9 

# Print them out
puts test10
# Hi there this is a String literal and I love Ruby!

# Print out the inspected contents
puts test10.inspect
# "Hi there this is a String literal and I love Ruby!" 

#############################################################################################

# There are a huge number of functions available for String manipulation in the Ruby language
# Here are a tiny fraction:

# Reverse a string
puts test10.reverse
# !ybuR evol I dna laretil gnirtS a si siht ereht iH

# Convert a string to uppercase
puts test10.upcase
# HI THERE THIS IS A STRING LITERAL AND I LOVE RUBY!

# convert a string to lowercase
puts test10.downcase
# hi there this is a string literal and i love ruby!

# To remove whitespace characters such as space, tab and unprintable characters
# This uses a REGEX which finds whitespace characters in a string, and passes to gsub
# which replaces what is found by the REGEX with the string in the second parameter which
# in this case is an empty string. So replace all white space with a blank.
puts test10.gsub(/\s/, "")
# HitherethisisaStringliteralandIloveRuby!

# If a string has white space characters before or after the string, we can remove them
# using strip
test11 = "     see the space before and after       "

# Print it out first to see
puts test11.inspect
# "     see the space before and after       "

# Now strip that space before and after with strip
puts test11.strip
# "see the space before and after"

#############################################################################################

# We can embed a expression into a string which can be very useful in Ruby like so:
puts "Five plus five equals: #{5 + 5}"
# 10

# We can place anything inside here, although in practice it should be kept small and concise
puts "testing #{derp = [1, 2, 3, 4, 5].reverse; derp.reverse!; derp.slice(3)}"
# testing 4

#############################################################################################

# Multiline String

multiline_test = <<-str
This is a multiline test!
Everything between the two 'str' tags is considered part of this string.
str
puts multiline_test
#This is a multiline test!
#Everything between the two 'str' tags is considered part of this string.

