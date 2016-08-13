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

class QCE::Production < QCE::Rating
  self.store_full_sti_class = false


  private

  def create_questions
    
    if instrument == 'Clientele Satisfaction'
      ids = QCE::Question.production.clientele.ids

    elsif instrument == 'Leadership'
      ids = QCE::Question.production.leadership.ids

    elsif instrument == 'Partnership Development'
      ids = QCE::Question.production.partnership.ids
      
    elsif instrument == 'Community Responsibility'
      ids = QCE::Question.production.community.ids
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

end   # class QCE::Production
