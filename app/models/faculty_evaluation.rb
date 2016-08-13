# == Schema Information
#
# Table name: faculty_evaluations
#
#  id           :integer          not null, primary key
#  employee_id  :integer          not null
#  nbc_id       :integer          not null
#  current_rank :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_faculty_evaluations_on_employee_id  (employee_id)
#  index_faculty_evaluations_on_nbc_id       (nbc_id)
#

class FacultyEvaluation < ActiveRecord::Base
  belongs_to :employee
  belongs_to :nbc

  validates :current_rank, presence: true
end

# t.integer  "employee_id",  null: false
# t.integer  "nbc_id",       null: false
# t.string   "current_rank", null: false
# t.datetime "created_at",   null: false
# t.datetime "updated_at",   null: false
