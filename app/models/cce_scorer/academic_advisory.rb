=begin
  check: :nature; (max 10 pts.)  
=end

module CCEScorer
  class AcademicAdvisory
    include CCEConstants::AcademicAdvisory
    
    def self.score(record)

      case record.nature
      when DOCTORAL then 1.00
      when MASTERS then 0.50
      when UNDERGRADUATE then 0.25
      else 0
      end

    end

  end  
end
