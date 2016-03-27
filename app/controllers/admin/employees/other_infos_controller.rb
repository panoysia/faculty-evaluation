class Admin::Employees::OtherInfosController < Admin::ApplicationController

  before_action :set_employee
  before_action :set_other_info, only: [:show, :edit, :update, :destroy]

  layout 'employee_profile'


  def index
    @other_infos = @employee.other_infos
  end

  def show
  end

  def new
    @other_info = @employee.other_infos.new
  end

  def create
    @other_info = @employee.other_infos.new(other_info_params)
    respond_to do |format|
      if @other_info.save
        format.html {
          redirect_to admin_employee_other_infos_path(@employee),
          notice: 'Other information was successfully created.'
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
      if @other_info.update(other_info_params)
        format.html {
          redirect_to edit_admin_employee_other_info_path(@employee, @other_info),
          notice: 'Other information was successfully updated.'
        }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @other_info.destroy
    respond_to do |format|
      format.html {
        redirect_to admin_employee_other_infos_path(@employee),
        notice: 'Other information was successfully deleted.' 
      }
    end

  end


  private

  def set_employee
    @employee = Employee.find(params[:employee_id])
  end

  def set_other_info
    @other_info = @employee.other_infos.find(params[:id])  
  end

  def other_info_params
    params.require(:other_info).permit(:context, :info)
  end

end