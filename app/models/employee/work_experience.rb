# == Schema Information
#
# Table name: employee_work_experiences
#
#  id                    :integer          not null, primary key
#  start_at              :date             not null
#  end_at                :date             not null
#  position_title        :string(50)       not null
#  company               :string(50)       not null
#  monthly_salary        :decimal(10, )
#  salary_grade          :string(7)
#  status_of_appointment :string(20)
#  is_gov_service        :integer
#  employee_id           :integer          not null
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#
# Indexes
#
#  index_employee_work_experiences_on_employee_id  (employee_id)
#

class Employee::WorkExperience < ActiveRecord::Base
  self.table_name_prefix = 'employee_'

  belongs_to :employee
  has_one :cce_scoring, as: :cce_scorable,
                        class_name: 'Employee::CCEScoring'

  validates :position_title, :company, 
              presence: true,
              length: { maximum: 50 }

  validates :start_at, :end_at, presence: true
  
  # Use this for resolving namespaced models in polymorphic route generation and when prefer to build routes using arrays instead of named route helpers.
  def self.use_relative_model_naming?
    true
  end

  def self.get_field_limit_of(field_name)
    column_for_attribute(field_name.to_s.to_sym).limit
  end

end
