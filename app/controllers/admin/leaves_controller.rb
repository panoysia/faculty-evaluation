class Admin::LeavesController < Admin::ApplicationController
  before_action :set_leave, only: [:show, :edit, :update, :destroy]


  def index
    # @leaves = Leave.includes(:employee).order(filed_at: :desc)
    # @leaves = Leave.includes(:employee).latest(15)
    # @employees = Employee.order(last_name: :asc)
    # @employees = Employee.select(:id, :first_name, :last_name, :middle_name).order(last_name: :asc)
  end

  def show
  end

  def new
    @leave = Leave.new
  end

  def create
    @leave = Leave.new(leave_params)
  
    respond_to do |format|
      if @leave.save
        format.html { redirect_to [:admin, @leave],
          notice: 'Leave was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @leave.update(leave_params)
        format.html { redirect_to [:admin, @leave], notice: 'Leave was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @leave.destroy
    respond_to do |format|
      format.html { redirect_to admin_leaves_path, notice: 'Leave was successfully deleted.' }
    end
  end


  private

  def set_leave
    @leave = Leave.find(params[:id])
  end  

  def leave_params
    params.require(:leave).permit(:filed_at, :start_at, :end_at, :length, :employee_id, :academic_year_id)
  end
      
end