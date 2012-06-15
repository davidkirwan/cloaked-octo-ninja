#!/usr/bin/env ruby
####################################################################################################
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
####################################################################################################
# @author       David Kirwan
# @description  Ruby Script for creating a html file to access that directory structure.
#
# @date         21-03-2012
# @version	0.1
####################################################################################################
# Imports
require 'find'

# Variables
#path = '.'
imgPath = 'http://yoursite.com/'


def document_tree(directory, imgPath)

  filename = File.join(directory, 'index.html')
  folImg = File.join(imgPath, 'folder.gif')
  filImg = File.join(imgPath, 'file.gif')

  puts "Creating and writing index.html file to: " << directory

  html = File.open(filename, 'w')

  html.write "<html><head>"
  html.write "<title>Contents for the - "
  html.write File.basename(directory)
  html.write " folder</title>"
  html.write "<style type=\"text/css\">body {background-color: #888888; font-size:15px;} A:link {color:#000000;} A:visited {color:#000000;} A:hover {color:#444444;}</style><body>"
  html.write "<h1>Directory Listings - " << File.basename(directory) << "</h1>"
  html.write "<img src='#{folImg}'/><a href='.'>.</a><br/>"
  html.write "<img src='#{folImg}'/><a href='..'>..</a><br/>"

  Dir[File.join(directory, '*')].sort.each do |l|

    if File.directory?(l)
      html.write "<img src='#{folImg}'/>"
      html.write "<a href='" << File.basename(l) << "'>" << File.basename(l) << "</a>"
      html.write "<br/>\n"
    else
      if File.basename(l) == "index.html"
      else
        html.write "<img src='#{filImg}'/>"
        html.write "<a href='" << File.basename(l) << "'>" << File.basename(l) << "</a>"
        html.write "<br/>\n"
      end

    end
  end


  html.write "<\/body><\/html>"
  html.close
end



####  Script
Dir['**/*'].each do |j|
  if File.directory? j
      document_tree(j, imgPath)
  end
end

