class CCE::Ranker
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def to_s
    "ehllo from CCE::Ranker"
  end

  def employee
    Employee.all.sample
  end
end

=begin

1. Save in education
2. Then before saving in Employee::CCEScorings, use CCE::Scorer object to determine score of education record

# Do the same with update

## CCE::ExperienceScorer --> (Experience & Length of Service :25 pts. max)
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

  2.3 Full-time industrial/agricultural/teaching

    2.3.1 For every year of relevant full-time professional and teaching experience
      
        Manager/Entrepreneur/Consultant         1.50
        Supervisor/Head of Unit                 1.0
        Rank and File                           0.5

        FIELD: 'rank' or 'position'

    2.3.2 For every year of experience in public and private basic institution
      
      Cooperating Teacher           0.75
      Basic Education Teacher       0.50

      * what field?


## CCE::ProfDevelopmentScorer


=end

=begin

  1. Loop through all the records in educations table
  *1. Filter records in educations table by criteria

=end