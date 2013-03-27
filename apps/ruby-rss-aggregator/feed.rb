require 'open-uri'
require 'feed-normalizer'
require 'sinatra/base'


class RSSBrah < Sinatra::Base

  ##### Variables
  enable :static, :sessions, :logging
  set :environment, :production
  set :root, File.dirname(__FILE__)
  set :public_folder, Proc.new {File.join(root, '/public')}
  set :views, Proc.new {File.join(root, '/views')}


  get '/' do
    stories = []
    File.open('feeds.txt', 'r').each_line do |f|
      feed = FeedNormalizer::FeedNormalizer.parse open(f.strip)
      stories.push(*feed.entries)
    end

    erb :index, :locals => {:stories => stories} 
  end

end
