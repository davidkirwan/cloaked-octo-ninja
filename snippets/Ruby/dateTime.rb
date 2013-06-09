####################################################################################################
# @author 	David Kirwan https://github.com/davidkirwan/
# @description 	Script for testing the ruby date library
#
# @date 	09-06-2013
####################################################################################################
# STDLIB: http://ruby-doc.org/stdlib-2.0/libdoc/date/rdoc/DateTime.html

# Imports
require 'rubygems'
require 'date'

# Construct a DateTime object called date
date = DateTime.now

# Print out the full data available in the DateTime object
puts date
# eg 2013-06-09T14:57:15+01:00

# Create a string containing the YYYY-MM-DD format date. Ensures single digit days/months produce
# double digit output, ie, 9 becomes 09 etc.
theDate = date.year.to_s() + "-" + "%.2d" % date.month + "-" + "%.2d" % date.day

# Print out the final result
puts theDate
# eg 2013-06-09
