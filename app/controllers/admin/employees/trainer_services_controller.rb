class Admin::Employees::TrainerServicesController < Admin::ApplicationController

  before_action :set_employee
  before_action :set_service, only: [:edit, :update, :destroy]

  layout 'employee_profile'


  def new
    @service = @employee.trainer_services.new
  end

  def create
    # render html: params.inspect and return true
    @service = @employee.trainer_services.new(service_params)
    if @service.save
      redirect_to admin_employee_expert_services_path,
        notice: 'Trainer service record was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @service.update(service_params)
      redirect_to admin_employee_expert_services_path,
        notice: 'Trainer service record was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @service.destroy
    redirect_to admin_employee_expert_services_path(@employee),
      notice: 'Trainer service record was successfully deleted.'
  end


  private

  def set_employee
    @employee = Employee.find(params[:employee_id])
  end

  def set_service
    @service = @employee.trainer_services.find(params[:id])
  end

  def service_params
    params.require(:trainer_service).permit(:name, :agency,
                                            :start_at, :end_at,
                                            :is_current)
  end

end
