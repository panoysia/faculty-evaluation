class CareerPath < ActiveRecord::Base
  has_many :employees
  
  has_many :specializations, -> { order(name: :asc) },
                              dependent: :destroy
  has_many :actions, class_name: 'CareerPathAction',
                      dependent: :destroy

  validates :name, presence: true, 
                    uniqueness: true, 
                    length: { maximum: 100 }


  def self.use_relative_model_naming?
    true
  end

end
=begin
  class Employee
    has_many :schooling
    has_many :courses, through: :schooling
  end

  class Schooling
    belongs_to :employee
    belongs_to :courses
  end

  class Courses
    has_many :schooling
    has_many :employees, through: :schooling
  end

=end
