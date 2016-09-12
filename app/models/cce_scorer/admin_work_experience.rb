=begin

2.2 Administrative Experience
  For every full time year of administrative experience as:

    President                     3.0
    Vice President                2.5
    
    Dean/Director/
    School Superintendent         2.0
    
    Principal/Supervisor/
    Department Chairperson/
    Head of Unit                  1.5

    Faculty                       1

    FIELD: 'rank' or 'position'

=end

module CCEScorer
  class AdminWorkExperience
    include CCEConstants::ClassName

    def self.score(record)
      points =  case record.position
                when PRESIDENT then 3.0

                when VICE_PRESIDENT then 2.5
                
                when DEAN then 2.0
                when DIRECTOR then 2.0
                when SCHOOL_SUPERINTENDENT then 2.0

                when PRINCIPAL then 1.5
                when SUPERVISOR then 1.5
                when DEPARTMENT_CHAIRPERSON then 1.5
                when HEAD_OF_UNIT then 1.5
                
                when FACULTY then 1.0
                end

      points * record.years_of_service

    end   # self.score

  end   # class AdminWorkExperience
end   # module CCEScorer