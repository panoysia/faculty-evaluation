class Admin::Employees::QCEsController < Admin::ApplicationController

  before_action :set_employee
  before_action :set_qce, only: [:show]

  layout 'employee_profile'


  def index
    @qces = (1..5).to_a
    # @qces = @employee.qces
  end

  def show
  end


  private

  def set_employee
    @employee = Employee.find(params[:employee_id])
  end

  def set_qce
    @qce = @employee.qces.find(params[:id])    
  end
  
end
