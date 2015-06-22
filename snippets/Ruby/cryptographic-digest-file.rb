#!/usr/bin/env ruby
####################################################################################################
# @author 	David Kirwan <dkirwan@tssg.org>
# @description 	Script for working with the Ruby Cryptographic library
#
# @date 	22-10-2012
####################################################################################################

require 'digest'

sha1 = Digest::SHA1.new

File.open(ARGV[0]) do|file|
  buffer = ''

  # Read the file 512 bytes at a time
  while not file.eof
    file.read(512, buffer)
    sha1.update(buffer)
  end
end

puts sha1  # Implicitly calls to_s
