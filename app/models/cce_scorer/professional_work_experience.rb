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
      points = if record.position == MANAGER_CONSULTANT
                1.50
              elsif record.position == SUPERVISOR_OR_HEAD_OF_UNIT
                1.0
              elsif record.position == RANK_AND_FILE
                0.5
              end

      points * record.years_of_service
    end

  end   # class ProfessionalWorkExperience
end   # module CCEScorer
