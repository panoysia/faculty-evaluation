class Admin::Employees::LeavesController < Admin::ApplicationController

  before_action :set_employee
  before_action :set_leave, only: [:show, :edit, :update, :destroy]

  layout 'employee_profile'


  def index
    @leaves = @employee.leaves
  end

  def show
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
          notice: 'Leave was successfully created.'
        }
      else
        format.html { render :edit }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|    
      if @leave.update(leave_params)
        format.html {
          redirect_to edit_admin_employee_leave_path(@employee, @leave),
          notice: 'Leave was successfully updated.'
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
        notice: 'Leave was successfully deleted.' 
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
    params.require(:leave).permit(:filed_at, :start_at,
      :end_at)
  end
  
end