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