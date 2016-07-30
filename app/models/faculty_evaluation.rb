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
