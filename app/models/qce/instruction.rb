# == Schema Information
#
# Table name: qce_ratings
#
#  id                 :integer          not null, primary key
#  qce_id             :integer          not null
#  type               :string           not null
#  evaluator_id       :integer          not null
#  evaluator_type     :string           not null
#  evaluator_name     :string
#  evaluator_position :string
#  evaluation_context :string
#  finished_at        :date
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  instrument         :string
#
# Indexes
#
#  index_qce_ratings_on_evaluator_type_and_evaluator_id  (evaluator_type,evaluator_id)
#  index_qce_ratings_on_qce_id                           (qce_id)
#

class QCE::Instruction < QCE::Rating
  self.store_full_sti_class = false

  scope :self, -> { where evaluation_context: 'Self' }
  scope :supervisor, -> { where evaluation_context: 'Supervisor' }
  scope :peer, -> { where evaluation_context: 'Peer' }
  scope :student, -> { where evaluation_context: 'Student' }

  INSTRUMENTS = { 
      commitment: 'Commitment',
      knowledge: 'Knowledge of Subject',
      teaching: 'Teaching for Independent Learning',
      management: 'Management of Learning'
  }


  private

  def create_questions
    ids = QCE::Question.instruction.ids
    # TODO: Optimize code to prefer a bulk insert instead of looping.

    ids.each do |id|
      QCE::RatingEvaluation.create question_id: id, rating: self
    end
  end

  def assign_task_to_evaluator
    pending = QCE::RatingTask.statuses[:pending]
    QCE::RatingTask.create evaluator: evaluator, rating: self, 
                          employee_id: qce.employee_id, status: pending
  end

end   # class QCE::Instruction
