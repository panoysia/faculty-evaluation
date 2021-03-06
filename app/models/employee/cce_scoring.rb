# == Schema Information
#
# Table name: employee_cce_scorings
#
#  id                     :integer          not null, primary key
#  employee_id            :integer          not null
#  cce_scorable_id        :integer          not null
#  cce_scorable_type      :string           not null
#  nbc_id                 :integer
#  points                 :decimal(5, 2)    not null
#  supporting_description :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  idx_cce_scorable_on_employee_cce_scorings  (cce_scorable_type,cce_scorable_id)
#  idx_employee_id_on_employee_cce_scorings   (employee_id)
#  idx_nbc_id_on_employee_cce_scorings        (nbc_id)
#

require_dependency "employee/application_record"

class Employee::CCEScoring < Employee::ApplicationRecord
  include CCEConstants::CCEScoring

  belongs_to :cce_scorable, polymorphic: true
  belongs_to :employee
  belongs_to :nbc
  
  delegate :id, :name, to: :nbc, allow_nil: true, prefix: true

  scope :recorded, -> { where.not(nbc_id: nil) }
  scope :unrecorded, -> { where(nbc_id: nil) }
  scope :with_nbc, -> (nbc_id) { where("nbc_id <= ?", nbc_id) }

  scope :educations, -> { where(cce_scorable_type: EDUCATIONS) }
  scope :work_experiences, -> { 
    where(cce_scorable_type: WORK_EXPERIENCES) 
  }
  scope :achievements, -> { where(cce_scorable_type: ACHIEVEMENTS) }

  # includes Employee::Training
  scope :expert_services_category, -> {
    where(cce_scorable_type: EXPERT_SERVICES)
  }

  # excludes Employee::Training
  scope :expert_services_rendered, -> {
    where(cce_scorable_type: EXPERT_SERVICES_RENDERED) 
  }

  scope :creative_works_category, -> {
    where(cce_scorable_type: CREATIVE_WORKS) 
  }


  scope :academic_degrees, -> {
    where(cce_scorable_type: Employee::AcademicDegree) 
  }

  scope :additional_degrees, -> {
    where(cce_scorable_type: Employee::AdditionalDegree) 
  }

  scope :additional_credits, -> { 
    where(cce_scorable_type: Employee::AdditionalCredit) 
  }

  scope :academic_work_experiences, -> { 
    where(cce_scorable_type: Employee::AcademicWorkExperience) 
  }

  scope :admin_work_experiences, -> { 
    where(cce_scorable_type: Employee::AdminWorkExperience) 
  }

  scope :prof_work_experiences, -> { 
    where(cce_scorable_type: Employee::ProfessionalWorkExperience) 
  }

  scope :public_private_work_experiences, -> { 
    where(cce_scorable_type: Employee::PublicPrivateWorkExperience) 
  }

  scope :prof_memberships, -> { 
    where(cce_scorable_type: Employee::ProfessionalMembership)
  }

  scope :academic_honors, -> { 
    where(cce_scorable_type: Employee::AcademicHonor)
  }

  scope :scholarships, -> { 
    where(cce_scorable_type: Employee::Scholarship)
  }

  scope :awards, -> { 
    where(cce_scorable_type: Employee::Award)
  }

  scope :community_outreaches, -> { 
    where(cce_scorable_type: Employee::CommunityOutreach)
  }

  scope :prof_examinations, -> { 
    where(cce_scorable_type: Employee::ProfessionalExamination)
  }

  scope :inventions, -> { 
    where(cce_scorable_type: Employee::Invention)
  }

  scope :discoveries, -> { 
    where(cce_scorable_type: Employee::Discovery) 
  }

  scope :creative_works, -> { 
    where(cce_scorable_type: Employee::CreativeWork)
  }

  scope :innovations, -> { 
    where(cce_scorable_type: Employee::Innovation)
  }

  scope :publications, -> { 
    where(cce_scorable_type: Employee::Publication)
  }

  scope :technical_articles, -> { 
    where(cce_scorable_type: Employee::TechnicalArticle)
  }

  scope :instructional_manuals, -> { 
    where(cce_scorable_type: Employee::InstructionalManual)
  }

  scope :trainings, -> { 
    where(cce_scorable_type: Employee::Training)
  }

  scope :consultancy_services, -> { 
    where(cce_scorable_type: Employee::ConsultancyService) 
  }

  scope :prof_services, -> { 
    where(cce_scorable_type: Employee::ProfessionalService)
  }

  scope :academic_advisories, -> { 
    where(cce_scorable_type: Employee::AcademicAdvisory)
  }

  scope :prof_reviews, -> { 
    where(cce_scorable_type: Employee::ProfessionalReview)
  }

  scope :accreditation_services, -> { 
    where(cce_scorable_type: Employee::AccreditationService)
  }

  scope :assessor_services, -> { 
    where(cce_scorable_type: Employee::AssessorService)
  }

  scope :trainer_services, -> { 
    where(cce_scorable_type: Employee::TrainerService)
  }

  # scope :with_nbc, -> (id = nil) { 
  #   where(nbc_id: id) if id.present?
  # }


  def recorded?
    nbc_id.present?
  end

end
