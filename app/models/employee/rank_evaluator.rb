class Employee::RankEvaluator
  STARTING_CCE_PTS_FOR_PROFESSORIAL_RANK = 159.00
  MAX_QCE_PTS_FOR_NON_PROFESSORIAL_RANK = 95.00

  attr_accessor :rank, :cce_score, :qce_score, :rankings, :evaluated_rank
  
  def initialize(rank, cce_score, qce_score)
    @rank = rank
    @cce_score = cce_score
    @qce_score = qce_score
  end

  def to_s
    "#{@evaluated_rank.full_name}"
  end

  def get_non_professorial_ranks(score_type = :cce, score)
    if score_type == :cce
      condition = ":score >= cce_min_points AND :score <= cce_max_points"
    elsif score_type == :qce
      condition = ":score >= qce_min_points AND :score <= qce_max_points"
    end

    ranks = rankings.non_professorial.
              where(condition, {score: score}).first
  end


  def get_professorial_ranks(score_type = :cce, score)
    if score_type == :cce
      condition = ":score >= cce_min_points AND :score <= cce_max_points"
    elsif score_type == :qce
      condition = ":score >= qce_min_points AND :score <= qce_max_points"
    end

    ranks = rankings.professorial.
              where(condition, {score: score}).first  
  end

  def evaluate(cce_score, qce_score)
    @rankings = AcademicRanking.order(salary_grade: :asc)

    if cce_score < STARTING_CCE_PTS_FOR_PROFESSORIAL_RANK
      # Query for non-professorial ranks

      # Set a ceiling on max QCE points for non-professorial
      if qce_score > MAX_QCE_PTS_FOR_NON_PROFESSORIAL_RANK
        qce_score = MAX_QCE_PTS_FOR_NON_PROFESSORIAL_RANK
      end

      cce_rank = get_non_professorial_ranks(:cce, cce_score)
      qce_rank = get_non_professorial_ranks(:qce, qce_score)
    else
      # Has a chance to attain the lowest Professor rank (Professor 1)
      # Query for professorial ranks
      cce_rank = get_professorial_ranks(:cce, cce_score)
      qce_rank = get_professorial_ranks(:qce, qce_score)
    end

    # [cce_rank, qce_rank]

    # Get whichever is lower based on :salary_grade value
    if cce_rank.salary_grade < qce_rank.salary_grade
      cce_rank
    else
      qce_rank
    end

  end   # def evaluate

end   # class class Employee::RankEvaluator

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
