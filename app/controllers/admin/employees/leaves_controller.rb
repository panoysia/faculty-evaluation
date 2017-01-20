class Admin::Employees::LeavesController < Admin::ApplicationController

  before_action :set_employee
  before_action :set_leave, only: [:edit, :update, :destroy]

  layout "employee_profile"


  def index
    @leaves = @employee.leaves.
                includes(:academic_year).
                order(filed_at: :desc)

    @credits = @employee.leave_service_credits.
                  includes(:academic_year).
                  order(expire_at: :desc)

    query = Employee::LeaveSummaryPerAcademicYearQuery.new(@employee)
    @leave_summary = query.result || []
  end

  def new
    @leave = @employee.leaves.new
  end

  def create
    @leave = @employee.leaves.new(leave_params)
    respond_to do |format|
      if @leave.save
        format.html {
          redirect_to admin_employee_leaves_path(@employee),
          notice: "Leave was successfully created."
        }
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
        format.html {
          redirect_to admin_employee_leaves_path(@employee),
          notice: "Leave record was successfully updated."
        }
      else
        format.html { render :edit }
      end
    end    
  end

  def destroy
    @leave.destroy
    respond_to do |format|
      format.html {
        redirect_to admin_employee_leaves_path(@employee),
        notice: "Leave record was successfully deleted." 
      }      
    end
  end


  private


  def set_employee
    @employee = Employee.find(params[:employee_id])
  end

  def set_leave
    @leave = @employee.leaves.find(params[:id]) 
  end

  def leave_params
    params.require(:leave).permit(:academic_year_id, :filed_at,
                                  :start_at, :end_at)
  end

end