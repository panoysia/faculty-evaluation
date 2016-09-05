# == Schema Information
#
# Table name: employee_instructional_manuals
#
#  id           :integer          not null, primary key
#  name         :string(50)       not null
#  published_at :date             not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  category     :integer
#  employee_id  :integer          not null
#  description  :string(150)      default(""), not null
#
# Indexes
#
#  idx_emp_instructioinal_manuals_on_emp_id  (employee_id)
#

require_dependency "employee/application_record"

class Employee::InstructionalManual < Employee::ApplicationRecord
  CATEGORIES = %w(Manual Audio-visual)

  belongs_to :employee

  validates :name, presence: true, length: { maximum: 50 }
  validates :published_at, presence: true
  validates :description, length: { maximum: 150 }

  validates :category, inclusion: {
      in: CATEGORIES.each_index.map { |index| index }
  }


  def self.category_options
    CATEGORIES.each_with_index.map { |category, index| [category, index] }
  end


  def category_to_string
    CATEGORIES[category]
  end

end
