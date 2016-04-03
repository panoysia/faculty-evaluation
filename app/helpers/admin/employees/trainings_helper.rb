module Admin::Employees::TrainingsHelper

  def training_level_types_for_select
    Employee::Training::LEVEL_TYPES.each_with_index.map { |level, index| [level, index] }
  end

  def training_level_to_string(level)
    Employee::Training::LEVEL_TYPES[level]
  end

end