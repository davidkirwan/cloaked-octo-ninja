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

require 'yaml'

class ConfigReader
  class << self

    attr_accessor :data

    def load(path, log)
      if File.exists?(path)
        @data = YAML::load( File.open( path ) )
      else
        log.fatal "Error #{path} file not found, build failed!"
        exit()
      end
      
      return @data
    end

  end
end