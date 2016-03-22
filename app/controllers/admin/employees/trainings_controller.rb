class Admin::Employees::TrainingsController < Admin::ApplicationController

  before_action :set_employee
  

  def index
    @trainings = @employee.trainings
    #@training = @trainings.new
    render layout: 'employee_profile'
  end

  def new
    @training = @employee.trainings.new
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