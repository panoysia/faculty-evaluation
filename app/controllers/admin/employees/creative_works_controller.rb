class Admin::Employees::CreativeWorksController < Admin::ApplicationController

  include CCE::AchievementAndHonor1

  before_action :set_employee
  before_action :set_creative_work, only: [:edit, :update, :destroy]

  layout 'employee_profile'


  def new
    @creative_work = @employee.creative_works.new
  end

  def create
    # render html: params.inspect and return true
    @creative_work = @employee.creative_works.new(creative_work_params)
    if @creative_work.save
      redirect_to admin_employee_achievement_and_honors_1_path, 
        notice: 'Creative work record was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @creative_work.update(creative_work_params)
      redirect_to referrer,
        notice: 'Creative work record was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @creative_work.destroy
    redirect_to referrer,
      notice: 'Creative work record was successfully deleted.'
  end


  private


  def creative_work_params
    params.require(:creative_work).permit(:name, :patent_no,
                                          :competitiveness,
                                          :year_patented, :description,
                                          criterium_ids: [])
  end

  def set_creative_work
    @creative_work = @employee.creative_works.find(params[:id])
  end

  def set_employee
    @employee = Employee.find(params[:employee_id])
  end

end