class Admin::Employees::CCEScoringsController < Admin::ApplicationController

  def index
    @scorings = current_user.account.cce_scorings      
  end


end