class Employee::ProfessionalExamination < ActiveRecord::Base
  self.table_name_prefix = 'employee_'

  CATEGORIES = [
    "Engineering, Accounting, Medicine, Law, Teacher's Board",

    "Career Executive Service Officers Examinaton /\nCareer Service Executive Examination",

    'Seaman Certificate; Master Electrician/Master Plumber Certificate; Plant Mechanic Certificate',

    'IT Proficiency Certification',

    'National Certificates (NC)/ Trade Skill Certificates'
  ]
  
  belongs_to :employee

  validates :title, presence: true, length: { maximum: 150 }
  validates :agency_name, presence: true, length: { maximum: 150 }
  validates :date_passed, presence: true
  validates :category, inclusion: { 
    in: CATEGORIES.each_index.map { |index| index }
  }

  # Use this for resolving namespaced models in polymorphic route generation and when prefer to build routes using arrays instead of named route helpers.
  def self.use_relative_model_naming?
    true
  end

  def self.get_field_limit_of(field_name)
    column_for_attribute(field_name.to_s.to_sym).limit
  end

  def self.category_options
    CATEGORIES.each_with_index.map { |category, index| [category, index] }
  end


  def category_to_string
    CATEGORIES[category]
  end

end
