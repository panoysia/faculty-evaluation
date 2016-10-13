class Employee::CCERecord
  include CCEConstants::AcademicDegree
  include CCEConstants::AdditionalDegree

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

  # "PTS" is short for "points"
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

  PTS_FOR_DOCTORATE = 85.00
  PTS_FOR_LICENSED_MD = PTS_FOR_DOCTORATE
  PTS_FOR_MASTERS = 65
  PTS_FOR_LLB = PTS_FOR_MASTERS
  PTS_FOR_MD = PTS_FOR_MASTERS

  attr_reader :employee, :nbc_id, :cce_scorings
  delegate *EDUCATIONS, *WORK_EXPERIENCES, *ACHIEVEMENTS, to: :employee
  

  def initialize(employee)
    @employee = employee
    @cce_scorings = @employee.cce_scorings
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

  def highest_academic_degree
    # @highest_academic_degree ||= academic_degrees.highest.try(:first)
    # return @highest_academic_degree if @highest_academic_degree
    @highest_academic_degree ||= get_highest_academic_degree
  end


  def get_highest_academic_degree
    record_ids = cce_scorings.academic_degrees.map(&:cce_scorable_id)
    academic_degrees.where(id: record_ids).highest.try(:first)    
  end

  def score_for_additional_masters_degree
    puts "ENTER SCORE_FOR_ADDITIONAL_MASTERS_DEGREE"
    points_for_masters = ::CCEConstants::AdditionalDegree::PTS_FOR_MASTERS
    cce_scorings.additional_degrees.
      where(points: points_for_masters).
      sum(:points)
  end
  
  def score_for_additional_bachelors_degree
    puts "ENTER SCORE_FOR_ADDITIONAL_BACHELORS_DEGREE"
    points_for_bachelors = ::CCEConstants::AdditionalDegree::PTS_FOR_BACHELORS
    cce_scorings.additional_degrees.
      where(points: points_for_bachelors).
      sum(:points)
  end

  def score_for_additional_doctorate_credits
    puts "ENTER SCORE_FOR_ADDITIONAL_DOCTORATE_CREDITS"
    record_ids = cce_scorings.additional_credits.map(&:cce_scorable_id)

    additional_credits.where(id: record_ids).doctorate.
      joins(:cce_scoring).sum(:points)
  end

  def score_for_additional_masters_credits
    puts "ENTER SCORE_FOR_ADDITIONAL_MASTERS_CREDITS"
    record_ids = cce_scorings.additional_credits.map(&:cce_scorable_id)

    additional_credits.where(id: record_ids).masters.
      joins(:cce_scoring).sum(:points)
  end

  def compute_score_for_masters_degree
    @score_for_masters ||=
      score_for_additional_masters_degree + 
      score_for_additional_doctorate_credits
  end

  def compute_score_for_bachelors_degree
    @score_for_bachelors ||= 
      score_for_additional_bachelors_degree +
      score_for_additional_masters_credits
  end

  def sum_of_educations
    record = highest_academic_degree.presence
    return 0 if record.blank?

    @sum_educations ||=
      case record.degree_type
      when ::CCEConstants::AcademicDegree::DOCTORATE,
            ::CCEConstants::AcademicDegree::MD_LICENSED
        
        puts "EXITING CASE RECORD.DEGREE_TYPE CHECK AND RETURNING 85"
        MAX_PTS_FOR_EDUCATIONS
      
      when ::CCEConstants::AcademicDegree::MASTERS,
            ::CCEConstants::AcademicDegree::LLB,
            ::CCEConstants::AcademicDegree::MD
        puts "ENTERING compute_score_for_masters_degree"
        compute_score_for_masters_degree + record.points

      when ::CCEConstants::AcademicDegree::BACHELORS_PLUS
        puts "ENTERING compute_score_for_bachelors_plus_degree"
        compute_score_for_bachelors_degree + record.points

      when ::CCEConstants::AcademicDegree::BACHELORS
        puts "ENTERING compute_score_for_bachelors_degree"
        compute_score_for_bachelors_degree + record.points

      else
        cce_scorings.academic_degree.sum(:points)
      end   # end case record.degree_type
  end

  def sum_of_work_experiences
    @work_experiences_sum ||= cce_scorings.work_experiences.sum(:points)
  end

  def sum_of_achievements
    @sum_achievements =
      sum_of_creative_works_category +
      sum_of_expert_services_category +
      sum_of_prof_memberships +
      sum_of_awards +
      sum_of_community_outreaches +
      sum_of_prof_examinations +
      sum_of_academic_honors +
      sum_of_scholarships
  
    if @sum_achievements >= MAX_PTS_FOR_ACHIEVEMENTS
      MAX_PTS_FOR_ACHIEVEMENTS
    else
      @sum_achievements
    end
  end

  def sum_of_creative_works_category
    @sum_creative_works_category =
      sum_of_inventions +
      sum_of_discoveries +
      sum_of_creative_works +
      sum_of_innovations +
      sum_of_publications +
      sum_of_technical_articles +
      sum_of_instructional_manuals

    if @sum_creative_works_category >= MAX_PTS_FOR_CREATIVE_WORKS_CATEGORY
      MAX_PTS_FOR_CREATIVE_WORKS_CATEGORY
    else
      @sum_creative_works_category
    end
  end
  
  def sum_of_expert_services_rendered
    @sum_expert_services_rendered = 
      sum_of_consultancy_services +
      sum_of_prof_services + 
      sum_of_academic_advisories +
      sum_of_prof_reviews + 
      sum_of_accreditation_services +
      sum_of_assessor_services +
      sum_of_trainer_services

    if @sum_expert_services_rendered >= MAX_PTS_FOR_EXPERT_SERVICES_RENDERED
      MAX_PTS_FOR_EXPERT_SERVICES_RENDERED
    else
      @sum_expert_services_rendered
    end
  end

  def sum_of_expert_services_category
    @sum_expert_services_category = 
      sum_of_trainings +
      sum_of_expert_services_rendered
      
    if @sum_expert_services_category >= MAX_PTS_FOR_EXPERT_SERVICES_CATEGORY
      MAX_PTS_FOR_EXPERT_SERVICES_CATEGORY
    else
      @sum_expert_services_category
    end
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
    if @sum_prof_memberships >= MAX_PTS_FOR_PROF_MEMBERSHIPS
      MAX_PTS_FOR_PROF_MEMBERSHIPS
    else
      @sum_prof_memberships
    end
  end

  def sum_of_academic_honors
    @sum_academic_honors ||= cce_scorings.academic_honors.sum(:points)
  end

  def sum_of_scholarships
    @sum_scholarships ||= cce_scorings.scholarships.sum(:points)
  end

  def sum_of_awards
    @sum_awards ||= cce_scorings.awards.sum(:points)
    if @sum_awards >= MAX_PTS_FOR_AWARDS
      MAX_PTS_FOR_AWARDS
    else
      @sum_awards
    end
  end

  def sum_of_community_outreaches
    @sum_community_outreaches ||= cce_scorings.
                                    community_outreaches.sum(:points)
    
    if @sum_community_outreaches >= MAX_PTS_FOR_COMMUNITY_OUTREACHES
      MAX_PTS_FOR_COMMUNITY_OUTREACHES
    else
      @sum_community_outreaches
    end
  end

  def sum_of_prof_examinations
    @sum_prof_examinations ||= cce_scorings.prof_examinations.sum(:points)
    
    if @sum_prof_examinations >= MAX_PTS_FOR_PROF_EXAMINATIONS
      MAX_PTS_FOR_PROF_EXAMINATIONS
    else
      @sum_prof_examinations
    end
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
    if @sum_instructional_manuals >= MAX_PTS_FOR_INSTRUCTIONAL_MANUALS
      MAX_PTS_FOR_INSTRUCTIONAL_MANUALS
    else
      @sum_instructional_manuals
    end
  end

  def sum_of_trainings
    @sum_trainings ||= cce_scorings.trainings.sum(:points)
    if @sum_trainings >= MAX_PTS_FOR_TRAININGS_SEMINARS
      MAX_PTS_FOR_TRAININGS_SEMINARS
    else
      @sum_trainings
    end
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
    if @sum_academic_advisories >= MAX_PTS_FOR_ACADEMIC_ADVISORIES
      MAX_PTS_FOR_ACADEMIC_ADVISORIES
    else
      @sum_academic_advisories
    end
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

# def initialize(employee, nbc_id = nil)
#   @employee = employee
#   @nbc_id = nbc_id
# end

# employee.cce_scorings.with_nbc(nbc_id).educations.sum(:points)