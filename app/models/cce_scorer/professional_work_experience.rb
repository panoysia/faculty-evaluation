=begin

2.3.1 For every year of relevant full-time professional and teaching experience
  
    Manager/Entrepreneur/Consultant         1.50
    Supervisor/Head of Unit                 1.0
    Rank and File                           0.5
    
=end

module CCEScorer
  class ProfessionalWorkExperience
    include CCEConstants::ProfessionalWorkExperience

    def self.score(record)
      points =  case record.position
                when MANAGER_CONSULTANT           then 1.50
                when SUPERVISOR_OR_HEAD_OF_UNIT   then 1.0
                when RANK_AND_FILE                then 0.5
                else 0
                end

      points * record.years_of_service
    end

  end   # class ProfessionalWorkExperience
end   # module CCEScorer
