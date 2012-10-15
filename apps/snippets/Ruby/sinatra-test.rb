#!/usr/bin/env ruby
require 'rubygems'
require 'sinatra'

get '/' do
  "Hello World!"
end


get '/hello/:name' do
  @name = params[:name]
  erb :hello
end

__END__
@@ layout
<html>
  <body>
   <%= yield %>
  </body>
</html>

@@ hello
<h3>Hello <%= @name %>!</h3>
