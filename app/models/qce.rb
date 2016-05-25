class QCE < ActiveRecord::Base
  has_many :instruction_ratings, dependent: :destroy

  has_one :self_instruction_rating,
    -> { where(evaluation_category: 'Self') },
    class_name: 'QCE::InstructionRating', dependent: :destroy

  has_one :supervisor_instruction_rating,
    -> { where(evaluation_category: 'Supervisor') }, 
    class_name: 'QCE::InstructionRating', dependent: :destroy

  has_many :peer_instruction_ratings,
    -> { where(evaluation_category: 'Peer') },
    class_name: 'QCE::InstructionRating', dependent: :destroy

  has_many :student_instruction_ratings,
    -> { where(evaluation_category: 'Student') },
    class_name: 'QCE::InstructionRating', dependent: :destroy

  belongs_to :employee
  belongs_to :rating_period

  scope :completed, -> { where(completed: 1) }
  scope :incomplete, -> { where(completed: 0) }


  # private

  def clear_ratings
    instruction_ratings.delete_all
    update has_assigned_self_rating: 0, 
          has_assigned_supervisor_rating: 0, 
          has_assigned_peer_rating: 0,
          has_assigned_student_rating: 0
  end

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