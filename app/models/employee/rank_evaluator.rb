class Employee::RankEvaluator
  STARTING_CCE_PTS_FOR_PROFESSORIAL_RANK = 159
  STARTING_QCE_PTS_FOR_PROFESSORIAL_RANK = 61
  MAX_QCE_PTS_FOR_NON_PROFESSORIAL_RANK = 95

  MAX_CCE_PTS = 200
  MAX_QCE_PTS = 100

  attr_accessor :rank, :cce_score, :qce_score


  def initialize(cce_score, qce_score)
    @cce_score = cce_score.floor
    @qce_score = qce_score.floor
  end

  # def evaluate(cce_score, qce_score)
  def evaluate
    @rankings = AcademicRanking.order(salary_grade: :asc)

    if cce_score < STARTING_CCE_PTS_FOR_PROFESSORIAL_RANK
      # Query for non-professorial ranks

      # Set a ceiling on max QCE points for non-professorial
      if qce_score > MAX_QCE_PTS_FOR_NON_PROFESSORIAL_RANK
        self.qce_score = MAX_QCE_PTS_FOR_NON_PROFESSORIAL_RANK
      end

      cce_rank = get_non_professorial_rank(:cce, cce_score)
      qce_rank = get_non_professorial_rank(:qce, qce_score)
    else
      # Query for professorial ranks
      # Has a chance to attain the lowest Professor rank (Professor 1)
      if cce_score > MAX_CCE_PTS
        self.cce_score = MAX_CCE_PTS
      end

      # Ensure QCE score is within the right range of scores
      if qce_score < STARTING_QCE_PTS_FOR_PROFESSORIAL_RANK
        self.qce_score = STARTING_QCE_PTS_FOR_PROFESSORIAL_RANK
      elsif qce_score > MAX_QCE_PTS
        self.qce_score = MAX_QCE_PTS
      end

      cce_rank = get_professorial_rank(:cce, cce_score)
      qce_rank = get_professorial_rank(:qce, qce_score)
    end

    # [cce_rank, qce_rank]

    # Get whichever is lower by basing on the :salary_grade value
    if cce_rank.salary_grade < qce_rank.salary_grade
      cce_rank
    else
      qce_rank
    end

  end   # def evaluate


  private


  attr_accessor :rankings

  def get_non_professorial_rank(score_type = :cce, score)
    if score_type == :cce
      condition = ":score >= cce_min_points AND :score <= cce_max_points"
    elsif score_type == :qce
      condition = ":score >= qce_min_points AND :score <= qce_max_points"
    end

    rank = rankings.non_professorial.
            where(condition, {score: score}).first
  end

  def get_professorial_rank(score_type = :cce, score)
    if score_type == :cce
      condition = ":score >= cce_min_points AND :score <= cce_max_points"
    elsif score_type == :qce
      condition = ":score >= qce_min_points AND :score <= qce_max_points"
    end

    rank = rankings.professorial.
            where(condition, {score: score}).first
  end

end   # class class Employee::RankEvaluator


=begin

  def initialize(rank, cce_score, qce_score)
    @rank = rank
    @cce_score = cce_score.floor
    @qce_score = qce_score.floor
  end

  attr_accessor :evaluated_rank

  def to_s
    "#{@evaluated_rank.full_name}"
  end

=end

=begin
  1. Determine the minimum if its the qce_score or cce_score
  2. Do a query based on the 

  SELECT * FROM academic_rankings
    WHERE cce_score >= cce_min_points 
    AND cce_score <= cce_max_points

  SELECT * FROM academic_rankings
    WHERE qce_score >= qce_min_points 
    AND qce_score <= qce_max_points

  condition = ":cce_score >= cce_min_points AND :cce_score <= cce_max_points"
  
  cce = AcademicRanking.where(condition, {cce_score: cce_score})

  if cce.salary_grade < qce.salary_grade
    # return rank based on lower salary grade
    cce
  else
    qce
  end

=end
