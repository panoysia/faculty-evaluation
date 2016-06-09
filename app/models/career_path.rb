=begin
  CareerPath
    Specialization
      CareerPathActions
=end

class CareerPath < ActiveRecord::Base
  has_many :specializations,
    -> { order(is_generalize: :asc, name: :asc) },
    dependent: :destroy

  # Guide:
  # has_many :replies, through: :articles, source: :comments
  has_many :actions, through: :specializations,
                      source: :career_path_actions,
                      class_name: 'CareerPathAction',
                      dependent: :destroy

  has_many :employees, through: :specializations,
                        source: :employees # redundant

  validates :name, presence: true, 
                    uniqueness: true, 
                    length: { maximum: 50 }

  after_create :create_generalize_specialization
  after_update :update_generalize_specialization


  def self.use_relative_model_naming?
    true
  end

  def self.get_field_limit_of(field_name)
    column_for_attribute(field_name.to_s.to_sym).limit
  end


  private

  def create_generalize_specialization
    new_name = "Generalized (#{self[:name]})"
    Specialization.create name: new_name, is_generalize: true,
                            career_path_id: self[:id]
  end

  def update_generalize_specialization
    new_name = "Generalized (#{self[:name]})"
    Specialization.where(career_path_id: self[:id],
                          is_generalize: 1).
                  update_all(name: new_name)
  end

end
