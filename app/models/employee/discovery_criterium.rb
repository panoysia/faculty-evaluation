# == Schema Information
#
# Table name: discovery_criteria
#
#  id          :integer          not null, primary key
#  description :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Employee::DiscoveryCriterium < ActiveRecord::Base
  # self.table_name_prefix = 'employee_'
  self.table_name = 'discovery_criteria'

  has_and_belongs_to_many :discoveries,
    class_name: Employee::Discovery,
    join_table: 'employee_discoveries_criteria',
    foreign_key: 'discovery_criterium_id',
    association_foreign_key: 'employee_discovery_id'

  # Use this for resolving namespaced models in polymorphic route generation and when prefer to build routes using arrays instead of named route helpers.
  def self.use_relative_model_naming?
    true
  end

end
