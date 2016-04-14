class QCE < ActiveRecord::Base
  has_many :instruction_ratings, dependent: :destroy

  belongs_to :employee
  belongs_to :rating_period

  scope :completed, -> { where(completed: 1) }
  scope :incomplete, -> { where(completed: 0) }


  def has_self_rating?
    result = QCE::InstructionRating.where(qce_id: id, evaluator_type: 'Self').limit(1)
    result.present? ? true : false
  end

  def has_supervisor_rating?
  end

  def has_peer_ratings?
  end

  def has_student_ratings?
  end

end

=begin

  class QCERating < ActiveRecord::Base
  end

  class InstructionRating
  end

  Rating
    Instruction

  QCERating
    Instruction (qce_rating_instructions)
    Research (qce_research_instruction)
    Extension
    Production

  QCERating    (qce_ratings)
  QCERating::Instruction < QCERating


  qce_ratings

  id
  employee_id
  academic_year_id
  semester
  nbc_id


  id
  qce_rating_id
  type

  QCERating

=end