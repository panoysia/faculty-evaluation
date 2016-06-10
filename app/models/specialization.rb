class Specialization < ActiveRecord::Base
  has_many :employees
  has_many :career_path_actions
  
  belongs_to :career_path

  scope :non_generalize, -> { where(is_generalize: 0) }
  scope :generalize, -> { where(is_generalize: 1) }
  
  validates :name, presence: true, uniqueness: true,
                    length: { maximum: 100 }
  validates :career_path, presence: true 


  def self.get_field_limit_of(field_name)
    column_for_attribute(field_name.to_s.to_sym).limit
  end

  # def full_name
  #   new_name = name
  #   new_name << " (#{career_path.name})" if is_generalize?
  #   new_name
  # end
end
