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
    UsefulUtils.dbLoad
  end

  #def teardown
  #  UsefulUtils.dbSave
  #end
  
  def test_add
    puts yellow("## Executing test_add")
  
    begin
      puts "Check the starting count in the DB is 2 entries: " +
      blue(assert_equal(2, UsefulUtils.count()).to_s)
    rescue EmptyDB => e
      assert(false, red(e.message))
    end
    
    entry = {"tag" => ["install", "rubygems", "website", "usefuldb"], "value" => "http://rubygems.org/usefuldb"}
    puts "Create a new entry: " + entry.inspect
    
    puts "Test to check adding duplicate element to the DB fails"
    begin
      UsefulUtils.add(entry)
    rescue EntryInDB => e
      puts red(e.message) + green(" this is expected")
      #puts e.backtrace
    end
    
    puts "Write the DB structure back to disk"
    UsefulUtils.dbSave
    UsefulUtils.dbLoad
    
    begin
      puts "Check the total number of entries in the DB is still 2 " +
      blue(assert_equal(2, UsefulUtils.count).to_s)  
    rescue EmptyDB => e
      assert(false, red(e.message))
    end
    
    entry2 = {"tag" => ["interesting", "gem", "website", "twitter"], "value" => "https://github.com/sferik/twitter/"}
    puts "Creating another element" + entry2.inspect
    
    msg = "Test to check adding new element to the DB succeeds: "
    begin
      UsefulUtils.add(entry2)
      puts msg + blue(assert_equal(3, UsefulUtils.count).to_s)  
    rescue EntryInDB => e
      puts red(e.message) + green(" this is expected")
      #puts e.backtrace
    rescue EmptyDB => e
      assert(false, red(e.message))
    end
        
    puts green("test_add done")
  end
  
  
  def test_save
    puts yellow("\n## Executing test_save")
    
    entry = {"tag" => ["interesting", "gem", "website", "twitter"], "value" => "https://github.com/sferik/twitter/"}
    puts "Creating another element" + entry.inspect
    
    msg = "Test to check adding new element to the DB succeeds: "
    begin
      UsefulUtils.add(entry)
      puts msg + blue(assert_equal(3, UsefulUtils.count).to_s)  
    rescue EntryInDB => e
      puts red(e.message) + green(" this is expected")
      #puts e.backtrace
    rescue EmptyDB => e
      assert(false, red(e.message))
    end
    
    puts "Saving the DB"
    UsefulUtils.dbSave
    UsefulUtils.dbLoad
    
    begin
      puts "Check the total number of entries in the DB is now 3 " +
      blue(assert_equal(3, UsefulUtils.count).to_s)  
    rescue EmptyDB => e
      assert(false, red(e.message))
    end
    
    puts green("test_save done")
  end

end