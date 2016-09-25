=begin
  check:   :degree_type and :scholarship_type
=end

module CCEScorer
  class Scholarship
    include CCEConstants::Scholarship
    
    def self.score(record)
      # Scoring table order representation is:
      #   "Doctorate" for first element (0th index)
      #   "Masters" for second element (1st index)
      #   "Non-degree" for third element (2nd index)
      international_competitive         = [5, 4, 3]
      international_non_competitive     = [3, 2, 1]
      national_competitive              = [3, 2, 1]
      national_non_competitive          = [2, 1, 0]
          
      degree = record.degree_type

      points =  case record.scholarship_type
                when INTERNATIONAL_COMPETITIVE
                  international_competitive[degree]

                when INTERNATIONAL_NON_COMPETITIVE
                  international_non_competitive[degree]

                when NATIONAL_COMPETITIVE
                  national_competitive[degree]

                when NATIONAL_NON_COMPETITIVE
                  national_non_competitive[degree]

                when LOCAL then 1

                else 0                    
                end
    end
    
  end
end
