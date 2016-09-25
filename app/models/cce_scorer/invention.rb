=begin

  Part of the criteria: Prof. Development, Achievement and Honors
    * Max of 90 pts.

  Sub-part of Discoveries, patented inventions, innovations, publications and other creative works.
    * Max of 30 pts. in the 90 pts. overall
     
=end

module CCEScorer
  class Invention
    include CCEConstants::Invention

    def self.score(record)
      if record.patent_type == UTILITY_MODEL 
        7
      elsif record.patent_type == NON_UTILITY_MODEL
        5
      else
        0
      end
    end
    
  end
end
