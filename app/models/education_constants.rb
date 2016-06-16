module EducationConstants
=begin
  
  Constants below are for reference only. Please see: 'class Employee::Education' for their proper declaration.

  CRITERIA_TYPES = [
            'Highest Degree',
            'Additional Degree',
            'Additional Credits'
          ]

  LEVEL_TYPES = [
    'Doctorate',
    "Master's",
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

  HIGHEST_DEGREE = 0
  ADDITIONAL_DEGREE = 1
  ADDITIONAL_CREDIT = 2

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
end