class Admin::AcademicRankingsController < Admin::ApplicationController
  
  def index
    @academic_rankings = AcademicRanking.all
  end

end