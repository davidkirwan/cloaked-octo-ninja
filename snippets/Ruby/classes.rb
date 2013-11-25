####################################################################################################
# @author   David Kirwan https://github.com/davidkirwan
# @description  Snippet showing basic usage of Ruby classes
#
# @date   09-06-2013
####################################################################################################

# Definition of a basic class in Ruby ###########################################
class ExampleClass1
  
  # Constructor
  def initialize(newVar1, newVar2, newVar3, newVar4)
  
    # @ denotes it is an instance variable, all instances of the Class ExampleClass1 will
    # have a variable called var4. var1, var2, and var3 are also instance variables
    @var1 = newVar1
    @var2 = newVar2
    @var3 = newVar3
    @var4 = newVar4
    
  end
  
  
  # Getter for var4
  def getVar4()
    return @var4
  end
  
  # Setter for var4
  def setVar4(newVar)
    @var4 = newVar
  end

# This is the end of the ExampleClass1 class ###########################################
end


# Create an instance of class ExampleClass1 and assign it to a variable called tmp1
tmp1 = ExampleClass1.new(1, 2, 3, 4)

# print out the result gathered by executing the getter getVar4 on the tmp1 instance
puts tmp1.getVar4
# 4

####################################################################################################

# Ruby has a number of features designed to make your life easier. Lets look at a few of them
# which can be used to shorten the definition of the ExampleClass1. This new class ExampleClass2
# is identical in pracice to ExampleClass1
class ExampleClass2
  
  # attr_accessor automatically generates setters and getter functions for each instance variable
  # defined in this way. To access them simply call: "instancename.variablename" eg tmp.var4
  attr_accessor :var1, :var2, :var3, :var4
  
  # Constructor for ExampleClass2, making use of multiple assignments 
  def initialize(newVar1, newVar2, newVar3, newVar4)
    @var1, @var2, @var3, @var4 = newVar1, newVar2, newVar3, newVar4  
  end
  
end

# Construct an instance of the ExampleClass2 and assign it to the variable called tmp2
tmp2 = ExampleClass2.new(5, 6, 7, 8)

# Print out the var3 variable inside the tmp2 instance
puts tmp2.var3
# 7

####################################################################################################

# Class variables and Class functions
# A class variable is a variable for which only one copy exists for ALL instance copies of the class
# to which it belongs. If you have 50 copies of the ExampleClass3 class, only one copy of a class 
# variable exists for all of these 50 copies.

class ExampleClass3
  # Class Variable denoted by @@
  @@var1 = 0
  
  # self denotes getVar1 is a class method, class methods can be called on the Class and does
  # not require an instance of the class to first exist
  def self.getVar1()
    return @@var1
  end
    
end

# We don't need to create an instance of the ExampleClass3 in order to access the var1 as shown,
# but we do need a getter to access it.
puts ExampleClass3.getVar1
# 0
