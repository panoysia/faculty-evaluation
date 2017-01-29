class Admin::Employees::QCEsController < Admin::ApplicationController

  before_action :set_employee

  layout "employee_profile"


  def index
    # TODO: Refactor and change the method name:
    @qces = @employee.qces.sort_by_academic_year_and_semester
  end

  def show
    @qce = @employee.qces.find(params[:id])
  end


  private


  def set_employee
    @employee = Employee.find(params[:employee_id])
  end
  
end
