# == Schema Information
#
# Table name: discovery_criteria
#
#  id          :integer          not null, primary key
#  description :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  criteria    :integer          not null
#

require_dependency "employee/application_record"

class Employee::DiscoveryCriterium < Employee::ApplicationRecord
  self.table_name = 'discovery_criteria'
  self.table_name_prefix = ""
  
  has_and_belongs_to_many :discoveries,
    class_name: Employee::Discovery,
    join_table: 'employee_discoveries_criteria',
    foreign_key: 'discovery_criterium_id',
    association_foreign_key: 'employee_discovery_id'

end
