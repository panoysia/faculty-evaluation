class QCE < ActiveRecord::Base
  belongs_to :employee
  belongs_to :rating_period


  scope :completed, -> { where(completed: 1) }
  scope :incomplete, -> { where(completed: 0) }

  def rated_self?
    result = QCE::InstructionRating.where(qce_id: id, evaluator_type: 'Self').limit(1)
    result.present? ? true : false
  end

  def rated_peers?
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