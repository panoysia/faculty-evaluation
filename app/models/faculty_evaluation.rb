class FacultyEvaluation < ActiveRecord::Base
  belongs_to :employee
  belongs_to :nbc

  validates :current_rank, presence: true
end
