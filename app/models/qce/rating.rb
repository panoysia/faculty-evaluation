class QCE::Rating < ActiveRecord::Base
  self.table_name_prefix = 'qce_'
  self.store_full_sti_class = false

  has_many :evaluations, as: :rating, 
                        class_name: 'QCE::RatingEvaluation', 
                        dependent: :destroy
  # QCE::RatingEvaluation association: 
  #   belongs_to :rating, polymorphic: true
  
  has_one :task, as: :rating, 
                class_name: 'QCE::RatingTask', 
                dependent: :destroy
  # QCE::RatingTask association: 
  #   belongs_to :rating, polymorphic: true

  belongs_to :qce
  belongs_to :evaluator, polymorphic: true
  
  scope :instruction, -> { where type: 'Instruction' }
  scope :research, -> { where type: 'Research' }
  scope :production, -> { where type: 'Production' }
  scope :extension, -> { where type: 'Extension' }

  # scope :clientele_instruments, -> { where instrument: 'Client Satisfaction' }
  # scope :leadership_instruments, -> { where instrument: 'Leadership' }

  # scope :partnership_instruments, -> { where instrument: 'Partnership Development' }

  # scope :community_instruments, -> { where instrument: 'Community Responsibility' }


  after_save :create_questions, :assign_task_to_evaluator


  # Use this for resolving namespaced models in polymorphic route generation and when prefer to build routes using arrays instead of named route helpers.
  def self.use_relative_model_naming?
    true
  end


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
                          owner_id: qce.employee_id, status: pending
  end

end   # class QCE::Rating