class Admin::DashboardController < Admin::ApplicationController

  def show
    @leaves = Leave.includes(:employee).latest(5)
    @career_actions = CareerPathAction.includes(:specialization).latest(5)
  end
  
end