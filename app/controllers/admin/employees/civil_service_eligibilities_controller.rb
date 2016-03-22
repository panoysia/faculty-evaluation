class Admin::Employees::CivilServiceEligibilitiesController < Admin::ApplicationController

  before_action :set_employee
  

  def index
    @civil_service_eligibilities = @employee.civil_service_eligibilities
    #@civi_service_eligibility = @civil_service_eligibilities.new
    render layout: 'employee_profile'
  end

  def new
    @civi_service_eligibility = @employee.civil_service_eligibilities.new
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