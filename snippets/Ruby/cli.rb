#!/usr/bin/ruby
=begin
== Calculate percentage incease/decrease between two numbers
.Percentage Increase
To calculate the percentage increase:

- First: work out the difference (increase) between the two numbers you are comparing.
- Increase = New Number - Original Number
- Then:  divide the increase by the original number and multiply the answer by 100.
- % increase = Increase ÷ Original Number × 100.


.Percentage Decrease
If your answer is a negative number, then this is a percentage decrease.
To calculate percentage decrease:

- First: work out the difference (decrease) between the two numbers you are comparing.
- Decrease = Original Number - New Number
- Then: divide the decrease by the original number and multiply the answer by 100.
- % Decrease = Decrease ÷ Original Number × 100


Simple Ruby CLI example using Thor

Make it executable:

----
chmod 755 cli.rb
----

Run it:

----
./cli increase 50 100
The percentage increase between 50 and 100 is 100.0%
----
=end
require 'thor'

class CLI < Thor

  desc "increase [original, newnum]", "Calculate the percentage increase between original number, and new number."
  def increase(original, newnum)
    inc = newnum.to_f - original.to_f
    inc_percent = (inc / original.to_f) * 100

    puts "The percentage increase between #{original} and #{newnum} is #{inc_percent.round(2)}%"
  end

  desc "decrease [original, newnum]", "Calculate the percentage decrease between original number, and new number."
  def decrease(original, newnum)
    dec = original.to_f - newnum.to_f
    dec_percent = (dec / original.to_f) * 100

    puts "The percentage decrease between #{original} and #{newnum} is #{dec_percent.round(2)}%"
  end

  def self.exit_on_failure?
    true
  end
end
CLI.start(ARGV)
