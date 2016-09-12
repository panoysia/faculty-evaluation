=begin

1.3 Additional credits earned (max of 10 pts. in an 85 pt. system)
      * for every 3 units earned == 1 point

=end

module CCEScorer
  class AdditionalCredit
    
    # Should we use decimal values for the :no_of_units field?
    def self.score(record)
      units = record.no_of_units
      
      units = 30 if units > 30
      (units / 3.0)
    end

  end   # class AdditionalCredit
end   # module CCEScorer
