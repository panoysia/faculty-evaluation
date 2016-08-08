class Admin::Employees::ExpertServicesController < Admin::ApplicationController
  
  before_action :set_employee
  
  layout 'employee_profile'

  def index
  end


  private

  def set_employee
    @employee = Employee.find(params[:employee_id])
  end
  
end
