class AddEmployeeToEmployeeProfessionalExaminations < ActiveRecord::Migration
  def change
    add_reference :employee_professional_examinations, :employee, index: true, foreign_key: true
    change_column_null :employee_professional_examinations, :employee_id, false
  end
end
