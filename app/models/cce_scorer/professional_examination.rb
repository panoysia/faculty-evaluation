=begin
  (max 10 pts.)
  check: :category
=end

module CCEScorer
  class ProfessionalExamination
    include CCEConstants::ProfessionalExamination
    
    def self.score(record)
      points =  case record.category
                when PROFESSIONAL_CERTIFICATE then 5
                when CAREER_SERVICE then 3
                when SEAMAN_CERTIFICATE then 2
                when IT_CERTIFICATE then 2
                when NATIONAL_CERTIFICATE then 1
                else 0
                end
    end

  end
end
