require 'yaml'

module UsefulDB

  class Settings
    class << self
  
      attr_accessor :data
      
      def load(path)
        @data = begin
          YAML.load(File.open(path))
        rescue ArgumentError => e
          exit("Could not parse YAML: #{e.message}")
        end  
      end
      
      def save(newData, path)
        @data = newData
        f = File.open(path, "w")
        f.write(@data.to_yaml)
        f.close
      end
  
    end
  end

end