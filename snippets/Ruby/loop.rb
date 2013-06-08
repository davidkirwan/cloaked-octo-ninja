####################################################################################################
# @author 	David Kirwan https://github.com/davidkirwan/
# @description 	Simple demonstration of Ruby loops
#
# @date 	08-06-2013
####################################################################################################

# There are many ways to loop or iterate through datastructures in Ruby the following are a few
# examples of what is possible


# Regular loop up to 100 then break out
temp = 0
loop do
  temp += 1
  if temp == 100 then break; end
  puts temp
end


# Loop from 0 - 5 then end
0.upto(5) do |i|
  puts i
end


# Loop from 5 to 0 then end
5.downto(0) do |i|
  puts i
end


# Repeat 10 times
10.times do |i|
  puts i
end


# loop while [expression is true]
# print out the value of i if i mod 10 is 0 and i is less than 100
# will not enter the loop unless the expression is true at the start
i = 0
while i < 100 do
  if i % 10 == 0 then puts i; end
  i += 1
end 


# Loop while [expression] is true
# print out the value of i if i mod 10 is 0 and i is less than 100
# runs through the loop at least once then checks to see if it is true
i = 0
begin
  if i % 10 == 0 then puts i; end
  i += 1
end while i < 100



# Loops unless [expression] is true
# print out the value of i if i mod 10 is 0 and i is less than 100
# runs through the loop at least one, then checks to see if its true, if it is it quits out
# if its false it continues looping again
i = 0
begin
  if i % 10 == 0 then puts i; end
  i += 1
end unless i < 100


# For [expression] loop
# prints out the even numbers between 1 and 50
# 0.50 syntax is a shorthand for a Ruby Range see http://ruby-doc.org/core-2.0/Range.html
for i in 0..50
  if i % 2 == 0 then puts i; end
end
