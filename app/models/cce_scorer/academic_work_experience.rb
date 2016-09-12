=begin

2.1 Academic Experience
  2.1.1
    For every year of full-time academic service     
      in a state institution or higher learning       1

  2.1.2
    For every year of full-time academic service
      in an institution of higer learning other than
      SUCs, CHED-Supervised and TESDA Schools;
      service in a public or private research
      institution                                     0.75

=end

module CCEScorer
  class AcademicWorkExperience
    include CCEConstants::AcademicWorkExperience

    def self.score(record)
      if record.institution_type == SUC
        1.0 * record.years_of_service
      elsif record.institution_type = NON_SUC
        0.75 * record.years_of_service
      end
    end

  end   # class AcademicWorkExperience
end   # module CCEScorer