module Admin::Employees::EducationsHelper

  def level_types_for_select
    Employee::Education::LEVEL_TYPES.each_with_index.map { |level, index| [level, index] }
  end

  def education_level_to_string(level)
    Employee::Education::LEVEL_TYPES[level]
  end
end