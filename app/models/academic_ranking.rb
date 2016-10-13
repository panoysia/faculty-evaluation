# == Schema Information
#
# Table name: academic_rankings
#
#  id             :integer          not null, primary key
#  name           :string(50)       not null
#  subrank        :integer
#  position       :integer          not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  cce_min_points :integer
#  cce_max_points :integer
#  qce_min_points :integer
#  qce_max_points :integer
#  salary_grade   :integer
#


# Instruction ratings only for: Instructor to Associate Professor 4
# Associate Professor 5 - Research, Extension, and Production ratings

# "Instructor",
# "Assistant Professor",
# "Associate Professor",
# "Professor",
# "College/University Professor"

class AcademicRanking < ActiveRecord::Base
  ASSOCIATE_PROFESSOR_5 = 12

  has_many :employees

  scope :professorial, -> {
    where(name: ["Professor", "College/University Professor"])
  }

  scope :non_professorial, -> {
    where.not(name: ["Professor", "College/University Professor"])
  }

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
