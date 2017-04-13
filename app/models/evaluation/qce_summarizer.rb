class Evaluation::QCESummarizer
  WHOLE_PCT = 1.0
  HALF_PCT = 0.5
  ZERO = 0

  attr_reader :qce


  def initialize(qce)
    @qce = qce
  end

  def academic_year
    qce.rating_period.academic_year.coverage_in_years
  end

  def to_s
    "#{academic_year} - #{qce.rating_period.semester}"
  end

  def weighted_total_score
    area = support_area.try(:downcase).try(:to_sym)
    weighted_score_for_instruction +
      (weighted_score_for_support_area(area) || ZERO)
    # puts "========> #{weighted_score_for_support_area(area)}"
    # weighted_score_for_support_area(support_area) || ZERO)
  end

  def weighted_percentage
    qce.support_area? ? HALF_PCT : WHOLE_PCT
  end

  def weighted_score_for_instruction
    score_for_instruction * weighted_percentage
  end

  def weighted_score_for_support_area(area)
    score = score_for_support_area(area)
    if score
      score * weighted_percentage
    else
      nil
    end
  end

  def score_for_instruction
    weighted_score_of_student_ratings +
    weighted_score_of_peer_ratings +
    weighted_score_of_supervisor_rating +
    weighted_score_of_self_rating
  end

  def score_for_support_area(area)
    # support_areas = %i(research extension production)
    # area = area.to_s.downcase.to_sym
    
    return nil if self.support_area.blank? || 
                    not_in_default_areas?(area)

    if support_area.downcase.to_sym == area
      weighted_score_of_leadership_instrument +
      weighted_score_of_clientele_instruments +
      weighted_score_of_partnership_instruments +
      weighted_score_of_community_instruments
    end
  end

  def support_area
    qce.support_area
  end


  private


  def not_in_default_areas?(area)
    support_areas = %i(research extension production)
    area = area.to_s.downcase.to_sym

    support_areas.exclude?(area)
  end

  def weighted_score_of_student_ratings
    qce.student_instruction_ratings_average * QCE::STUDENTS_RATING_PCT
  end

  def weighted_score_of_peer_ratings
    qce.peer_instruction_ratings_average * QCE::PEER_RATING_PCT
  end

  def weighted_score_of_supervisor_rating
    qce.supervisor_instruction_rating.total_score *
      QCE::SUPERVISOR_RATING_PCT
  end

  def weighted_score_of_self_rating
    qce.self_instruction_rating.total_score *
      QCE::SELF_RATING_PCT
  end
  
  def leadership_instrument_total_score
    qce.try(:leadership_instrument).try(:total_score) || ZERO.to_f
  end

  def weighted_score_of_leadership_instrument
    score = (leadership_instrument_total_score /
              QCE::MAX_SCORE_FOR_SUPPORT_AREA_EVALUATION) *
                QCE::ONE_HUNDRED

    score * QCE::PERCENTAGE_WEIGHT
  end

  def weighted_score_of_clientele_instruments
    score = (qce.clientele_instruments_average /
              QCE::MAX_SCORE_FOR_SUPPORT_AREA_EVALUATION) *
                QCE::ONE_HUNDRED

    score * QCE::PERCENTAGE_WEIGHT
  end

  def weighted_score_of_partnership_instruments
    score = (qce.partnership_instruments_average /
              QCE::MAX_SCORE_FOR_SUPPORT_AREA_EVALUATION) *
                QCE::ONE_HUNDRED

    score * QCE::PERCENTAGE_WEIGHT
  end

  def weighted_score_of_community_instruments
    score = (qce.community_instruments_average /
              QCE::MAX_SCORE_FOR_SUPPORT_AREA_EVALUATION) *
                QCE::ONE_HUNDRED

    score * QCE::PERCENTAGE_WEIGHT
  end

end
