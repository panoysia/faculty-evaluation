class Admin::TestRankingsController < Admin::ApplicationController
  
  def index
    @rankings = AcademicRanking.order(salary_grade: :asc)
  end

  def show
    # render html: params and return true
    qce_score = params[:qce_score].to_f
    cce_score = params[:cce_score].to_f
    @evaluator = Employee::RankEvaluator.new(nil, cce_score, qce_score)
  end
end