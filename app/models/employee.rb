# This code is commented and act only for reference on using namespaced models.

# module Employee
#   def self.table_name_prefix
#     'employee_'
#   end
# end

class Employee < ActiveRecord::Base
  GENDER_TYPES = { M: 'Male', F: 'Female'}
  CIVIL_STATUS_TYPES = {
    S: 'Single', 
    HOF: 'Head Of Family',
    M: 'Married'
  }


  validates :middle_name, length: { maximum: 50 }
  validates :name_extension, length: { maximum: 50 }

  has_one :user_account, as: :account, class_name: 'User'

  has_many :civil_service_eligibilities
  has_many :educations
  has_many :other_infos
  has_many :trainings
  has_many :voluntary_works
  has_many :work_experiences

  has_many :ratings
  has_many :instruction_ratings, 
    -> { where(type: 'Employee::Rating::Instruction') },
    class_name: 'Employee::Rating'
  has_many :research_ratings,
    -> { where(type: 'Employee::Rating::Research') },
    class_name: 'Employee::Rating'
  has_many :extension_ratings, 
    -> { where(type: 'Employee::Rating::Extension') },
    class_name: 'Employee::Rating'
  has_many :production_ratings, 
    -> { where(type: 'Employee::Rating::Production') },
    class_name: 'Employee::Rating'

  has_many :leaves 
  has_many :career_paths

  belongs_to :rank, class_name: 'AcademicRanking', foreign_key: 'academic_ranking_id'
  # belongs_to :department

  #, inverse_of: :employee
  accepts_nested_attributes_for :user_account, 
    reject_if: lambda { |attributes| attributes['username'].blank? }

  validates :first_name, :last_name, 
    presence: true,
    length: { maximum: 50 }

  validates :gender, inclusion: { in: GENDER_TYPES.keys.to_s }
  validates :civil_status, 
    inclusion: { in: CIVIL_STATUS_TYPES.keys.to_s }


  def self.display_gender_types
    GENDER_TYPES.map { |key, value| [value, key] }
  end

  def self.display_civil_status
    CIVIL_STATUS_TYPES.map { |key, value| [value, key] }
  end

  def gender
    GENDER_TYPES[self[:gender].to_sym] unless self[:gender].nil?
  end

  def civil_status
  end

  def full_name
    name = "#{first_name.capitalize} "
    name << "#{middle_name.first.capitalize}. " if middle_name.present?
    name << last_name.capitalize
    # TODO: account for employee's name extension
  end

  # def age
  #   unless birth_date.nil?
      
  #   end  
  # end

=begin
  Roosevelt, Theodore, Jr.
  Stevenson, Adlai E., III
  Sia, Elmer A., Jr
  Moffett, Mrs. James, Sr.
=end

end

=begin

  has_attached_file :picture # styles: {}
  # validates_attachment_content_type :picture, :content_type => //
  
  validates :citizenship, length: { maximum: 15 }
  validates :height, :weight, length: { maximum: 5 }
  validates :blood_type, length: { maximum: 3 }
  validates :gsis_no, :pagibig_no, :philhealth_no, 
              length: { maximum: 20 }
  validates :sss_no, length: { maximum: 15 }
  validates :r_address, :p_address, length: { maximum: 70 }
  validates :r_zip_code, :p_zip_code, length: { maximum: 5 }
  validates :r_telephone_no, :p_telephone_no, length: { maximum: 15 }

=end