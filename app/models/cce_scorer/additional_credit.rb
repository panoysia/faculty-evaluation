=begin

1.3 Additional credits earned
      * for every 3 units earned == 1 point
      * max of 10 pts. in the 85 pt. system of Educational Qualification
=end

module CCEScorer
  class AdditionalCredit
    
    # Should we use decimal values for the :no_of_units field?
    #
    # Do we only have whole numbers for the :no_of_units field
    #  or accept fractions?
    MAX_NO_OF_UNITS = 30
    THREE_UNIT_CREDIT = 3.0

    def self.score(record)
      units = record.no_of_units
      
      units = MAX_NO_OF_UNITS if units > MAX_NO_OF_UNITS
      (units / THREE_UNIT_CREDIT)
    end

  end   # class AdditionalCredit
end   # module CCEScorer
