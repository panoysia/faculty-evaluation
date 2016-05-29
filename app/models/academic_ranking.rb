class AcademicRanking < ActiveRecord::Base
  ASSOCIATE_PROFESSOR_5 = 12

  # Instruction only for: instructor - associate professor 4
  # associate professor 5 - research, extension, production k

  has_many :employees

  validates :name, presence: true, 
                    length: { maximum: 50 }
  
  validates :position, presence: true,
                      numericality: { greater_than: 0, less_than: 50 }

  def full_name
    result = "#{name}"
    result << " #{subrank}" if subrank.present?
    result
  end

  def allows_qce_support?
    # Any rank with a position value greater than ASSOCIATE_PROFESSOR_5 (12 in this case) is valid for taking QCE Support Ratings such as Extension, Research, or Production.
      position >= ASSOCIATE_PROFESSOR_5 
  end

end