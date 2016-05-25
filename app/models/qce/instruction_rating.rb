=begin
  class QCE::SelfInstructionRating < QCE::InstructionRating
  class QCE::PeerInstructionRating < QCE::InstructionRating
  class QCE::SupervisorInstructionRating < QCE::InstructionRating
  class QCE::StudentInstructionRating < QCE::InstructionRating
=end

class QCE::InstructionRating < ActiveRecord::Base
  self.table_name_prefix = 'qce_'
  
  has_many :scores, as: :rating, 
                    class_name: 'Rating::Score', dependent: :destroy
  # association: belongs_to :rating, polymorphic: true

  has_one :task, as: :rating,
                        class_name: 'Rating::Task', 
                        dependent: :destroy
  # association: belongs_to :rating, polymorphic: true

  belongs_to :qce
  belongs_to :evaluator, polymorphic: true
  
  after_save :create_questions, :assign_task_to_evaluator


  # Use this for resolving namespaced models in polymorphic route generation and when prefer to build routes using arrays instead of named route helpers.
  def self.use_relative_model_naming?
    true
  end

  def source_qce
    qce
  end


  private

  def create_questions
    ids = Rating::Question.instruction.ids
    # TODO: Optimize code to prefer a bulk insert instead of looping.
    ids.each do |id|
      Rating::Score.create question_id: id, rating: self
    end
  end

  def assign_task_to_evaluator
    pending = Rating::Task.statuses[:pending]
    Rating::Task.create evaluator: evaluator, rating: self, 
                        owner_id: qce.employee_id, 
                        status: pending
  end

end   # class QCE::InstructionRating