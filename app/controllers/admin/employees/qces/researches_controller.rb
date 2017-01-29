class Admin::Employees::QCEs::ResearchesController < Admin::ApplicationController

  layout "employee_profile"

  
  def show
    @employee = Employee.find(params[:employee_id])
    @qce = @employee.qces.find(params[:qce_id])
    @rating = @qce.ratings.research.find(params[:id])
  end

end
