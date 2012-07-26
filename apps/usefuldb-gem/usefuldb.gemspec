# -*- encoding: utf-8 -*-
#$:.push File.expand_path("../lib", __FILE__)
require File.expand_path('../lib/usefuldb/version', __FILE__)
require 'rake'


Gem::Specification.new do |s|
  s.name        = 'usefuldb'
  s.version     = UsefulDB::Version
  s.date        = '2012-07-26'
  s.summary     = "A simple commands and URLs database for storage of useful information"
  s.description = "usefuldb is a simple database which is designed to store useful commands and URLs"
  s.authors     = ["David Kirwan"]
  s.email       = ['00346128@mail.wit.ie']
  s.require_paths = ["lib"]
  s.files       = FileList['lib/**/*.rb',
                      'bin/*',
                      '[A-Z]*',
                      'resources/*',
                      'test/**/*'].to_a
  s.homepage    = 'http://rubygems.org/gems/usefuldb'
  s.required_ruby_version = '>= 1.8.7'
  s.executables << 'usefuldb'
  s.post_install_message = <<-INSTALL
  
usefuldb - simple commands and or urls database for storage of useful information.

usefuldb is released under the creative commons attribution-sharealike 3.0 unported (cc by-sa 3.0) licence.
for more information see: http://creativecommons.org/licenses/by-sa/3.0/

INSTALL
  s.license 	= 'CC BY-SA 3.0'
  s.add_development_dependency "bundler"
  s.add_development_dependency "test-unit"
  s.add_development_dependency "rack-test"
end
