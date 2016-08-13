# == Schema Information
#
# Table name: creative_work_criteria
#
#  id          :integer          not null, primary key
#  description :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Employee::CreativeWorkCriterium < ActiveRecord::Base
  # self.table_name_prefix = 'employee_'
  self.table_name = 'creative_work_criteria'

  has_and_belongs_to_many :creative_works,
    class_name: Employee::CreativeWork,
    join_table: 'employee_creative_works_criteria',
    foreign_key: 'creative_work_criterium_id',
    association_foreign_key: 'employee_creative_work_id'

  # Use this for resolving namespaced models in polymorphic route generation and when prefer to build routes using arrays instead of named route helpers.
  def self.use_relative_model_naming?
    true
  end

end
