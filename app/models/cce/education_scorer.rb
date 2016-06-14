class CCE::EducationScorer

=begin
  
  Constants below are for reference only. Please see: 'class Employee::Education' for their proper declaration.

  CRITERIA_TYPES = [
            'Highest Degree',
            'Additional Degree',
            'Additional Credits'
          ]

  LEVEL_TYPES = [
    'Doctorate',
    "Master's Degree",
    'LLB',
    'MD',
    'MD - Licensed',
    'Diploma Course',
    "Bachelor's",
    "Bachelor's (> 4 yrs.)",
    '3 yrs. post secondary course',
    'Special Course (non-degree)'
  ]
=end
  
  # Constants declared here are based on the declarations in 'class Employee::Education'.

  HIGHEST_DEGREE = 0
  ADDITIONAL_DEGREE = 1
  ADDITIONAL_CREDIT = 2

  DOCTORATE = 0
  MASTERS_DEGREE = 1
  LLB = 2
  MD = 3
  MD_LICENSED = 4
  DIPLOMA_COURSE = 5
  BACHELORS = 6
  BACHELORS_PLUS = 7
  THREE_YEARS_POST_SECONDARY = 8
  SPECIAL_COURSE = 9

  MINIMUM_BACHELOR_YEARS = 4


  def self.rate(record)
    # level, years_of_study, units_earned, criteria

    if record.criteria == HIGHEST_DEGREE
      score = case record.level
              when DOCTORATE        then 85
              when MD_LICENSED      then 85
              when MASTERS_DEGREE   then 65
              when LLB              then 65
              when MD               then 65
              when DIPLOMA_COURSE   then 55
              when BACHELORS        then 45
              when BACHELORS_PLUS
                if record.years_of_study.present?
                  rateable_years = record.years_of_study - MINIMUM_BACHELOR_YEARS
                  45 + (rateable_years * 5)
                else
                  45
                end

              when THREE_YEARS_POST_SECONDARY   then 30
              when SPECIAL_COURSE               then 25
              else 0
              end
    elsif record.criteria == ADDITIONAL_DEGREE
      if record.level == MASTERS_DEGREE
        score = 4
      elsif record.level == BACHELORS || record.level == BACHELORS_PLUS
        score = 3
      else
        score = 0
      end

    elsif record.criteria == ADDITIONAL_CREDIT
      if record.grade_units.present?
        grade_units = record.grade_units
        
        if grade_units > 30
          grade_units = 30
        end

        score = (grade_units / 3)
      else
        score = 0
      end      
    end   # def record.criteria == HIGHEST_DEGREE

  end   # def self.rate

end   # class CCE::EducationScorer

=begin

## for Educational Qualification check this table(s):
    * employee_educations

## CCE::EducationScorer ---> (Educational Qualification: 85 pts. max)
  1.1 Highest relevant academic degree or educational attainment
        Doctorate               85
        Master's Degree         65
        LLB / MD                65
        MD                      65
        MD - Licensed           85
        Diploma                 55
        Bachelor's              45
        Bachelor's (> 4 years)  45 plus 5 pts every year

        3 yrs. post secondary course    30
        Special Courses (non-degree)    25

  1.2 Additional equivalent degree earned related to present position
        Masters         4
        Bachelors       3
        * get the 'level' field value

  1.3 Additional credits earned
        * for every 3 units earned -> get the 'units' field value

=end
