class User::CCERecord::CommunityOutreachesController < User::ApplicationController

  before_action :set_employee
  before_action :set_outreach, only: [:edit, :update, :destroy]


  def new
    @outreach = employee.community_outreaches.new
  end

  def create
    @outreach = employee.community_outreaches.new(outreach_params)
    if @outreach.save
      redirect_to cce_record_path,
        notice: "Community outreach record was successfully created."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @outreach.update(outreach_params)
      redirect_to cce_record_path,
        notice: "Community outreach record was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @outreach.destroy
    redirect_to cce_record_path,
      notice: "Community outreach record was successfully deleted."
  end


  private


  def employee
    @employee = current_user.account
  end

  alias_method :set_employee, :employee


  def outreach_params
    params.require(:community_outreach).permit(:project_name,
                                                :participation,
                                                :sponsoring_agency,
                                                :start_at, :end_at)
  end

  def set_outreach
    @outreach = employee.community_outreaches.find(params[:id])
  end

end
