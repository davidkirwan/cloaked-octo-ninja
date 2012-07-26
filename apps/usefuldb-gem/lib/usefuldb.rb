require 'usefuldb/settings'
require 'usefuldb/utilities'
require 'usefuldb/exceptions'
require 'usefuldb/gui'
require 'usefuldb/version'
require 'fileutils'

module UsefulDB
  class << self
        
    def add(hash, opts)
      UsefulDB::UsefulUtils.add(hash, opts)
    end
  
    def count()
      UsefulDB::UsefulUtils.count
    end
    
    def remove(key, opts)
      UsefulDB::UsefulUtils.remove(key, opts)
    end
    
    def dbSave
      UsefulDB::UsefulUtils.dbSave
    end
    
    def dbLoad
      UsefulDB::UsefulUtils.dbLoad
    end
    
    def search(args)
      return UsefulDB::UsefulUtils.search(args)
    end
    
    def setup
      UsefulDB::UsefulUtils.setup
    end

  end
end
