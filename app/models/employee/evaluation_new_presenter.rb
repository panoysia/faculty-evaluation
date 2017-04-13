class Employee::EvaluationNewPresenter < Employee::EvaluationPresenter

  def initialize(evaluation)
    super(evaluation)
    @cce_record = Employee::CCERecord.new(employee)
  end

  def qce_score
    qces_average_weighted_total_score
  end

  def cce_score
    @cce_record.overall_score
  end

  def current_rank
    employee.rank.try(:full_name)
  end

  def rank_before
    employee.rank.try(:full_name)
  end

  def rank_after
    @_achieved_rank ||= compute_achieved_rank
    @_achieved_rank.try(:full_name)
  end


  private


  def compute_achieved_rank
    evaluator = Employee::RankEvaluator.new(cce_score, qce_score)
    evaluator.evaluate
  end

end
