# == Schema Information
#
# Table name: employee_voluntary_works
#
#  id           :integer          not null, primary key
#  organization :string(70)       not null
#  start_at     :date             not null
#  end_at       :date             not null
#  no_of_hours  :integer
#  position     :string(50)
#  employee_id  :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_employee_voluntary_works_on_employee_id  (employee_id)
#

class Employee::VoluntaryWork < ActiveRecord::Base
  self.table_name_prefix = 'employee_'

  belongs_to :employee
  has_one :cce_scoring, as: :cce_scorable,
                        class_name: 'Employee::CCEScoring'

  validates :organization, presence: true, length: { maximum: 70 }
  validates :start_at, :end_at, presence: true
  # validates :no_of_hours, numericality: {}
  validates :position, length: { maximum: 50 }

  # Use this for resolving namespaced models in polymorphic route generation and when prefer to build routes using arrays instead of named route helpers.
  def self.use_relative_model_naming?
    true
  end

  def self.get_field_limit_of(field_name)
    column_for_attribute(field_name.to_s.to_sym).limit
  end

end
