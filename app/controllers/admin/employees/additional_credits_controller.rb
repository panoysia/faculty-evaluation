class Admin::Employees::AdditionalCreditsController < Admin::ApplicationController

  before_action :set_employee
  before_action :set_credit, only: [:edit, :update, :destroy]

  layout 'employee_profile'


  def new
    @credit = @employee.additional_credits.new
  end

  def create
    # render html: params.inspect and return true
    @credit = @employee.additional_credits.new(credit_params)
    if @credit.save
      redirect_to admin_employee_educations_path,
        notice: 'Additional credit record was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @credit.update(credit_params)
      redirect_to admin_employee_educations_path,
        notice: 'Additional credit record was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @credit.destroy
    redirect_to admin_employee_educations_path(@employee),
      notice: 'Additional credit record was successfully deleted.'
  end


  private

  def set_employee
    @employee = Employee.find(params[:employee_id])
  end

  def set_credit
    @credit = @employee.additional_credits.find(params[:id])
  end

  def credit_params
    params.require(:additional_credit).permit(:institution, :degree,
                                              :no_of_units)
  end

end