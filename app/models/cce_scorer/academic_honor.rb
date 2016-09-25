=begin
check:  :degree_type and :honor_type
=end

module CCEScorer
  class AcademicHonor
    include CCEConstants::AcademicHonor
    
    def self.score(record)
      if record.degree_type == UNDERGRADUATE
        case record.honor_type
        when SUMMA_CUM_LAUDE then 5
        when MAGNA_CUM_LAUDE then 3
        when CUM_LAUDE then 1
        else 0
        end
      elsif record.degree_type == GRADUATE
        if record.honor_type == HONORS_WITH_DISTINCTION then
          3
        end
      else
        0
      end

    end   # def self.score(record)

  end
end
