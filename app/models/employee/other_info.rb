# == Schema Information
#
# Table name: employee_other_infos
#
#  id          :integer          not null, primary key
#  context     :integer          not null
#  info        :string(100)      not null
#  employee_id :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_employee_other_infos_on_employee_id  (employee_id)
#

class Employee::OtherInfo < ActiveRecord::Base
  self.table_name_prefix = 'employee_'

  belongs_to :employee
  has_one :cce_scoring, as: :cce_scorable,
                        class_name: 'Employee::CCEScoring'

  # validates :context, presence: true, inclusion: { in: [] }
  validates :info, presence: true, length: { maximum: 100 }

  # Use this for resolving namespaced models in polymorphic route generation and when prefer to build routes using arrays instead of named route helpers.
  def self.use_relative_model_naming?
    true
  end

  def self.get_field_limit_of(field_name)
    column_for_attribute(field_name.to_s.to_sym).limit
  end

end
