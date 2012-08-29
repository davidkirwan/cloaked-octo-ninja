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

class RenameFiles
  class << self
    
    def renameFileList(path, log)

      matchCheck = path.match(/\/$/)
      log.debug "The final character in the path is: " + matchCheck[0].to_s

      if matchCheck[0] == "/"
        files = Dir["#{path}*"]
      else
        files = Dir["#{path}/*"]
        path += "/"
      end
  
      log.debug "Path: " + path
            
      cursor = 0
      files.each do |i|
        if File.directory?(i)
          log.debug "#{i} is a directory, skipping..."
        else
          log.debug "Full file name: " + File.basename(i)
          log.debug "File extension: " + File.extname(i)
          log.debug "File name: " + File.basename(i,File.extname(i))
          renameFile(i, path, cursor, log)
          cursor += 1
        end
      end
    end
    

    def renameFile(i, path, cursor, log)
      ext = (File.extname(i)).downcase
      outputFile = path + cursor.to_s + ext
        
      if i == outputFile
        log.debug "Input file has the same name as the output file, skipping..."
      else
        if File.exists?(outputFile)
          log.debug "Output file already exists, skipping..."
        else
          log.debug "Renaming file from #{i} to #{outputFile}"
          FileUtils.mv(i, outputFile)
        end
      end
    end


  end
end

