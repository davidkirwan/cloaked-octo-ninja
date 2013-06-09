####################################################################################################
# @author 	David Kirwan https://github.com/davidkirwan
# @description 	Sample script working with the JSON class in Ruby
#
# @date 	09-06-2013
####################################################################################################
require 'rubygems'
require 'json'

# Create a test data hash
data = {"sequence" => 5, "data" => [23.5, 997.5, 65], "key" => "1234567890abcdef" }

# call the to_json method on this hash to convert the hash to a JSON string
puts data.to_json

# indent the JSON string in a human readable styled string
puts JSON.pretty_generate(JSON.parse(data.to_json))
