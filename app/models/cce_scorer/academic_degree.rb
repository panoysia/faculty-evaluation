=begin
Educational Qualification: 85 pts. max
  1.1 Highest relevant academic degree or educational attainment
        Doctorate                       85
        Master's Degree                 65
        LLB / MD                        65
        MD                              65
        MD - Licensed                   85
        Diploma                         55
        Bachelor's                      45
        Bachelor's (> 4 years)          45 plus 5 pts every year
  
        3 yrs. post secondary course    30
        Special Courses (non-degree)    25
=end

module CCEScorer
  class AcademicDegree
    include CCEConstants::AcademicDegree
    
    def self.score(record)
      points =  case record.degree_type
                when DOCTORATE        then 85
                when MD_LICENSED      then 85
                when MASTERS          then 65
                when LLB              then 65
                when MD               then 65
                when DIPLOMA_COURSE   then 55
                when BACHELORS        then 45
                when BACHELORS_PLUS  
                  years_of_study = record.years_of_study

                  if years_of_study >= MINIMUM_BACHELOR_YEARS  
                    rateable_years = years_of_study - MINIMUM_BACHELOR_YEARS

                      45 + (rateable_years * 5)
                  else
                    0
                  end

                  # else
                  #   45
                  # end

                when THREE_YEARS_POST_SECONDARY   then 30
                when SPECIAL_COURSE               then 25
                else 0
                end

    end   # def score

  end   # class AcademicDegree
end   # module CCEScorer
