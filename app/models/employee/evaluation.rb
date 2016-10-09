# == Schema Information
#
# Table name: employee_evaluations
#
#  id           :integer          not null, primary key
#  employee_id  :integer          not null
#  nbc_id       :integer          not null
#  current_rank :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  rank_before  :string           default(""), not null
#  rank_after   :string           default(""), not null
#  cce_score    :decimal(5, 2)    default(0.0), not null
#  qce_score    :decimal(5, 2)    default(0.0), not null
#
# Indexes
#
#  index_employee_evaluations_on_employee_id  (employee_id)
#  index_employee_evaluations_on_nbc_id       (nbc_id)
#

require_dependency "employee/application_record"

class Employee::Evaluation < Employee::ApplicationRecord
  belongs_to :employee
  belongs_to :nbc

  validates :current_rank, presence: true

end
