####################################################################################################
# @author 	David Kirwan <dkirwan@tssg.org>
# @description 	Script for working with the Ruby Cryptographic library
#
# @date 	22-10-2012
####################################################################################################

require 'rubygems'
require 'digest'

#!/usr/bin/env ruby
require 'digest'

password = "A user's password"
hash = Digest::SHA1.base64digest(password)
puts hash.size
puts hash

password = "A user's password"
hash = Digest::MD5.hexdigest(password)
puts hash.size
puts hash

password = "A user's password"
hash = Digest::SHA1.hexdigest(password)
puts hash.size
puts hash

password = "A user's password"
hash = Digest::SHA2.hexdigest(password)
puts hash.size
puts hash
