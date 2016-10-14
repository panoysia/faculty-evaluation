class User::HRProfileController < User::ApplicationController

  def show
    @profile = @current_user.account
  end

end