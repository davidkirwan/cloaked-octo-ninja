#!/usr/bin/env ruby

####################################################################################################
# @author 	David Kirwan <dkirwan@tssg.org>
# @description 	Script for testing the ruby date library
#
# @date 	23-2-2012
####################################################################################################


require 'date'

date = DateTime.now
theDate = date.year.to_s() << "-" << date.month.to_s() << "-" << date.day.to_s()

puts theDate
