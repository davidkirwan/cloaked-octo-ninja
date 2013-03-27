## Ruby RSS Aggregator
A super light weight RSS Feed Aggregator built using the feed-normalizer and sinatra gems.

## Author
Original Author: Ilya Grigorik
URI: http://www.igvita.com/2007/03/22/agile-rss-aggregator-in-ruby/?ModPagespeed=noscript

Updated to run with Sinatra by David Kirwan
URI: https://github.com/davidkirwan/cloaked-octo-ninja/tree/master/apps/ruby-rss-aggregator

## Adding Feeds
Simply add an RSS/ATOM feed on a new line to the feeds.txt file

To deal with dependencies, I've used the Ruby _bundler_ gem. Run the following:

    bundle install

## Launching the System
foreman start -p <port-number>
