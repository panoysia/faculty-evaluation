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

  MAX_PTS_FOR_EDUCATIONS = 85.00
    MAX_PTS_FOR_ADDITIONAL_CREDITS = 10.00

  MAX_PTS_FOR_WORK_EXPERIENCES = 25.00
  MAX_PTS_FOR_ACHIEVEMENTS = 90.00


  MAX_PTS_FOR_CREATIVE_WORKS_CATEGORY = 30.00
    MAX_PTS_FOR_INSTRUCTIONAL_MANUALS = 10.00

  MAX_PTS_FOR_TRAININGS_SEMINARS = 10.00
  MAX_PTS_FOR_ACADEMIC_ADVISORIES = 10.00

  MAX_PTS_FOR_PROF_MEMBERSHIPS = 10.00
  MAX_PTS_FOR_AWARDS = 5.00
  MAX_PTS_FOR_COMMUNITY_OUTREACHES = 5.00
  MAX_PTS_FOR_PROF_EXAMINATIONS = 10.00
 

  MAX_PTS_FOR_EXPERT_SERVICES_RENDERED = 20.00
  
  MAX_PTS_FOR_EXPERT_SERVICES_CATEGORY = 
    MAX_PTS_FOR_EXPERT_SERVICES_RENDERED + MAX_PTS_FOR_TRAININGS_SEMINARS


  attr_reader :employee, :nbc_id, :ninja

  delegate *EDUCATIONS, *WORK_EXPERIENCES, *ACHIEVEMENTS, :cce_scorings,
            to: :employee
  

  def initialize(employee)
    @employee = employee
  end


  def total_educations_score
    return MAX_PTS_FOR_EDUCATIONS if has_max_points_for_educations?
    sum_of_educations
  end

  def total_work_experiences_score
    return MAX_PTS_FOR_WORK_EXPERIENCES if has_max_points_for_work_experiences?

    sum_of_work_experiences
  end

  def total_achievements_score
    return MAX_PTS_FOR_ACHIEVEMENTS if has_max_points_for_achievements?
    sum_of_achievements    
  end

  def overall_score
    total_educations_score +
    total_work_experiences_score +
    total_achievements_score
  end

  def has_max_points_for_educations?
    sum_of_educations >= MAX_PTS_FOR_EDUCATIONS
  end

  def has_max_points_for_work_experiences?
    sum_of_work_experiences >= MAX_PTS_FOR_WORK_EXPERIENCES
  end

  def has_max_points_for_achievements?
    sum_of_achievements >= MAX_PTS_FOR_ACHIEVEMENTS
  end

  def has_max_points_for_creative_works_category?
    sum_of_creative_works_category >= MAX_PTS_FOR_CREATIVE_WORKS_CATEGORY
  end

  def has_max_points_for_expert_services_rendered?
    sum_of_expert_services_rendered >= MAX_PTS_FOR_EXPERT_SERVICES_RENDERED
  end

  def has_max_points_for_expert_services_category?
    sum_of_expert_services_category >= MAX_PTS_FOR_EXPERT_SERVICES_CATEGORY
  end


  # totals in subcriteria
  def has_max_points_for_additional_credits?
    cce_scorings.additional_credits.
      sum(:points) >= MAX_PTS_FOR_ADDITIONAL_CREDITS
  end

  def has_max_points_for_prof_examinations?
    cce_scorings.prof_examinations.
      sum(:points) >= MAX_PTS_FOR_PROF_EXAMINATIONS
  end

  def has_max_points_for_community_outreaches?
    cce_scorings.community_outreaches.
      sum(:points) >= MAX_PTS_FOR_COMMUNITY_OUTREACHES
  end

  def has_max_points_for_awards?
    cce_scorings.awards.sum(:points) >= MAX_PTS_FOR_AWARDS
  end

  def has_max_points_for_prof_memberships?
    cce_scorings.prof_memberships.
      sum(:points) >= MAX_PTS_FOR_PROF_MEMBERSHIPS
  end

  def has_max_points_for_academic_advisories?
    cce_scorings.academic_advisories.
      sum(:points) >= MAX_PTS_FOR_ACADEMIC_ADVISORIES
  end

  def has_max_points_for_trainings?
    cce_scorings.trainings.
      sum(:points) >= MAX_PTS_FOR_TRAININGS_SEMINARS
  end

  def has_max_points_for_instructional_manuals?
    cce_scorings.instructional_manuals.
      sum(:points) >= MAX_PTS_FOR_INSTRUCTIONAL_MANUALS
  end


  # private


  def sum_of_educations
    @educations_sum ||= cce_scorings.educations.sum(:points)
  end

  def sum_of_work_experiences
    @work_experiences_sum ||= cce_scorings.work_experiences.sum(:points)
  end

  def sum_of_achievements
    @achievements_sum ||= cce_scorings.achievements.sum(:points)    
  end

  def sum_of_creative_works_category  
    @sum_creative_works_category ||= cce_scorings.creative_works_category.sum(:points)
  end
  
  def sum_of_expert_services_rendered
    @sum_expert_services_rendered ||= cce_scorings.expert_services_rendered.sum(:points)
  end

  def sum_of_expert_services_category
    @sum_expert_services_category ||= cce_scorings.expert_services_category.sum(:points)
  end

  # def initialize(employee, nbc_id = nil)
  #   @employee = employee
  #   @nbc_id = nbc_id
  # end

  # employee.cce_scorings.with_nbc(nbc_id).educations.sum(:points)

end
