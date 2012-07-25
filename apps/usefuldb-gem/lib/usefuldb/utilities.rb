require 'usefuldb/exceptions'

module UsefulDB

  class UsefulUtils
    class << self
    
      attr_accessor :data, :dbpath
      
      #####################################################
      def addColour(text, colour_code)
        "\e[#{colour_code}m#{text}\e[0m"
      end
      
      def red(text); addColour(text, 31); end
      def green(text); addColour(text, 32); end
      def yellow(text); addColour(text, 33); end
      def blue(text); addColour(text, 34); end
      #####################################################
      
      
      # Save the database to disk
      def dbSave()
        if @dbpath.nil?
          @dbpath = File.expand_path(File.dirname(__FILE__) + '/../../resources/db.yaml')
          Settings.save(@data, @dbpath)
        else
          Settings.save(@data, @dbpath)
        end
      end
      
      
      # Load the database from disk
      def dbLoad()
        @dbpath = File.expand_path(File.dirname(__FILE__) + '/../../resources/db.yaml')
        Settings.load(dbpath)
        @data = Settings.data
      end
      
      
      # Return the number of elements in the database.
      def count()
        if @data.count == 0
          raise EmptyDB, "The DB is currently empty."
        else
          return @data.count
        end
      end
      
      
      # Add an element to the database
      def add(hash, opts)
        if @data.include?(hash) then raise EntryInDB, "Entry already in the DB"; else @data << hash; end    
      end
  
      
      # Remove an element from the database
      def remove(key, opts)
        if @data.count == 0
          raise EmptyDB, "You cannot call the remove function on an empty Database!"
        elsif @data.count < key || key < 0
          raise KeyOutOfBounds, "Key does not exist in the DB"
        else
          @data.delete_at(key) 
        end
      end
      
      
      # Search for a tag in the DB
      def search(tag)
        msg = "Searching the database for tag: " + yellow(tag) + "\n"
        
        @data.each do |db|
          if db["tag"].include?(tag)
            msg += "- Tags: " + db["tag"].to_s + "\n"
            msg += "- Value: " + db["value"] + blue("\n##\n")
          end
        end
        return msg
      end
      
  
    end
  end

end
