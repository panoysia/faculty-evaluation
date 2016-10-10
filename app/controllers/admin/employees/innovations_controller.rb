class Admin::Employees::InnovationsController < Admin::ApplicationController

  include CCE::AchievementAndHonor1

  before_action :set_employee
  before_action :set_innovation, only: [:edit, :update, :destroy]

  layout 'employee_profile'


  def new
    @innovation = @employee.innovations.new
  end

  def create
    # render html: params.inspect and return true
    @innovation = @employee.innovations.new(innovation_params)
    if @innovation.save
      redirect_to admin_employee_achievement_and_honors_1_path,
        notice: 'Innovation record was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @innovation.update(innovation_params)
      redirect_to referrer,
        notice: 'Innovation record was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @innovation.destroy
    redirect_to referrer,
      notice: 'Innovation record was successfully deleted.'
  end


  private


  def innovation_params
    params.require(:innovation).permit(:name, :patent_no,
                                      :year_patented, :description,
                                      :competitiveness, criterium_ids: [])
  end

  def set_employee
    @employee = Employee.find(params[:employee_id])
  end

  def set_innovation
    @innovation = @employee.innovations.find(params[:id])
  end

end
