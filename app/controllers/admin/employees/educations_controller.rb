class Admin::Employees::EducationsController < Admin::ApplicationController
  
  before_action :set_employee #, only: [:edit, :show, :update, :destroy]


  def index
    @educations = @employee.educations
    #@education = @educations.new
    render layout: 'employee_profile'
  end

  def new
    @education = @employee.educations.new
  end

  def show
  end

  def create
  end

  def destroy
  end

  private

  def set_employee
    @employee = Employee.find(params[:employee_id])
  end
end