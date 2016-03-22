class Admin::Employees::WorkExperiencesController < Admin::ApplicationController

  before_action :set_employee
  

  def index
    @work_experiences = @employee.work_experiences
    #@work_experience = @work_experiences.new
    render layout: 'employee_profile'
  end

  def new
    @work_experience = @employee.work_experiences.new
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