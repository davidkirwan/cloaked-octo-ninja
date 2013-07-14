####################################################################################################
# @author       David Kirwan https://github.com/davidkirwan
# @description  DateString Class
#
# @date         2013-07-12
####################################################################################################
# Imports
require 'logger'

module Common
  module Tasks


    ##
    # Common::Tasks::DateString#now Returns a String with todays date in the form YYYY-MM-DD
    #
    # * *Args* :
    # - ++ ->   
    # * *Returns* :
    # -         String
    # * *Raises* :
    #           
    #
    class DateString
      def self.now
  	    now = DateTime.now
        return now.year.to_s + "-" + "%02d" % now.month + "-" + "%02d" % now.day
      end
    end # End of the DateString class


  end
end