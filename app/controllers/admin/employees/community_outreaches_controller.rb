class Admin::Employees::CommunityOutreachesController < Admin::ApplicationController

  before_action :set_employee
  before_action :set_outreach, only: [:edit, :update, :destroy]

  layout 'employee_profile'


  def index
    @outreaches = @employee.community_outreaches
  end

  def new
    @outreach = @employee.community_outreaches.new
  end

  def create
    # render html: params.inspect and return true
    @outreach = @employee.community_outreaches.
                    new(outreach_params)
    if @outreach.save
      redirect_to admin_employee_achievement_and_honors_2_path,
        notice: 'Community outreach record was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @outreach.update(outreach_params)
      redirect_to admin_employee_achievement_and_honors_2_path,
        notice: 'Community outreach record was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @outreach.destroy
    redirect_to admin_employee_achievement_and_honors_2_path,
      notice: 'Community outreach record was successfully deleted.'     
  end


  private

  def set_employee
    @employee = Employee.find(params[:employee_id])
  end

  def set_outreach
    @outreach = @employee.community_outreaches.find(params[:id])
  end

  def outreach_params
    params.require(:community_outreach).permit(:project_name,
                                                :participation,
                                                :sponsoring_agency,
                                                :start_at, :end_at)
  end

end
