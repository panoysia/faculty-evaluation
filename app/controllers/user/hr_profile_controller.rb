class User::HRProfileController < User::ApplicationController

  def show
    # find the polymorphic account of the user/employee
    #   current_user.account
    #@profile = Employee.find(current_user)
  end


end