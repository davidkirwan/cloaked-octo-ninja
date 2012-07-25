require 'usefuldb/utilities'

module UsefulDB

  class GUI
    class << self
      attr_accessor 
       
      def search(args)
        UsefulDB.dbLoad
        args.each {|i| puts "\n" + UsefulDB::UsefulUtils.search(i)} 
      end
       
       
      def add(opts)
        UsefulDB.dbLoad
        if opts[:v] then puts "in verbose mode\n"; end
        
        puts "Please enter the comma separated search tags like the following:"
        if opts[:v] then puts "eg:\nterm1, term2, term3\n\n"; end
        
        begin
          tags = ((STDIN.gets).strip).split(', ')
          puts "The following was captured: " + tags.to_s
          puts "Is this correct? y/n"
          
          input = (STDIN.gets).strip
          if input == "y"
            puts "Please enter the value you wish to store for this database entry:"
            value = (STDIN.gets).strip
            
            puts "The following was captured: " + value
            puts "Is this correct? y/n"
            input = (STDIN.gets).strip
            if input == "y"
              entry = {"tag" => tags, "value" => value}
              
              if opts[:v] then puts "Storing the following in the database:\n" + entry.to_s; end
              
              UsefulDB.add(entry, {})
              UsefulDB.dbSave
              
            else
              puts "Exiting"
              exit
            end
          else
            puts "Exiting"
            exit
          end
          
        rescue Exception => e
          puts e.message
          exit
        end
        
      end
    
    
    end
  end

end