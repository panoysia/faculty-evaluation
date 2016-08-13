# == Schema Information
#
# Table name: employee_innovations
#
#  id            :integer          not null, primary key
#  patent_no     :string           not null
#  year_patented :integer          not null
#  description   :string(150)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  employee_id   :integer          not null
#  name          :string           not null
#
# Indexes
#
#  idx_emp_innovations_on_emp_id  (employee_id)
#

class Employee::Innovation < ActiveRecord::Base
  self.table_name_prefix = 'employee_'
  
  belongs_to :employee
  has_and_belongs_to_many :criteria,
    class_name: Employee::InnovationCriterium,
    join_table: 'employee_innovations_criteria',
    foreign_key: 'employee_innovation_id',
    association_foreign_key: 'innovation_criterium_id'

  validates :name, :patent_no, presence: true
  validates :year_patented, presence: true, length: { is: 4 }
  validates :description, length: { maximum: 150 }

  # Use this for resolving namespaced models in polymorphic route generation and when prefer to build routes using arrays instead of named route helpers.
  def self.use_relative_model_naming?
    true
  end

  def self.get_field_limit_of(field_name)
    column_for_attribute(field_name.to_s.to_sym).limit
  end

end
