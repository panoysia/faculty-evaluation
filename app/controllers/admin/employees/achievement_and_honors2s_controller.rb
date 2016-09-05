class Admin::Employees::AchievementAndHonors2sController < Admin::ApplicationController

  before_action :set_employee
  
  layout 'employee_profile'

  def show
  end

  
  private

  def set_employee
    @employee = Employee.find(params[:employee_id])
  end

end
