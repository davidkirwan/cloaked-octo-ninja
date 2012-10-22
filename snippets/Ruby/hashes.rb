####################################################################################################
# @author 	David Kirwan <dkirwan@tssg.org>
# @description 	Script for examining basics of Ruby Hash's
#
# @date 	22-10-2012
####################################################################################################


hashOne = Hash.new

hashOne["test"] = 5

puts hashOne["test"]


# Hash literal
testHash = {
              0 => {
              "parent" => { "id" => 1, "subject" => 'test parent subject for parent id 1' },
              "features" => [  { "id" => 1, "subject" => 'test feature subject for id 1', "parent" => "0"},
                              { "id" => 2, "subject" => 'test feature subject for id 2', "parent" => "0"},
                              { "id" => 3, "subject" => 'test feature subject for id 3', "parent" => "0"}
                          ]
              } 
          }

puts testHash[0]["parent"]["subject"]
puts testHash[0]["features"][0]["subject"]
puts testHash[0]["features"][1]["subject"]
puts testHash[0]["features"][2]["subject"]
puts testHash[0]["features"][2]["parent"]
