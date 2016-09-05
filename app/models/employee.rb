# == Schema Information
#
# Table name: employees
#
#  id                   :integer          not null, primary key
#  first_name           :string(50)       not null
#  last_name            :string(50)       not null
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  middle_name          :string(50)
#  name_extension       :string(7)
#  designation          :string
#  gender               :string(1)
#  civil_status         :string(3)
#  birth_date           :date
#  citizenship          :string(15)
#  height               :string(5)
#  weight               :string(15)
#  blood_type           :string(3)
#  gsis_no              :string(20)
#  pagibig_no           :string(20)
#  philhealth_no        :string(20)
#  sss_no               :string(15)
#  r_address            :string(70)
#  r_zip_code           :string(5)
#  r_telephone_no       :string(15)
#  p_address            :string(70)
#  p_zip_code           :string(5)
#  p_telephone_no       :string(15)
#  email_address        :string(40)
#  cellphone_no         :string(15)
#  agency_employee_no   :string(20)
#  tin                  :string(15)
#  academic_ranking_id  :integer
#  hired_date           :date
#  picture_file_name    :string
#  picture_content_type :string
#  picture_file_size    :integer
#  picture_updated_at   :datetime
#  specialization_id    :integer
#  department_id        :integer
#
# Indexes
#
#  index_employees_on_academic_ranking_id  (academic_ranking_id)
#  index_employees_on_department_id        (department_id)
#  index_employees_on_specialization_id    (specialization_id)
#

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

class Employee < ApplicationRecord
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

  has_one :user_account, as: :account, 
                        class_name: 'User', dependent: :destroy
  # has_one :supervisor, class_name: 'Employee'

  has_many :rankings, dependent: :destroy

  # has_many :educations, dependent: :destroy
  has_many :academic_degrees, dependent: :destroy
  has_many :additional_degrees, dependent: :destroy
  has_many :additional_credits, dependent: :destroy

  has_many :work_experiences, dependent: :destroy
  
  has_many :civil_service_eligibilities, dependent: :destroy
  has_many :voluntary_works, dependent: :destroy
  has_many :other_infos, dependent: :destroy
  
  # prof. dev-related resources
  has_many :inventions, dependent: :destroy
  has_many :discoveries, dependent: :destroy
  has_many :creative_works, dependent: :destroy
  has_many :innovations, dependent: :destroy
  has_many :publications, dependent: :destroy
  has_many :technical_articles, dependent: :destroy
  has_many :instructional_manuals, dependent: :destroy
  
  has_many :trainings, dependent: :destroy
  has_many :professional_services, dependent: :destroy
  has_many :academic_advisories, dependent: :destroy
  has_many :professional_reviews, dependent: :destroy
  has_many :accreditation_services, dependent: :destroy
  has_many :assessor_services, dependent: :destroy
  has_many :trainer_services, dependent: :destroy

  has_many :professional_memberships, dependent: :destroy
  has_many :academic_honors, dependent: :destroy
  has_many :scholarships, dependent: :destroy
  has_many :awards, dependent: :destroy
  has_many :community_outreaches, dependent: :destroy
  has_many :professional_examinations, dependent: :destroy

  # Employee's own QCEs as (owner)
  has_many :qces, dependent: :destroy
  # QCE association: belongs_to :qce

  # Ratings to evaluate/grade by Employee
  has_many :ratings, as: :evaluator,
                      class_name: 'QCE::Rating',
                      dependent: :destroy
  # QCE::Rating association:
  #   belongs_to :evaluator, polymorphic: true
  
  has_many :owned_tasks, class_name: 'QCE::RatingTask',
                          foreign_key: 'employee_id',
                          dependent: :destroy
  # QCE::RatingTask association: 
  #   belongs_to :employee, class_name: 'Employee'

  has_many :rating_tasks, as: :evaluator,
                          class_name: 'QCE::RatingTask',
                          dependent: :destroy
  
  has_many :cce_scorings, class_name: 'Employee::CCEScoring',
                          dependent: :destroy

  # QCE::RatingTask association:
  #   belongs_to :evaluator, polymorphic: true

  has_many :leaves, dependent: :destroy 
 
  has_many :actions, through: :specialization,
                      source: :career_path_actions
  has_one :career_path, through: :specialization,
                        source: :career_path

  belongs_to :rank, class_name: 'AcademicRanking',
                    foreign_key: 'academic_ranking_id'
  belongs_to :specialization
  belongs_to :department

  #, inverse_of: :employee
  accepts_nested_attributes_for :user_account, 
    reject_if: lambda { |attributes| attributes['username'].blank? && attributes['password'].blank? }

  # accepts_nested_attributes_for :picture

  validates :first_name, :last_name, 
    presence: true,
    length: { maximum: 50 }

  with_options on: :update do |record|
    # Check for validity of association
    record.validates :specialization, presence: true
    record.validates :rank, presence: true
    record.validates :department, presence: true
    
    record.validates :gender, 
      inclusion: { in: GENDER_TYPES.keys.map(&:to_s) }
    
    record.validates :civil_status, 
      inclusion: { in: CIVIL_STATUS_TYPES.keys.map(&:to_s) },
      allow_blank: true
    
    record.validates :blood_type,
      inclusion: { in: BLOOD_TYPES.keys.map(&:to_s) },
      allow_blank: true

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
    
    record.validates :hired_date, presence: true

    # has_attached_file :picture # styles: {}
    # validates_attachment_content_type :picture, :content_type => //    
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

    now = Time.now.utc.to_date
    now.year - birth_date.year - ((now.month > birth_date.month || (now.month == birth_date.month && now.day >= birth_date.day)) ? 0 : 1)
  end

  # TODO: Age computation is unfinished
  # def age
  #   return nil if birth_date.nil?
  #   # 3/23/16         3/20/1985
  #   if Date.current.month >= birth_date.month
  #     if Date.current.day >= birth_date.day
  #       Date.current.year - birth_date.year
  #     else

  #     end
  #   else
  #     (Date.current.year - birth_date.year) - 1
  #   end    
  # end

  def years_in_service

=begin    
  6/9/2016
=end
  end

end
