class CareerPath < ActiveRecord::Base
  def self.use_relative_model_naming?
    true
  end

  has_many :employees
  has_many :career_path_actions, dependent: :destroy
  # has_many :keywords, dependent: :destroy

  validates :name, presence: true, 
                    uniqueness: true, 
                    length: { maximum: 100 }

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

=begin

@elmer.career_path_items

class Employee
end

class Career
end

class CareerPath
end


CareerPath
  CareerPathActions

class Employee < ActiveRecord::Base
  has_many :career_paths
  has_many :career_path_items, through: :career_paths
end

class CareerPath < ActiveRecord::Base
  belongs_to :employee
end

class CareerPathItem < ActiveRecord::Base
end

=end