###########################################################################################################
### => Description  A simple ruby script for searching the 4chan random image board, looking for posts which
#                   contain a specified search string, it will attempt to download all images in the thread
#                   if it was an OP post which contained the search, otherwise if it was a random reply, it
#                   will download only that one image.
#
### => Author       https://github.com/davidkirwan
#
### => Licence      Released under the creative commons attribution-sharealike 3.0 unported (cc by-sa 3.0) licence.
#                   for more information see: http://creativecommons.org/licenses/by-sa/3.0/
#
### => Disclaimer   I've added a little randomness into the timing of http requests to the server, but if they spot
#                   what your upto, don't come crying when you get your IP banned newf*g!
#
### => Dependencies The script requires the Nokogiri gem, so be a good chap and install that first. It also
#                   requires that you have wget installed in your PATH.
#
#
#
### => Config       Change this to what ever it is your searching for.. I ain't judging bro :3
searchString = "caturday"
#
###########################################################################################################

require 'nokogiri'
require 'open-uri'


def sleepyTime()
  num = rand(5..45)
  
  if num % 3 == 0 then return num * 2; else return num * 1.25; end
end


def downloadALLthepics(theArg)
  puts theArg
  begin
    doc = Nokogiri::HTML(open(theArg))
    
    doc.xpath('//div[@class="thread"]').each do |i|

      i.xpath('div[@class="postContainer opContainer"]//div[@class="post op"]').each do |j|
        
        img = "http:" + j.xpath('div[@class="file"]//a').attribute("href")
          
        if img == nil
        else
          puts img
          if File.exists?(File.basename(img)) then ; else `wget #{img}`; end
        end
        
      end
      
      i.xpath('div[@class="postContainer replyContainer"]//div[@class="post reply"]').each do |j|
        
        img = "http:" + j.xpath('div[@class="file"]//a').attribute("href")
        
        if img == nil
        else
          puts img
          if File.exists?(File.basename(img)) then ; else `wget #{img}`; end
        end
        
      end
      
      sleep(rand(1..5))
      
    end

  rescue Exception => e
    puts e.message    
  end 
  
end


def searchFunction(theArg, rgx)
  puts theArg
  begin
    doc = Nokogiri::HTML(open(theArg))

    doc.xpath('//div[@class="thread"]').each do |i|

      i.xpath('div[@class="postContainer opContainer"]//div[@class="post op"]').each do |j|
        if j.xpath('blockquote[@class="postMessage"]').text.match(rgx)
          puts "OP POST"
          id = i.attribute("id").content.delete("t")

          url = "http://boards.4chan.org/b/res/" + id.delete("m")
          puts url

          puts j.xpath('blockquote[@class="postMessage"]').text

          img = "http:" + j.xpath('div[@class="file"]//a').attribute("href")
          
          downloadALLthepics(url)        
          
        else

        end
      end

      i.xpath('div[@class="postContainer replyContainer"]//div[@class="post reply"]').each do |j|
        if j.xpath('blockquote[@class="postMessage"]').text.match(rgx)
          puts "REPLY POST"
          id = i.attribute("id").content.delete("t")

          url = "http://boards.4chan.org/b/res/" + id.delete("m")
          puts url

          puts j.xpath('blockquote[@class="postMessage"]').text

          img = "http:" + j.xpath('div[@class="file"]//a').attribute("href")

          if img == nil
          else
            puts img
            if File.exists?(File.basename(img)) then ; else `wget #{img}`; end
          end
        else

        end
      end

    end
    
    puts "#####"

    puts "Sleeping for " + (sleepVal = sleepyTime()).to_s + " seconds"
    sleep(sleepVal)
    puts "Trying another random page\n"

  rescue Exception => e
    puts e.message
  end

end


pt1 = "/(.*)"
pt2 = "(.*)/"
final = pt1 + searchString + pt2
theArg = 'http://boards.4chan.org/b/'
rgx = Regexp.new(eval(final))


t = Thread.new do
  while true
    searchFunction(theArg + rand(1..10).to_s, rgx)
  end
end

Kernel.gets
t.kill

