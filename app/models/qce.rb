class QCE < ActiveRecord::Base

  SELF_RATING_COUNT = 1
  SUPERVISOR_RATING_COUNT = 1
  PEER_RATINGS_COUNT = 5
  STUDENT_RATINGS_COUNT = 30

  INSTRUCTION_RATINGS_COUNT = SELF_RATING_COUNT +
                              SUPERVISOR_RATING_COUNT +
                              PEER_RATINGS_COUNT +
                              STUDENT_RATINGS_COUNT

  CLIENTELE_INSTRUMENTS = 3
  LEADERSHIP_INSTRUMENT = 1
  PARTNERSHIP_INSTRUMENTS = 3
  COMMUNITY_RESPONSIBILITY_INSTRUMENTS = 3

  SUPPORT_AREA_RATINGS_COUNT = CLIENTELE_INSTRUMENTS +
                                LEADERSHIP_INSTRUMENT +
                                PARTNERSHIP_INSTRUMENTS +
                                COMMUNITY_RESPONSIBILITY_INSTRUMENTS

  def self.use_relative_model_naming?
    true
  end
    
  has_many :ratings, class_name: 'QCE::Rating',
                    dependent: :destroy

  has_many :instruction_ratings, -> { instruction },
                                class_name: 'QCE::Rating',
                                dependent: :destroy

  has_many :support_ratings, -> { where.not(type: 'Instruction') },
                              class_name: 'QCE::Rating'

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


  # has_many :clientele_instruments, -> { where instrument: 'Clientele Satisfaction' }, class_name: 'QCE::Rating'
  has_many :clientele_instruments, -> { clientele },
                                    class_name: 'QCE::Rating'

  has_one :leadership_instrument, -> { leadership},
                                    class_name: 'QCE::Rating'

  has_many :partnership_instruments, -> { partnership },
                                      class_name: 'QCE::Rating'

  has_many :community_instruments, -> { community },
                                    class_name: 'QCE::Rating'

  belongs_to :employee
  belongs_to :rating_period

  scope :completed, -> { where(completed: 1) }
  scope :incomplete, -> { where(completed: 0) }
  scope :latest, -> (size = 8) { order(updated_at: :desc).limit(size) }


  # completed, for_finalization, incomplete

  # def status
  #   completed? and for_finalization
  # end

  # def completed?
  #   finished_at.present?
  # end

  def for_finalization?
    completed_ratings = nil

    if support_area.present?
      completed_ratings = (ratings.completed.count == 
        (INSTRUCTION_RATINGS_COUNT + SUPPORT_AREA_RATINGS_COUNT))
    else
      completed_ratings = (instruction_ratings.completed.count == INSTRUCTION_RATINGS_COUNT)
    end

    (completed == 0) && completed_ratings
  end

  # private

  def clear_ratings
    ratings.destroy_all
    update has_assigned_self_rating: 0, 
          has_assigned_supervisor_rating: 0, 
          has_assigned_peer_rating: 0,
          has_assigned_student_rating: 0
  end

end   # class QCE
