=begin
  * Under "expert services" category and up to 20 pts. max.
  check: :level
=end

module CCEScorer
  class ProfessionalService
    include CCEConstants::ProfessionalService
    
    def self.score(record)
      points =  case record.level
                when INTERNATIONAL then 5
                when NATIONAL_OR_REGIONAL then 3
                when LOCAL then 2
                else 0
                end

    end 

  end  
end
