# == Schema Information
#
# Table name: employee_technical_articles
#
#  id           :integer          not null, primary key
#  name         :string(50)       not null
#  level        :integer          not null
#  published_at :date             not null
#  description  :string(150)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  employee_id  :integer          not null
#
# Indexes
#
#  idx_emp_technical_articles_on_emp_id  (employee_id)
#

require_dependency "employee/application_record"

class Employee::TechnicalArticle < Employee::ApplicationRecord
  LEVELS = %w(International National Local)
  
  belongs_to :employee

  validates :name, presence: true, length: { maximum: 50 }
  validates :published_at, presence: true
  validates :level, inclusion: {
      in: LEVELS.each_index.map { |index| index } 
  }
  validates :description, length: { maximum: 150 }

  
  def self.level_options
    LEVELS.each_with_index.map { |level, index| [level, index] }
  end


  def level_to_string
    LEVELS[level]
  end

end
