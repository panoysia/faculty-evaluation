class User::CCERecord::AdditionalCreditsController < User::ApplicationController

  before_action :set_employee
  before_action :set_credit, only: [:edit, :update, :destroy]


  def new
    @credit = employee.additional_credits.new
  end

  def create
    @credit = employee.additional_credits.new(credit_params)
    if @credit.save
      redirect_to cce_record_path,
        notice: "Additional credit record was successfully created."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @credit.update(credit_params)
      redirect_to cce_record_path,
        notice: "Additional credit record was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @credit.destroy
    redirect_to cce_record_path,
      notice: "Additional credit record was successfully deleted."
  end


  private


  def employee
    @employee = current_user.account
  end

  alias_method :set_employee, :employee


  def set_credit
    @credit = employee.additional_credits.find(params[:id])
  end

  def credit_params
    params.require(:additional_credit).permit(:institution, :degree,
                                              :degree_type, :no_of_units)
  end

end
