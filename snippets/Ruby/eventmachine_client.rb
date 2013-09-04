#!/usr/bin/env ruby
####################################################################################################
## @author       David Kirwan https://github.com/davidkirwan/
## @description  Simple Eventmachine Client
##
## @date         2013-09-04
#####################################################################################################
# Eventmachine: https://github.com/eventmachine/eventmachine

require 'eventmachine'

class EMClient < EventMachine::Connection
  def post_init
    send_data 'Hello'
  end

  def receive_data(data)
    puts data
    close_connection
    EM.stop_event_loop
  end
  
  
end

EventMachine.run {
  EventMachine.connect '127.0.0.1', 2000, EMClient
}
