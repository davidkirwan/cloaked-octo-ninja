=begin
 Ruby Snippets
 Author: David Kirwan https://gitub.com/davidkirwan
 Licence: GPL 3.0
 A collection of code examples to help learn Ruby
    Copyright (C) 2018  David Kirwan

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.
=end
require "securerandom"


0.upto(9) do |i|
  0.upto(9) do |j|
    puts "#{i} XOR'd with #{j} gives: #{i ^ j}"
  end
end


message = "This is a secret message"
puts message
message_byte_array = message.unpack('U*')
puts message_byte_array.inspect

crypto_hex_str = SecureRandom.hex(message.size)
puts crypto_hex_str
crypto_byte_array = crypto_hex_str.scan(/.{1}/).each_slice(2).map { |f, l| (Integer(f,16) << 4) + Integer(l,16) }
puts crypto_byte_array.inspect

encrypted_byte_array = []
message_byte_array.each_with_index do |i, index|
  encrypted_byte_array << (i ^ crypto_byte_array[index])
end
puts encrypted_byte_array.inspect

decrypted_byte_array = []
encrypted_byte_array.each_with_index do |i, index|
  decrypted_byte_array << (i ^ crypto_byte_array[index])
end
puts decrypted_byte_array.inspect

decrypted_string = decrypted_byte_array.pack('U*').force_encoding('utf-8')
puts decrypted_string

puts message == decrypted_string
