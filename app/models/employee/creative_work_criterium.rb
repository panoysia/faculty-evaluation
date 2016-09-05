# == Schema Information
#
# Table name: creative_work_criteria
#
#  id          :integer          not null, primary key
#  description :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require_dependency "employee/application_record"

class Employee::CreativeWorkCriterium < Employee::ApplicationRecord
  self.table_name = 'creative_work_criteria'
  self.table_name_prefix = ""
  
  has_and_belongs_to_many :creative_works,
    class_name: Employee::CreativeWork,
    join_table: 'employee_creative_works_criteria',
    foreign_key: 'creative_work_criterium_id',
    association_foreign_key: 'employee_creative_work_id'

end
