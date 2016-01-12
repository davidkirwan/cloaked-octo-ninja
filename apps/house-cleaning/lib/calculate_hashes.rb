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
require 'digest'

class CalculateHashes
  class << self
    attr_accessor :hashList

    def calculate_hash_list(path, log)
      @hash_list = Hash.new

      if path[path.size - 1] != "/" then path += "/"; end
      files = Dir["#{path}*"]
      log.debug "Path: " + path

      files.each do |i|
        if File.directory?(i)
          log.debug "#{i} is a directory, skipping..."
        else
          hash = calculate_hash(i, log)
          if @hash_list.has_key?(hash)
            @hash_list[hash][:files] << File.expand_path(i)
          else
            @hash_list[hash] = {:files => [File.expand_path(i)]}
          end
        end
      end

      return @hash_list
    end

    def calculate_hash(i, log)
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
      return sha1.to_s
    end


  end
end
