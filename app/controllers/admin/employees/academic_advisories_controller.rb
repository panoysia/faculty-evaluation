class Admin::Employees::AcademicAdvisoriesController < Admin::ApplicationController

  before_action :set_employee
  before_action :set_advisory, only: [:edit, :update, :destroy]

  layout 'employee_profile'


  def new
    @advisory = @employee.academic_advisories.new
  end

  def create
    # render html: params.inspect and return true
    @advisory = @employee.academic_advisories.new(advisory_params)
    if @advisory.save
      redirect_to admin_employee_expert_services_path,
        notice: 'Academic advisory record was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @advisory.update(advisory_params)
      redirect_to admin_employee_expert_services_path,
        notice: 'Academic advisory record was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @advisory.destroy
    redirect_to admin_employee_expert_services_path(@employee),
      notice: 'Academic advisory record was successfully deleted.'
  end


  private

  def set_employee
    @employee = Employee.find(params[:employee_id])
  end

  def set_advisory
    @advisory = @employee.academic_advisories.find(params[:id])
  end

  def advisory_params
    params.require(:academic_advisory).permit(:title, :nature,
                                              :start_at, :end_at)
  end

end
