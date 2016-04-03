# This code is commented and act only for reference on using namespaced models.

=begin
module Employee
  def self.table_name_prefix
    'employee_'
  end

  def self.use_relative_model_naming?
    true
  end
end
=end

class Employee < ActiveRecord::Base
  def self.use_relative_model_naming?
    true
  end

  GENDER_TYPES = { M: 'Male', F: 'Female'}
  CIVIL_STATUS_TYPES = {
    S: 'Single', 
    HOF: 'Head Of Family',
    M: 'Married'
  }

  BLOOD_TYPES = {
    A: 'Type A',
    B: 'Type B',
    AB: 'Type AB',
    O: 'Type O'
  }

  has_attached_file :picture, 
    styles: { medium: "200x200", thumb: "100x100" },
    default_url: 'no_profile_image.jpg'
    
  validates_attachment_content_type :picture, content_type: ['image/jpg', 'image/jpeg', 'image/png']

  has_one :user_account, as: :account, class_name: 'User', dependent: :destroy
  has_one :specialization
  
  has_many :rankings, dependent: :destroy
  has_many :educations, dependent: :destroy
  has_many :work_experiences, dependent: :destroy
  has_many :trainings, dependent: :destroy
  has_many :civil_service_eligibilities, dependent: :destroy
  has_many :voluntary_works, dependent: :destroy
  has_many :other_infos, dependent: :destroy
  
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

  has_many :leaves, dependent: :destroy 
  has_many :career_paths #, dependent: :destroy

  belongs_to :rank, class_name: 'AcademicRanking', foreign_key: 'academic_ranking_id'
  # belongs_to :department

  #, inverse_of: :employee
  accepts_nested_attributes_for :user_account, 
    reject_if: lambda { |attributes| attributes['username'].blank? && attributes['password'].blank? }

  # accepts_nested_attributes_for :picture

  validates :first_name, :last_name, 
    presence: true,
    length: { maximum: 50 }

  with_options on: :update do |record|
    record.validates :gender, 
      inclusion: { in: GENDER_TYPES.keys.map(&:to_s) }
    
    record.validates :civil_status, 
      inclusion: { in: CIVIL_STATUS_TYPES.keys.map(&:to_s) }    
    
    record.validates :blood_type,
      inclusion: { in: BLOOD_TYPES.keys.map(&:to_s) }

    record.validates :middle_name, length: { maximum: 50 }
    record.validates :name_extension, length: { maximum: 7 }
    record.validates :height, length: { maximum: 5 }
    record.validates :weight, length: { maximum: 15 }
    record.validates :blood_type, length: { maximum: 3 }
    record.validates :gsis_no, :pagibig_no, :philhealth_no, 
                      :agency_employee_no, 
                      length: { maximum: 20 }

    record.validates :r_address, :p_address, length: { maximum: 70 }
    record.validates :r_zip_code, :p_zip_code, length: { maximum: 5 }
    record.validates :r_telephone_no, :p_telephone_no, length: { maximum: 15 }      

    record.validates :email_address, length: { maximum: 40 }
    # validate format of :email too

    record.validates :citizenship, :sss_no, :cellphone_no, :tin, 
                      length: { maximum: 15 } 
    
    # has_attached_file :picture # styles: {}
    # validates_attachment_content_type :picture, :content_type => //    
  end

  def self.get_field_limit_of(field_name)
    column_for_attribute(field_name.to_s.to_sym).limit
  end

  def full_name
=begin
  Roosevelt, Theodore, Jr.
  Stevenson, Adlai E., III
  Sia, Elmer A., Jr
  Moffett, Mrs. James, Sr.
=end     
    name = "#{first_name.capitalize} "
    name << "#{middle_name.first.capitalize}. " if middle_name.present?
    name << last_name.capitalize
    # TODO: account for employee's name extension
  end

  def full_name_in_reverse
    name = "#{last_name.capitalize}, "
    name << "#{first_name.capitalize} "
    if middle_name.present?
      name << "#{middle_name.first.capitalize}."
    else
      name
    end
  end

  def age
    return nil if birth_date.nil?
    # 3/23/16         3/20/1985
    if Date.current.month >= birth_date.month
      if Date.current.day >= birth_date.day
        Date.current.year - birth_date.year
      else

      end
    else
      (Date.current.year - birth_date.year) - 1
    end
    
  end

end