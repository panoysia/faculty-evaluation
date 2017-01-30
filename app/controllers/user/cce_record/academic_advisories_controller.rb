class User::CCERecord::AcademicAdvisoriesController < User::ApplicationController

  before_action :set_employee
  before_action :set_advisory, only: [:edit, :update, :destroy]


  def new
    @advisory = employee.academic_advisories.new
  end

  def create
    @advisory = employee.academic_advisories.new(advisory_params)
    if @advisory.save
      redirect_to cce_record_path,
        notice: "Academic advisory record was successfully created."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @advisory.update(advisory_params)
      redirect_to cce_record_path,
        notice: "Academic advisory record was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @advisory.destroy
    redirect_to cce_record_path,
      notice: "Academic advisory record was successfully deleted."
  end


  private


  def employee
    @employee = current_user.account
  end

  alias_method :set_employee, :employee
  

  def set_advisory
    @advisory = employee.academic_advisories.find(params[:id])
  end

  def advisory_params
    params.require(:academic_advisory).
      permit(:title, :nature, :start_at, :end_at)
  end

end
