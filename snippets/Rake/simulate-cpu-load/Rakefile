####################################################################################################
# @author 	David Kirwan https://github.com/davidkirwan
# @description 	Ruby Rake script to generate a simulated CPU load on a system
#
# @usage 	rake -f simulate-cpu-load.rake simulate:cpuload
# 
# @date 	04-04-2013
####################################################################################################

### => Import libs
require 'rubygems'
require 'fileutils'
require 'logger'
require 'date'

### => Import custom libs
scriptPath = File.expand_path(File.dirname(__FILE__))

### => Variables
# => Date, used in some of the directory/filename generation
date = DateTime.now
theDate = date.year.to_s() + "-" + "%02d" % date.month.to_s() + "-" + "%02d" % date.day.to_s()

# Make the logs/ directory if it does not already exist
unless File.directory?("#{scriptPath}/logs") then FileUtils.mkdir("#{scriptPath}/logs") end

# Create the logger instance
@log = Logger.new("#{scriptPath}/logs/#{theDate}.log")

# Set the logging output level
@log.level = Logger::DEBUG
#@log.level = Logger::WARN
#@log.level = Logger::INFO

#################################################################################
task :default => 'menu'

task :menu do
@log.debug "Printing Welcome"

welcome = <<-WELCOME
rake simulate:cpuload # Simulates a CPU load on a system
WELCOME
  
  puts welcome
  
end
#################################################################################


namespace :simulate do

  desc "Simulate a CPU load"
  task :cpuload do
    @log.debug "Executing simulate:load task"
    puts "Executing simulate:load task"

    tasktimer = Time.now    

    100.times do |i|
      100000.downto(1) do |j|
        Math.sqrt(j) * i / 0.2
      end
    end
 
    @log.debug "Duration: #{Time.now - tasktimer} seconds"
    puts "Duration: #{Time.now - tasktimer} seconds"
 
  end
end

