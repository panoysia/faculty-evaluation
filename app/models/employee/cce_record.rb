class Employee::CCERecord
  # include ActiveModel::Model

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
    creative_works
    discoveries
    innovations
    instructional_manuals
    inventions
    publications
    technical_articles
    academic_honors
    awards
    community_outreaches
    professional_examinations
    professional_memberships
    scholarships
    academic_advisories
    accreditation_services
    assessor_services
    professional_reviews
    professional_services
    trainer_services    
  )

  attr_reader :employee
  delegate *EDUCATIONS, *WORK_EXPERIENCES, *ACHIEVEMENTS,
            to: :employee


  def initialize(employee)
    @employee = employee
  end

  def total_educations_score
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

=begin

  # employee_cce_evaluations
  # employee_qce_evaluations
  # employee_nbc_evaluation

  employee_cce_evaluation_logs

  id
  employee_id
  nbc_id
  academic_rank_id
  educations_total
  work_experiences_total
  achievements_total
  overall_total
  created_at
  updated_at

  create_table "faculty_evaluations", force: :cascade do |t|
    "employee_id",  
    "nbc_id",       
    "current_rank",
=end
