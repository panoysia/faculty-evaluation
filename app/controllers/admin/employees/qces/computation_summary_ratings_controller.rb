class Admin::Employees::QCEs::ComputationSummaryRatingsController < Admin::ApplicationController

  layout "employee_profile"


  def show
    @employee = Employee.find(params[:employee_id])
    @qce = @employee.qces.find(params[:qce_id])
  end

end
