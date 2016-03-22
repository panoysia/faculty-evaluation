class Admin::Employees::VoluntaryWorksController < Admin::ApplicationController

  before_action :set_employee
  

  def index
    @voluntary_works = @employee.voluntary_works
    #@voluntary_work = @voluntary_works.new
    render layout: 'employee_profile'
  end

  def new
    @voluntary_work = @employee.voluntary_works.new
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