=begin

2.3.2 For every year of experience in public and private basic institution
  
  Cooperating Teacher           0.75
  Basic Education Teacher       0.50

=end

module CCEScorer
  class PublicPrivateWorkExperience
    include CCEConstants::PublicPrivateWorkExperience

    def self.score(record)
      points =  if record.position == COOPERATING_TEACHER
                  0.75
                elsif record.position == BASIC_EDUCATION_TEACHER
                  0.50
                else
                  0
                end

      points * record.years_of_service
    end

  end   # class PublicPrivateWorkExperience
end   # module CCEScorer
