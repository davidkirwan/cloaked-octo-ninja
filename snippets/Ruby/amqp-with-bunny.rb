####################################################################################################
# @author       David Kirwan https://github.com/davidkirwan
# @description  Snippet showing basic means to consume data from a RabbitMQ exchange using the Bunny gem
#               Will connect to a RabbitMQ server running on localhost:5672, and bind then act as a consumer
#               for the "exchange_topic_name" exchange with routing key "binding_key"
#
# @date         2014-01-27
####################################################################################################

@options = {
  :host=>"localhost",
  :port=>5672,
  :user=>'guest',
  :password=>'guest',
  :vhost=>'/',
  :heartbeat=>:server,
  :threaded=>true,
  :out_topic=>'exchange_topic_name',
  :out_binding_key=>'binding_key'
}

require "bunny"

conn = Bunny.new(:host=>@options[:host],
                 :port=>@options[:port],
                 :user=>@options[:user],
                 :password=>@options[:password]
                )
conn.start

ch   = conn.create_channel
x = ch.topic(@options[:out_topic])
#ch.prefetch(10) # If you wanted to prefetch 10 payloads
q    = ch.queue("", :durable=>false, :auto_delete => true).bind(x, :routing_key=>@options[:out_binding_key])

begin
  loop do
    delivery_info, properties, payload = q.pop(:ack=>false)
    unless payload == "" or payload.class == NilClass then puts payload; end
  end
rescue Exception => e
  q.delete
  conn.close
end

conn.close
