module CCEConstants
  module AcademicDegree
    # Much better to use a Hash instead?
    
    DEGREE_TYPES = [
      "Doctorate",
      "Master's",
      "LLB",
      "MD",
      "MD - Licensed",
      "Diploma Course",
      "Bachelor's",
      "Bachelor's (over 4 yrs.)",
      "3 yr. post secondary course",
      "Special Course (non-degree)"
    ]

    DOCTORATE = 0
    MASTERS = 1
    LLB = 2
    MD = 3
    MD_LICENSED = 4
    DIPLOMA_COURSE = 5
    BACHELORS = 6
    BACHELORS_PLUS = 7
    THREE_YEARS_POST_SECONDARY = 8
    SPECIAL_COURSE = 9

    MINIMUM_BACHELOR_YEARS = 4  
  end   # module AcademicDegree
end   # module CCEConstants