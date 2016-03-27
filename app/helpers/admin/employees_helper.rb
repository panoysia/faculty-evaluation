module Admin::EmployeesHelper

  # def get_support_information_from_employee(employee)
    # [employee.rank.name, employee.designation, employee.age].compact.join("&#9679;").html_safe
    # [employee.rank.name, employee.designation, employee.age].compact.join(".")
  # end

  def gender_types_for_select
    Employee::GENDER_TYPES.map { |key, value| [value, key] }
  end

  def civil_status_types_for_select
    Employee::CIVIL_STATUS_TYPES.map { |key, value| [value, key] }
  end

  def blood_types_for_select
    Employee::BLOOD_TYPES.map { |key, value| [value, key] }
  end

end