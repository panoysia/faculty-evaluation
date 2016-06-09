class Admin::EmployeesController < Admin::ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]


  def index
    @employees = Employee.includes(:rank, :specialization).order(last_name: :asc, first_name: :asc)
    # @employees = Employee.all
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
        format.html { redirect_to [:edit, :admin, @employee], notice: 'Faculty was successfully created. Please provide additional data in the fields below.' }
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
        format.html { redirect_to [:admin, @employee], notice: 'Faculty was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to admin_employees_path, notice: 'Faculty was successfully deleted.' }
    end
  end


  private

  def set_employee
    @employee = Employee.includes(:rank, :specialization).find(params[:id])
    # @employee = Employee.find(params[:id])
  end

  def employee_params_for_create
    params.require(:employee).permit(:first_name, :last_name, 
      user_account_attributes: [:username, :password])
  end
  
  def employee_params_for_update
    params.require(:employee).permit(:first_name, :last_name, :middle_name, :name_extension, :designation, :gender, :civil_status, :birth_date, :citizenship, :height, :weight, :blood_type, :gsis_no, :pagibig_no, :philhealth_no, :sss_no, :r_address, :r_zip_code, :r_telephone_no, :p_address, :p_zip_code, :p_telephone_no, :email_address, :cellphone_no, :agency_employee_no, :tin, :academic_ranking_id, :hired_date, :picture, :specialization_id)
  end
end