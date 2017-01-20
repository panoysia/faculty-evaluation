class Admin::Employees::LeaveServiceCreditsController < Admin::ApplicationController

  before_action :set_employee
  before_action :set_leave_service_credit,
                only: [:edit, :update, :destroy]

  layout "employee_profile"


  def new
    @credit = @employee.leave_service_credits.new
  end

  def create
    # render html: params.inspect and return true
    @credit = @employee.leave_service_credits.new(credit_params)
    if @credit.save
      redirect_to admin_employee_leaves_path(@employee),
        notice: "Leave service credit was successfuly created."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @credit.update(credit_params)
      redirect_to admin_employee_leaves_path(@employee),
        notice: "Leave service credit record was successfully updated."
    else
      render :edit
    end    
  end

  def destroy
    @credit.destroy
    redirect_to admin_employee_leaves_path(@employee),
      notice: "Leave service credit record was successfully deleted."
  end


  private

  def credit_params
    params.require(:leave_service_credit).
      permit(:academic_year_id, :no_of_days, :valid_at,
              :expire_at, :description)
  end

  def set_employee
    @employee = Employee.find(params[:employee_id])
  end

  def set_leave_service_credit
    @credit = @employee.leave_service_credits.find(params[:id])
  end
  
end
