class User::CCERecord::ProfessionalServicesController < User::ApplicationController

  before_action :set_employee
  before_action :set_service, only: [:edit, :update, :destroy]


  def new
    @service = employee.professional_services.new
  end

  def create
    @service = employee.professional_services.new(service_params)
    if @service.save
      redirect_to cce_record_path,
        notice: "Prof. service record was successfully created."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @service.update(service_params)
      redirect_to cce_record_path,
        notice: "Prof. service record was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @service.destroy
    redirect_to cce_record_path,
      notice: "Prof. service record was successfully deleted."
  end


  private


  def employee
    @employee = current_user.account
  end

  alias_method :set_employee, :employee


  def set_service
    @service = employee.professional_services.find(params[:id])
  end

  def service_params
    params.require(:professional_service).
      permit(:title, :service_type, :level, :nature_of_participation,
              :sponsoring_agency, :start_at, :end_at)
  end

end
