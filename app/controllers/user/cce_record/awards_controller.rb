class User::CCERecord::AwardsController < User::ApplicationController

  before_action :set_employee
  before_action :set_award, only: [:edit, :update, :destroy]


  def new
    @award = employee.awards.new
  end

  def create
    @award = employee.awards.new(award_params)
    if @award.save
      redirect_to cce_record_path,
        notice: "Award record was successfully created."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @award.update(award_params)
      redirect_to cce_record_path,
        notice: "Award record was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @award.destroy
    redirect_to cce_record_path,
      notice: "Award record was successfully deleted."
  end


  private


  def employee
    @employee = current_user.account
  end

  alias_method :set_employee, :employee


  def set_award
    @award = employee.awards.find(params[:id])
  end

  def award_params
    params.require(:award).permit(:name, :level,
                                  :date_awarded, :description)
  end

end