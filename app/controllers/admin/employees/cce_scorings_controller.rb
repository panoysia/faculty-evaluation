class Admin::Employees::CCEScoringsController < Admin::ApplicationController

  before_action :set_employee #, only: [:index]

  layout 'employee_profile'


  def index
    @scorings = @employee.cce_scorings      
  end


  private

  def set_employee
    @employee = Employee.find(params[:employee_id])
  end

end   # class Admin::Employees::CCEScoringsController < 
