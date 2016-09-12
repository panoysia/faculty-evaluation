=begin
=end

module CCEScorer
  class CreativeWork
    include CCEConstants::CreativeWork

    def self.score(record)
      # check:
      #   :criteria association
      #   :competitiveness
      
      #  record.criteria.each 
    end

  end   # CreativeWork
end   # CCEScorer