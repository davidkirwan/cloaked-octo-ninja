#####################################################################################################################
### => Description  A simple ruby rake script for performing house cleaning functions on a directory, such as
#                   renaming all files to an incrementing number. Eg IMG_13302.jpg becomes 0.jpg, IMG_13303.jpg
#                   becomes 1.jpg, and IMG_13304.GIF becomes 2.gif. The script will then attempt to locate all
#                   duplicate files in the folder, and then move them to a duplicate folder.
#
### => Author       https://github.com/davidkirwan
#
### => Licence      GPL 2.0
#
#####################################################################################################################

require 'fileutils'

class FindDuplicates
  class << self
    attr_accessor :hashList

    def deal_with_duplicates(file_list, log)
      duplicate_list = find_duplicates(file_list, log)
      return duplicate_list
    end

    def find_duplicates(file_list, log)
      duplicate_list = Array.new
      file_list.each do |k, v|
        if v[:files].size > 1
          log.debug "File with hash: #{k} has duplicate files"
          puts "File with hash: #{k} has duplicate files"
          duplicate_list << k
        end
      end
      return duplicate_list
    end

  end
end
