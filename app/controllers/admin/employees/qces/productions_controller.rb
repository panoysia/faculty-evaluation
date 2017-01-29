class Admin::Employees::QCEs::ProductionsController < Admin::ApplicationController

  layout "employee_profile"

  
  def show
    @employee = Employee.find(params[:employee_id])
    @qce = @employee.qces.find(params[:qce_id])
    @rating = @qce.ratings.production.find(params[:id])
  end

end
