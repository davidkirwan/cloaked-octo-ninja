####################################################################################################
# @author 	David Kirwan <dkirwan@tssg.org>
# @description 	Script for working with the Ruby Cryptographic library
#
# @date 	22-10-2012
####################################################################################################

require 'rubygems'
require 'digest'

password = "A user's password"
hash = Digest::SHA1.hexdigest(password)
puts hash

# This will produce the hash
# 62018390552aaba3d344e3b43bfa14e49e535dfc
