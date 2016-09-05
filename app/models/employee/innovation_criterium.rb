# == Schema Information
#
# Table name: innovation_criteria
#
#  id          :integer          not null, primary key
#  description :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require_dependency "employee/application_record"

class Employee::InnovationCriterium < Employee::ApplicationRecord
  self.table_name = 'innovation_criteria'
  self.table_name_prefix = ""
  
  has_and_belongs_to_many :innovations,
    class_name: Employee::Innovation,
    join_table: 'employee_innovations_criteria',
    foreign_key: 'innovation_criterium_id',
    association_foreign_key: 'employee_innovation_id'

end
