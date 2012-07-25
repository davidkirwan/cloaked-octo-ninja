require 'test/unit'
require 'rack/test'
require 'fileutils'
require 'usefuldb'

ENV['RACK_ENV'] = 'test'

#####################################################
def addColour(text, colour_code)
  "\e[#{colour_code}m#{text}\e[0m"
end

def red(text); addColour(text, 31); end
def green(text); addColour(text, 32); end
def yellow(text); addColour(text, 33); end
def blue(text); addColour(text, 34); end
#####################################################


class UsefulDBTest < Test::Unit::TestCase

  include Rack::Test::Methods
  
  def setup
    UsefulDB.dbLoad
  end

  #def teardown
  #  UsefulUtils.dbSave
  #end


  # Test to check adding of entries to the database
  def test_add
    puts yellow("## Executing test_add")
  
    begin
      puts "Check the starting count in the DB is 2 entries: " +
      blue(assert_equal(2, UsefulDB.count()).to_s)
    
      entry = {"tag" => ["install", "rubygems", "website", "usefuldb"], "value" => "http://rubygems.org/usefuldb"}
      puts "Create a new entry: " + entry.inspect
    
      puts "Test to check adding duplicate element to the DB fails"
      UsefulDB.add(entry, {})
      
    rescue UsefulDB::EmptyDB => e
      assert(false, red(e.message))
    rescue UsefulDB::EntryInDB => e
      puts red(e.message) + green(" this is expected")
      #puts e.backtrace
    end
    
    begin
      puts "Write the DB structure back to disk"
      UsefulDB.dbSave
      UsefulDB.dbLoad
      
      puts "Check the total number of entries in the DB is still 2 " +
      blue(assert_equal(2, UsefulDB.count).to_s)  
    rescue UsefulDB::EmptyDB => e
      assert(false, red(e.message))
    end 
    
    msg = "Test to check adding new element to the DB succeeds: "
    begin
      entry2 = {"tag" => ["interesting", "gem", "website", "twitter"], "value" => "https://github.com/sferik/twitter/"}
      puts "Creating another element" + entry2.inspect
      
      UsefulDB.add(entry2, {})
      puts msg + blue(assert_equal(3, UsefulDB.count).to_s)
      
    rescue UsefulDB::EntryInDB => e
      assert(false, red(e.message))
      #puts e.backtrace
    rescue UsefulDB::EmptyDB => e
      assert(false, red(e.message))
    end
        
    puts green("test_add passed")
  end

 
  # Test to check saving entries to the database
  def test_save
    puts yellow("\n## Executing test_save")
    
    msg = "Test to check adding new element to the DB succeeds: "
    begin
      entry = {"tag" => ["interesting", "gem", "website", "twitter"], "value" => "https://github.com/sferik/twitter/"}
      puts "Creating another element" + entry.inspect
      
      UsefulDB.add(entry, {})
      puts msg + blue(assert_equal(3, UsefulDB.count).to_s)  
    rescue UsefulDB::EntryInDB => e
      puts red(e.message) + green(" this is expected")
      #puts e.backtrace
    rescue UsefulDB::EmptyDB => e
      assert(false, red(e.message))
    end
    
    begin
      puts "Saving the DB"
      UsefulDB.dbSave
      UsefulDB.dbLoad
    
      puts "Check the total number of entries in the DB is now 3 " +
      blue(assert_equal(3, UsefulDB.count).to_s)  
    rescue UsefulDB::EmptyDB => e
      assert(false, red(e.message))
    end

    begin
      UsefulDB.remove(2, {})
      UsefulDB.dbSave
    rescue UsefulDB::KeyOutOfBounds => e
      assert(false, red(e.message))
    rescue UsefulDB::EmptyDB => e
      assert(false, red(e.message))
    end

    puts green("test_save passed")
  end


  # Test to check removal of entries from the database
  def test_remove()
    puts yellow("\n## Executing test_remove")

    begin
      puts "Test to check adding new element to the DB succeeds"
      
      entry = {"tag" => ["test"], "value" => "testvalue"}
      entry2 = {"tag" => ["test2"], "value" => "testvalue2"}
      puts "Creating another element" + entry.inspect + " and " + entry2.inspect
 
      UsefulDB.add(entry, {})
      UsefulDB.add(entry2, {})
    rescue UsefulDB::EntryInDB => e
      assert(false, red(e.message))
    end

    begin
      puts "Saving the DB"
      UsefulDB.dbSave
      UsefulDB.dbLoad

      puts "Removing those 2 entries from the database"
      UsefulDB.remove(2, {})
      puts blue(assert_equal(3, UsefulDB.count))
      UsefulDB.remove(2, {})
      puts blue(assert_equal(2, UsefulDB.count))

      puts "Saving the DB"
      UsefulDB.dbSave
    rescue UsefulDB::KeyOutOfBounds => e
      assert(false, red(e.message))
    rescue UsefulDB::EmptyDB => e
      assert(false, red(e.message))
    end

    puts green("test_remove passed")
  end


end
