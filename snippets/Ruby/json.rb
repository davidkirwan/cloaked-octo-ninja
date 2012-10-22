####################################################################################################
# @author 	David Kirwan https://github.com/davidkirwan
# @description 	Sample script working with the JSON class in Ruby
#
# @date 	22-10-2012
####################################################################################################
require 'rubygems'
require 'json'

data = {"sequence" => 5, "data" => [23.5, 997.5, 65], "key" => "1234567890abcdef" }

puts data.to_json

puts JSON.pretty_generate(JSON.parse(data.to_json))
