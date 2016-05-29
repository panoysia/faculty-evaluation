class QCE::RatingTask < ActiveRecord::Base
  self.table_name_prefix = 'qce_'

  # INSTRUCTION = 'Instruction'
  # RESEARCH = 'Research'
  # PRODUCTION = 'Production'
  # EXTENSION = 'Extension'

  belongs_to :owner, class_name: 'Employee'
  belongs_to :evaluator, polymorphic: true
  belongs_to :rating, polymorphic: true
  
  # get the recent tasks 
  # scope :latest, -> { where }

  enum status: { pending: 0, completed: 1, cancelled: 2 }

  # Use this for resolving namespaced models in polymorphic route generation and when prefer to build routes using arrays instead of named route helpers.
  def self.use_relative_model_naming?
    true
  end

  def description
    owner_name = owner.full_name
    context = rating.evaluation_context
    context << " (yourself)" if context == 'Self'
    
    # if rating_type == INSTRUCTION
    #   type_of_rating = 'Instruction'
    # elsif rating_type == RESEARCH
    #   type_of_rating = 'Research'
    # end

    "Rate #{owner_name} as #{context} for #{rating.type}"
  end

end

=begin

Steve Kerr:
  Rate Steve Kerr as Self for Instruction

Grace Poe:
  Rate Steve Kerr as Supervisor for Instruction
  Rate Grace Poe (yourself) as Self for Instruction
  Rate Kevin Durant as Peer for Instruction
  Rate Kevin Garnett as Peer for Instruction

  user.tasks

    :owner_id => :integer, # employee_id only
      :evaluator_id => :integer, # either employee or student
    :evaluator_type => :string,
         :rating_id => :integer, # any type of rating
       :rating_type => :string,

  employee has_many tasks
  employee has_many tasks as: :evaluator

=end