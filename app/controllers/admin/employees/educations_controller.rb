class Admin::Employees::EducationsController < Admin::ApplicationController
  
  before_action :set_employee

  def index
    @educations = @employee.educations
  end

  def new
    @education = @employee.educations.new
  end

  def create
  end


  private

  def set_employee
    @employee = Employee.find(params[:employee_id])
  end
end