class Admin::Employees::CivilServiceEligibilitiesController < Admin::ApplicationController

  before_action :set_employee
  before_action :set_civil_service, only: [:show, :edit, :update, :destroy]

  layout 'employee_profile'
  

  def index
    @civil_services = @employee.civil_service_eligibilities
  end

  def show
  end

  def new
    @civil_service = @employee.civil_service_eligibilities.new
  end

  def create
    @civil_service = @employee.civil_service_eligibilities.new(civil_service_params)
    respond_to do |format|
      if @civil_service.save
        format.html {
          redirect_to admin_employee_civil_service_eligibilities_path(@employee),
          notice: 'Civil service eligibility was successfully created.'
        }
      else
        format.html { render :new }
      end
    end    
  end

  def edit
  end

  def update
    respond_to do |format|    
      if @civil_service.update(civil_service_params)
        format.html {
          redirect_to edit_admin_employee_civil_service_eligibility_path(@employee, @civil_service),
          notice: 'Civil service eligibility was successfully updated.'
        }
      else
        format.html { render :edit }
      end
    end

  end

  def destroy
    @civil_service.destroy
    respond_to do |format|
      format.html {
        redirect_to admin_employee_civil_service_eligibilities_path(@employee),
        notice: 'Civil service eligibility was successfully deleted.' 
      }
    end
  end


  private

  def set_employee
    @employee = Employee.find(params[:employee_id])
  end

  def set_civil_service
    @civil_service = @employee.civil_service_eligibilities.find(params[:id])
  end

  def civil_service_params
    params.require(:civil_service_eligibility).permit(:career_service, :rating, :date_of_exam, :place_of_exam, :license_number, :date_release_of_license)
    # :employee_id
  end

end