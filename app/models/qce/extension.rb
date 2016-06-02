class QCE::Extension < QCE::Rating
  self.store_full_sti_class = false
  

  private

  def create_questions
    
    if instrument == 'Clientele Satisfaction'
      ids = QCE::Question.extension.clientele.ids

    elsif instrument == 'Leadership'
      ids = QCE::Question.extension.leadership.ids

    elsif instrument == 'Partnership Development'
      ids = QCE::Question.extension.partnership.ids

    elsif instrument == 'Community Responsibility'
      ids = QCE::Question.extension.community.ids
    end

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

end   # class QCE::Extension
