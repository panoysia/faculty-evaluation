class Admin::Employees::AwardsController < Admin::ApplicationController

  before_action :set_employee
  before_action :set_award, only: [:edit, :update, :destroy]

  layout 'employee_profile'


  def index
    @awards = @employee.awards
  end

  def new
    @award = @employee.awards.new
  end

  def create
    # render html: params.inspect and return true
    @award = @employee.awards.new(award_params)
    if @award.save
      redirect_to admin_employee_achievement_and_honors_2_path,
        notice: 'Award record was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @award.update(award_params)
      redirect_to admin_employee_achievement_and_honors_2_path,
        notice: 'Award record was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @award.destroy
    redirect_to admin_employee_achievement_and_honors_2_path,
      notice: 'Award record was successfully deleted.'     
  end


  private

  def set_employee
    @employee = Employee.find(params[:employee_id])
  end

  def set_award
    @award = @employee.awards.find(params[:id])
  end

  def award_params
    params.require(:award).permit(:name, :level,
                                  :date_awarded, :description)
  end

end
