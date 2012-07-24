require 'usefuldb/exceptions'


class UsefulUtils
  class << self
  
    attr_accessor :data, :dbpath
    
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
    
    def add(hash)
      if @data.include?(hash) then raise EntryInDB, "Entry already in the DB"; else @data << hash; end    
    end
  
  end
end