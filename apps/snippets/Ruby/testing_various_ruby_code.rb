# Hash example #################################
hash = { "key1" => "val1", "key2" => "val2", "key3" => "val3", "key4" => "val4"}

# Building up a string from a hash #############
test = ""
hash.each { |k, v| test << "#{k} is #{v}\n" }
puts test

# Building up a string from a hash ###########
test2 = ""
hash.each { |k, v| test2 << k << " is " << v << "\n"}
puts test2


data = ['1', '2', '3']
s = ''
data.each { |x| s << x << ' and a ' } 	# manually building up the string step by step
puts s
puts data.join(' and a ')	# inserts ' and a ' between each element


# Substitution of variables ###############
number = 5

puts "The number is #{number + 5}"  # 10

puts "The number is #{number = 20; number += 1}" # 21


# Substituting variables into strings #####
template = 'I woke up this morning next to a %s.'
puts template % 'cat'
puts template % 'dog'

derp = 5.000001
puts 'To 5 decimal places %.5f' % derp

derp1 = 5.00001
template1 = 'To 5 decimal places %.5f'
puts template1 % derp1


# ERB Templates #########################
require 'erb'

template2 = %q{
<% if problems.empty? %>
   looks like your code is clean!
<% else %>
   I found the following possible problems with your code:
   <% problems.each do |problem, line| %>
    * <%= problem %> on line <%= line %>
   <% end %>
<% end %>}.gsub(/^\s+/, '')
template2 = ERB.new(template2, nil, '<>')

# Test run 1 with problems.
problems = [["Use of is_a? instead of some other function", 23],
	   ["Some test sentence to show the use of this template", 50]]
puts "\n"
puts template2.run

# Test run 2 with no problems.
problems = []
puts "\n"
puts template2.run

###########################################
# Reversing Strings

reverse = '.ekil skool gnirts desrever a tahw si siht os'

puts reverse + "\n"
puts reverse.reverse + "\n" 	# Creates a new string from reverse.reverse() 
puts reverse.reverse! + "\n"    # Reverses reverse in place and overwrites it
puts reverse + "\n"

# Reversing words as they appear in a sentence
s = 'order. wrong the in are words These'
puts "\nOrigional String: " +  s
puts s.split(/(\s+)/).reverse!.join('')		# Regular expression (\s+) matches one or more white space characters
puts s.split(/\b/).reverse!.join('')		# Regular expression \b matches a word boundary. (Also matches punctuation!)


# Comparing Regular expressions
puts "### one two three one two three".split(/(\s)/)
puts "### one two three one two three".split(/\s+/)
puts "### one two three one two three".split(/\s/)
puts "### one two three one two three".split(/\b/)


# Pattern Matching
pattern = /[\x80-\xff]/

puts 'Test' =~ pattern
puts "Te\212st" =~ pattern

puts "e\212st"

# One char at a time from a string
'test string'.scan( /./ ) { |c| puts c }


###################################### Working with Files ##############################################################
# Opening a file to read.
open('test.txt') { |f| puts f.read }


# Opening a file in append mode.
open('test.txt', 'a') do |f|
f << "so lets see if this works."
end

