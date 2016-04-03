class Admin::LeaveServiceCreditsController < Admin::ApplicationController

  before_action :set_leave_service_credit, only: [:show, :edit, :update, :destroy]


  def index
    @leave_service_credits = LeaveServiceCredit.all
    # @leave_service_credits = leaveServiceCredit.includes(:employee)
  end

  def show
  end

  def new
    @leave_service_credit = LeaveServiceCredit.new
  end

  def create
    @leave_service_credit = LeaveServiceCredit.new(leave_service_credit_params)
  
    respond_to do |format|
      if @leave_service_credit.save
        format.html { redirect_to admin_leave_service_credits_path,
          notice: 'Leave service credit was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @leave_service_credit.update(leave_service_credit_params)
        format.html { redirect_to admin_leave_service_credits_path, 
          notice: 'Leave service credit was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @leave_service_credit.destroy
    respond_to do |format|
      format.html { redirect_to admin_leave_service_credits_path, 
        notice: 'Leave service credit was successfully deleted.' }
    end
  end


  private

  def set_leave_service_credit
    @leave_service_credit = leaveServiceCredit.find(params[:id])
  end  

  def leave_service_credit_params
    params.require(:leave_service_credit).permit(:employee_id, :description, :valid_at, :expire_at)
  end
  
end