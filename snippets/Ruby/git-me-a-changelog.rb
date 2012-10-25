#!/usr/bin/env ruby
##############################################################################################
# Written by David Kirwan
# http:/github.com/davidkirwan
# A simple system to generate changelogs between one tag and another.
#
# sample usage ./git-me-a-changelog.rb -p ~/Files/Git/Samplerepo v0.0.6 v0.0.10
#
##############################################################################################

# Require statements

class GitMeAChangelog
  
  attr_accessor :res


  # Class constructor
  def initialize()
    repopath = ARGV[0]
        
    unless ARGV[1] == nil then @tag1 = (tag_to_commit_hash(repopath, ARGV[1])).each_line.first; else puts "exiting.."; exit; end
    unless ARGV[2] == nil then @tag2 = (tag_to_commit_hash(repopath, ARGV[2])).each_line.first; else puts "exiting.."; exit; end
    unless ARGV[0] == nil then @res = log_to_hash(repopath, @tag1, @tag2) || '.'; else puts "exiting.."; exit end

    output_summary_report(repopath, ARGV[1], ARGV[2])

  end

  # scrape the Git log for the target directory then convert to a hash
  def log_to_hash(repopath, tag1, tag2)

    Dir.chdir(repopath)

    docs = []
    cmd = "git log --pretty='%H|%s' " + tag1 + ".." + tag2
    cmd = cmd.gsub("\n", "")
    puts "executing: #{cmd}"

    res = `#{cmd}`
    res.each_line do |line|
      parts = line.split('|')
      docs << {:commit=>parts[0], :subject=>parts[1]}
    end

    return docs
  end


  def output_summary_report(repopath, tag1, tag2)
    puts "Tag Commit Hashes:\n#{tag1}: #{@tag1}#{tag2}: #{@tag2}\n\n"
    
    @res.each do |i|
      puts i[:subject]
    end
  end


  def tag_to_commit_hash(repopath, tag)
    Dir.chdir(repopath)
    argline = "git log #{tag} --pretty='%H' "
    puts "executing: #{argline}"

    output=`#{argline} 2>&1` 

    #if result=$?.success?
      return output
    #else
    #  raise Exception, "Error tag not found"
    #end
  end


end


# Launch the system
puts "Usage: ./gitMeAChangelog.rb <path/to/git/repo> <startingtag> <endingtag>\n\n"
g = GitMeAChangelog.new()
