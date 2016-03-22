class Admin::EmployeesController < Admin::ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]


  def index
    @employees = Employee.all
  end

  def show
    render layout: 'employee_profile'
  end

  def new
    @employee = Employee.new
    @employee.build_user_account
  end

  def create
    @employee = Employee.new(employee_params_for_create)

    respond_to do |format|
      if @employee.save
        format.html { redirect_to [:admin, @employee], notice: 'Employee was successfully created.' }
      else
        @employee.build_user_account
        format.html { render :new }
      end
    end
  end   # def create

  def edit
  end

  def update
    respond_to do |format|
      if @employee.update(employee_params_for_update)
        format.html { redirect_to [:admin, @employee], notice: 'Employee was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to admin_employees_path, notice: 'Employee was successfully deleted.' }
    end
  end


  private

  def set_employee
    @employee = Employee.find(params[:id])
  end

  def employee_params_for_create
    params.require(:employee).permit(:first_name, :last_name, 
      user_account_attributes: [:username, :password])
  end
  
  def employee_params_for_update
    params.require(:employee).permit(:first_name, :last_name)
  end
end