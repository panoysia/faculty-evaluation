class QCE < ActiveRecord::Base
  def self.use_relative_model_naming?
    true
  end
    
  has_many :ratings, class_name: 'QCE::Rating',
                    dependent: :destroy


  has_many :instruction_ratings, -> { instruction },
                                class_name: 'QCE::Rating',
                                dependent: :destroy

  has_many :research_ratings, -> { research },
                              class_name: 'QCE::Rating',
                              dependent: :destroy

  has_many :production_ratings, -> { production },
                                class_name: 'QCE::Rating',
                                dependent: :destroy

  has_many :extension_ratings, -> { extension },
                              class_name: 'QCE::Rating',
                              dependent: :destroy

  has_one :self_instruction_rating,
    -> { where(evaluation_context: 'Self',type: 'Instruction') },
    class_name: 'QCE::Rating', dependent: :destroy

  has_one :supervisor_instruction_rating,
    -> { where(evaluation_context: 'Supervisor', type: 'Instruction') },
    class_name: 'QCE::Rating', dependent: :destroy

  has_many :peer_instruction_ratings,
    -> { where(evaluation_context: 'Peer', type: 'Instruction') },
    class_name: 'QCE::Rating', dependent: :destroy

  has_many :student_instruction_ratings,
    -> { where(evaluation_context: 'Student', type: 'Instruction') },
    class_name: 'QCE::Rating', dependent: :destroy


  has_many :clientele_instruments, -> { where instrument: 'Clientele Satisfaction' }, class_name: 'QCE::Rating'

  has_one :leadership_instrument, -> { where instrument: 'Leadership' }, class_name: 'QCE::Rating'

  has_many :partnership_instruments, -> { where instrument: 'Partnership Development' }, class_name: 'QCE::Rating'

  has_many :community_instruments, -> { where instrument: 'Community Responsibility' }, class_name: 'QCE::Rating'


  belongs_to :employee
  belongs_to :rating_period

  scope :completed, -> { where(completed: 1) }
  scope :incomplete, -> { where(completed: 0) }


  # private

  def clear_ratings
    ratings.destroy_all
    update has_assigned_self_rating: 0, 
          has_assigned_supervisor_rating: 0, 
          has_assigned_peer_rating: 0,
          has_assigned_student_rating: 0
  end

end   # class QCE
