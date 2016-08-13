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

  scope :clientele, -> { where instrument: 'Clientele Satisfaction' }
  scope :leadership, -> { where instrument: 'Leadership' }
  scope :partnership, -> { where instrument: 'Partnership Development' }  
  scope :community, -> { where instrument: 'Community Responsibility' }

  scope :completed, -> { where.not(finished_at: nil) }
  
  # scope :clientele_instruments, -> { where instrument: 'Client Satisfaction' }
  # scope :leadership_instruments, -> { where instrument: 'Leadership' }

  # scope :partnership_instruments, -> { where instrument: 'Partnership Development' }

  # scope :community_instruments, -> { where instrument: 'Community Responsibility' }

  after_create :create_questions, :assign_task_to_evaluator


  # Use this for resolving namespaced models in polymorphic route generation and when prefer to build routes using arrays instead of named route helpers.
  def self.use_relative_model_naming?
    true
  end

  def completed?
    finished_at.present?
  end

  def total_score
    evaluations.sum(:score)
  end


  private

  def create_questions
  end

  def assign_task_to_evaluator
  end
  
end   # class QCE::Rating

# def create_questions
#   ids = QCE::Question.instruction.ids
#   # TODO: Optimize code to prefer a bulk insert instead of looping.

#   ids.each do |id|
#     QCE::RatingEvaluation.create question_id: id, rating: self
#   end
# end

# def assign_task_to_evaluator
#   pending = QCE::RatingTask.statuses[:pending]
#   QCE::RatingTask.create evaluator: evaluator, rating: self, 
#                         employee_id: qce.employee_id, status: pending
# end
