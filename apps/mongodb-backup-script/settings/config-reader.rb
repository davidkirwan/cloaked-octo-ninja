require 'yaml'

class Settings
  class << self

    attr_accessor :data
    
    def load(path)
      if File.exists?(path)
        @data = YAML::load( File.open( path ) )
      else
        puts "Error #{path} file not found, build failed!"
        exit()
      end     
    end

  end
end