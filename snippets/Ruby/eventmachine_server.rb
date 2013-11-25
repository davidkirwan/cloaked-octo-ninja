#!/usr/bin/env ruby
#####################################################################################################
### @author       David Kirwan https://github.com/davidkirwan/
### @description  Simple Eventmachine Server
###
### @date         2013-09-04
######################################################################################################
## Eventmachine: https://github.com/eventmachine/eventmachine

require 'eventmachine'

module EMServer
  def post_init
    puts "-- someone connected to the server!"
  end
  
  def unbind
    puts "-- someone disconnected from the server!"
  end

  def receive_data data
    send_data ">>> you sent: #{data}"
  end
end

EventMachine::run {
  EventMachine::start_server "127.0.0.1", 2000, EMServer
  puts 'running server on 2000'
}
