class Admin::DashboardController < Admin::ApplicationController

  def show
    #@open_rating_periods = RatingPeriod.open
    @leaves = Leave.includes(:employee).latest(5)
    @career_actions = CareerPathAction.all.latest(5)
  end
end