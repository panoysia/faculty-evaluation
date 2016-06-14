module Admin::Employees::EducationsHelper

  def level_types_for_select
    Employee::Education::LEVEL_TYPES.each_with_index.map { |level, index| [level, index] }
  end

  def education_level_to_string(level)
    Employee::Education::LEVEL_TYPES[level]
  end

  def criteria_types_for_select
    Employee::Education::CRITERIA_TYPES.each_with_index.map { |criteria, index| [criteria, index] }
  end
  
  # CRITERIA_TYPES = [
  #           'Highest Degree',
  #           'Additional Degree',
  #           'Additional Credits'
  #         ]
  
  def education_criteria_to_string(criteria)
    Employee::Education::CRITERIA_TYPES[criteria]
  end

end