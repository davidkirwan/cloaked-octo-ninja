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

class MoveDuplicates
  class << self
    attr_accessor :hashList

    def deal_with_duplicates(file_list, duplicate_list, path, log)
      if path[path.size - 1] != "/" then path += "/"; end
      dup_path = path + "duplicates"
      log.debug "Path: " + path + dup_path

      create_duplicate_folder(dup_path, log)
      the_count = move_duplicates(file_list, duplicate_list, path, dup_path, log)

      return the_count
    end

    def move_duplicates(file_list, duplicate_list, path, dup_path, log)
      log.debug duplicate_list.inspect
      count = 0
      duplicate_list.each do |i|
        log.debug "Processing duplicates for #{i}"
        puts "Processing duplicates for #{i}"
        file_list[i][:files].each do |j|
          if file_list[i][:files].first == j
            new_path = File.expand_path(path + i + File.extname(j))
            unless File.exists?(new_path)
              log.debug "Renaming #{j} to #{new_path}"
              FileUtils.mv(j, new_path)
            end
          else
            log.debug "Moving #{j} to #{dup_path}"
            FileUtils.mv(j, dup_path)
          end
        end
        count += file_list[i][:files].size
      end
      return count
    end

    def create_duplicate_folder(dup_path, log)
      unless File.directory?(dup_path) then log.debug "Creating duplicates directory #{dup_path}"; FileUtils.mkdir(dup_path) end
    end

  end
end
