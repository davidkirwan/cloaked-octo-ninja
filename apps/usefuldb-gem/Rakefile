require 'bundler'
Bundler::GemHelper.install_tasks

task :default => 'menu'

task :menu do
  puts welcomeMsg = <<-MSG
rake build    # Build usefuldb-x.x.x.gem into the pkg directory
rake install  # Build and install usefuldb-x.x.x.gem into system gems
rake release  # Create tag vx.x.x and build and push usefuldb-x.x.x.gem to http://rubygems.org/
rake test     # Run the unit testing suite on this gem.
MSG
end

desc "Run the unit testing suite on this gem."
task :test do
  $LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__) + '/lib')
  require 'usefuldb.rb'
  Dir.glob("./test/*_test.rb").each do |file|
   require file
  end
end
