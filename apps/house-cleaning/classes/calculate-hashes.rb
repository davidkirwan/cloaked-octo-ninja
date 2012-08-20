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
require 'digest'


class CalculateHashes
  class << self
    
    
    attr_accessor :hashList
    
    
    def calculateHashList(path, log)
      @hashList = Array.new
      
      if path.scan(/\/$/) == "/"
        files = Dir[path + "*"]
      else
        files = Dir[path + "/*"]
        path += "/"
      end
      
      log.debug "Path: " + path
      
      files.each do |i|
        if File.directory?(i)
          log.debug "#{i} is a directory, skipping..."
        else
          @hashList << calculateHash(i, log)
        end
      end
      
      return @hashList
    end
    
    def calculateHash(i, log)
      sha1 = Digest::SHA1.new
      File.open(i) do |file|
        buffer = ''
        # Read the file 512 bytes at a time
        while not file.eof
          file.read(512, buffer)
          sha1.update(buffer)
        end
        file.close
      end
      theHash = {"path"=>i, "sha"=>sha1.to_s}
      log.debug theHash.inspect
      
      return theHash
    end
    
    
  end
end