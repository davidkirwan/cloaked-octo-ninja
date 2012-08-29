#####################################################################################################################
### => Description  A simple ruby rake script for performing house cleaning functions on a directory, such as
#                   renaming all files to an incrementing number. Eg IMG_13302.jpg becomes 0.jpg, IMG_13303.jpg
#                   becomes 1.jpg, and IMG_13304.GIF becomes 2.gif. The script will then attempt to locate all
#                   duplicate files in the folder, and then move them to a duplicate folder.
#
### => Author       https://github.com/davidkirwan
#
### => Licence      Released under the creative commons attribution-sharealike 3.0 unported (cc by-sa 3.0) licence.
#                   for more information see: http://creativecommons.org/licenses/by-sa/3.0/
#
#####################################################################################################################

require 'fileutils'


class MoveDuplicates
  class << self
    
    
    attr_accessor :hashList
    
    
    def dealWithDuplicates(fileList, path, log)
      matchCheck = path.match(/\/$/)
      log.debug "The final character in the path is: " + matchCheck[0].to_s

      if matchCheck[0] == "/"
        dupPath = path + "duplicates"
      else
        dupPath = path + "/duplicates"
      end
      
      log.debug "Path: " + path
      log.debug "Duplicate Path: " + dupPath
      
      createDuplicateFolder(path, dupPath, log) 
      
      duplicateList = findDuplicates(fileList, path, log)
      
      theCount = moveDuplicates(duplicateList, dupPath, log)
      
      return theCount
    end
    
    
    def findDuplicates(fileList, path, log)
      duplicateList = Array.new
      shaList = Array.new
      
      fileList.each do |i|
        if shaList.include?(i["sha"])
          log.debug "#{i["path"]} is a duplicate file"
          duplicateList << i["path"]
        else
          shaList << i["sha"]
        end
      end

      return duplicateList
    end
    
    
    def moveDuplicates(duplicateList, dupPath, log)
      log.debug duplicateList.inspect
      log.debug duplicateList.count
      if duplicateList.count > 0
        duplicateList.each do |i|
          log.debug "Moving #{i} to #{dupPath}"
          FileUtils.mv(i, dupPath)
        end
      end
      return duplicateList.count
    end
    
    
    def createDuplicateFolder(path, dupPath, log)
      unless File.directory?(dupPath) then log.debug "Creating duplicates directory #{dupPath}"; FileUtils.mkdir(dupPath) end
    end
    
    
  end
end
