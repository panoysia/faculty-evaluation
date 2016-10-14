class User::HRProfileController < User::ApplicationController

  def create
  end

  def show
    # find the polymorphic account of the user/employee
    #   current_user.account
    #@profile = Employee.find(current_user)

    @profile = @current_user.account
    #render html: @ and return true
  end


end