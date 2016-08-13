# == Schema Information
#
# Table name: innovation_criteria
#
#  id          :integer          not null, primary key
#  description :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Employee::InnovationCriterium < ActiveRecord::Base
  # self.table_name_prefix = 'employee_'
  self.table_name = 'innovation_criteria'

  has_and_belongs_to_many :innovations,
    class_name: Employee::Innovation,
    join_table: 'employee_innovations_criteria',
    foreign_key: 'innovation_criterium_id',
    association_foreign_key: 'employee_innovation_id'

  # Use this for resolving namespaced models in polymorphic route generation and when prefer to build routes using arrays instead of named route helpers.
  def self.use_relative_model_naming?
    true
  end

end
