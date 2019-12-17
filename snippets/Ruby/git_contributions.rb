=begin
####################################################################################################
# @author 	David Kirwan https://github.com/davidkirwan/
# @date 	2019-12-17
# @description 	Script for generating contribution statistics for a group of git repos
repos/
├── deprecated
│   ├── oldthing
│   └── someotheroldthing
├── project1
│   ├── ci_cd
│   ├── some-tools
│   └── walkthroughs
└── project2
    ├── inventories
    └── utils
{
  "deprecated": {
    "repos": {
      "oldthing": 5,
      "someotheroldthing": 9
    },
    "contributions": 14
  },
  "project1": {
    "repos": {
      "ci_cd": 29,
      "some-tools": 0,
      "walkthroughs": 0,
    },
    "contributions": 29
  },
  "project2": {
    "repos": {
      "inventories": 7,
      "utils": 89,
    },
    "contributions": 86
  },
  "total_contributions": 129,
  "date": 1576614262,
  "name": "David Kirwan"
}
####################################################################################################
=end
require "json"
require "time"
require 'open3'


@result = {}
@name = "David Kirwan"
@now = Time.now.to_i
@repo_path = "~/repos"
puts "Generating report for: #{@now}:#{@name}"


def process(path)
  result = {}
  Dir.chdir(File.expand_path(path)) {
    Dir.glob("*").map { |p|
      if File.directory?(File.expand_path(p))
        Dir.chdir(File.expand_path(p)) {
          stdout, stderr, status = Open3.capture3('git status')
         if status.exitstatus == 0
           stdout1, stderr1, status1 = Open3.capture3("git log | grep \"#{@name}\" | wc -l")
           repo = p.split("/").reverse.first
           result[repo] = stdout1.strip.to_i
          end
        }
      end
    }
  }
  total_path_contributions = result.map {|i,v| v}.reduce(:+)
  return {:repos=>result, :contributions=>total_path_contributions}
end

Dir.chdir(File.expand_path(@repo_path)) { 
  Dir.glob("*").map  do |path| 
    if File.directory?(File.expand_path(path)) 
      @result[path] = process(path)
    end
  end
}

total_contributions = @result.map {|k,v| v[:contributions] }.reduce(:+)
@result[:total_contributions] = total_contributions
@result[:date] = @now
@result[:name] = @name
pretty = JSON.pretty_generate(@result)
puts pretty

f = File.open("#{@now}.json", "w")
f.write(pretty)
f.close
