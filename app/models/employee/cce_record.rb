class Employee::CCERecord

  EDUCATIONS = %i(
    academic_degrees
    additional_degrees
    additional_credits
  )

  WORK_EXPERIENCES = %i(
    academic_work_experiences
    admin_work_experiences
    professional_work_experiences
    public_private_work_experiences
  )

  ACHIEVEMENTS = %i(
    trainings
    inventions
    discoveries
    creative_works
    innovations
    publications
    technical_articles
    instructional_manuals
    professional_memberships
    academic_honors
    scholarships
    awards
    community_outreaches
    professional_examinations
    consultancy_services
    professional_services
    academic_advisories
    professional_reviews
    accreditation_services
    assessor_services
    trainer_services
  )

  attr_reader :employee, :nbc_id
  delegate *EDUCATIONS, *WORK_EXPERIENCES, *ACHIEVEMENTS,
            to: :employee


  def initialize(employee)
    @employee = employee
  end

  # def initialize(employee, nbc_id = nil)
  #   @employee = employee
  #   @nbc_id = nbc_id
  # end

  def total_educations_score
    # employee.cce_scorings.with_nbc(nbc_id).educations.sum(:points)
    employee.cce_scorings.educations.sum(:points)
  end

  def total_achievements_score
    employee.cce_scorings.achievements.sum(:points)
  end

  def total_work_experiences_score
    employee.cce_scorings.work_experiences.sum(:points)
  end

  def overall_score 
    employee.cce_scorings.sum(:points)
  end
  
  # def trainer_services
  #   employee.trainer_services.joins(:cce_scoring)
  # end
end
