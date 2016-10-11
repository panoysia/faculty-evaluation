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

  # POINTS_FOR_DOCTORATE = 85
  # POINTS_FOR_LICENSED_MD = 85
  # POINTS_FOR_LLB_OR_MASTERS_OR_MD = 65

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
    sum_of_prof_examinations >= MAX_PTS_FOR_PROF_EXAMINATIONS
  end

  def has_max_points_for_community_outreaches?
    sum_of_community_outreaches >= MAX_PTS_FOR_COMMUNITY_OUTREACHES
  end

  def has_max_points_for_awards?
    sum_of_awards >= MAX_PTS_FOR_AWARDS
  end

  def has_max_points_for_prof_memberships?
    sum_of_prof_memberships >= MAX_PTS_FOR_PROF_MEMBERSHIPS
  end

  def has_max_points_for_academic_advisories?
    sum_of_academic_advisories >= MAX_PTS_FOR_ACADEMIC_ADVISORIES
  end

  def has_max_points_for_trainings?
    sum_of_trainings >= MAX_PTS_FOR_TRAININGS_SEMINARS
  end

  def has_max_points_for_instructional_manuals?
    sum_of_instructional_manuals >= MAX_PTS_FOR_INSTRUCTIONAL_MANUALS
  end

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

  def sum_of_academic_degrees
    cce_scorings.academic_degrees
  end

  def sum_of_additional_degrees
  end

  def sum_of_additional_credits
  end

  def sum_of_academic_work_experiences
    @sum_academic_work_experiences ||= cce_scorings.
                                        academic_work_experiences.sum(:points)
  end

  def sum_of_admin_work_experiences
    @sum_admin_work_experiences ||= cce_scorings.admin_work_experiences.sum(:points)
  end

  def sum_of_prof_work_experiences
    @sum_prof_work_experiences ||= cce_scorings.prof_work_experiences.sum(:points)
  end

  def sum_of_public_private_work_experiences
    @sum_public_private_work_experiences ||= cce_scorings.
                                              public_private_work_experiences.
                                              sum(:points)
  end

  def sum_of_prof_memberships
    @sum_prof_memberships ||= cce_scorings.prof_memberships.sum(:points)
  end

  def sum_of_academic_honors
    @sum_academic_honors ||= cce_scorings.academic_honors.sum(:points)
  end

  def sum_of_scholarships
    @sum_scholarships ||= cce_scorings.scholarships.sum(:points)
  end

  def sum_of_awards
    @sum_awards ||= cce_scorings.awards.sum(:points)
  end

  def sum_of_community_outreaches
    @sum_community_outreaches ||= cce_scorings.
                                    community_outreaches.sum(:points)
  end

  def sum_of_prof_examinations
    @sum_prof_examinations ||= cce_scorings.prof_examinations.sum(:points)
  end

  def sum_of_inventions
    @sum_inventions ||= cce_scorings.inventions.sum(:points)
  end

  def sum_of_discoveries
    @sum_discoveries ||= cce_scorings.discoveries.sum(:points)
  end

  def sum_of_creative_works
    @creative_works ||= cce_scorings.creative_works.sum(:points)
  end

  def sum_of_innovations
    @innovations ||= cce_scorings.innovations.sum(:points)
  end

  def sum_of_publications
    @sum_publications ||= cce_scorings.publications.sum(:points)
  end

  def sum_of_technical_articles
    @sum_technical_articles ||= cce_scorings.technical_articles.sum(:points)
  end

  def sum_of_instructional_manuals
    @sum_instructional_manuals ||= cce_scorings.instructional_manuals.
                                    sum(:points)
  end

  def sum_of_trainings
    @sum_trainings ||= cce_scorings.trainings.sum(:points)
  end

  def sum_of_consultancy_services
    @sum_consultancy_services ||= cce_scorings.consultancy_services.
                                    sum(:points)
  end

  def sum_of_prof_services
    @sum_prof_services ||= cce_scorings.prof_services.sum(:points)
  end

  def sum_of_academic_advisories
    @sum_academic_advisories ||= cce_scorings.academic_advisories.sum(:points)
  end

  def sum_of_prof_reviews
    @sum_prof_reviews ||= cce_scorings.prof_reviews.sum(:points)
  end

  def sum_of_accreditation_services
    @sum_accreditation_services ||= cce_scorings.accreditation_services.
                                      sum(:points)
  end

  def sum_of_assessor_services
    @sum_assessor_services ||= cce_scorings.assessor_services.sum(:points)
  end

  def sum_of_trainer_services
    @sum_trainer_services ||= cce_scorings.trainer_services.sum(:points)
  end

end


#@educations_sum ||= cce_scorings.educations.sum(:points)

# def initialize(employee, nbc_id = nil)
#   @employee = employee
#   @nbc_id = nbc_id
# end

# employee.cce_scorings.with_nbc(nbc_id).educations.sum(:points)