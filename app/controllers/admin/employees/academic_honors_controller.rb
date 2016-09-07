class Admin::Employees::AcademicHonorsController < Admin::ApplicationController

  before_action :set_employee
  before_action :set_academic_honor, only: [:edit, :update, :destroy]

  layout 'employee_profile'


  def index
    @academic_honors = @employee.academic_honors
  end

  def new
    @academic_honor = @employee.academic_honors.new
  end

  def create
    # render html: params.inspect and return true
    @academic_honor = @employee.academic_honors.new(academic_honor_params)
    if @academic_honor.save
      redirect_to admin_employee_achievement_and_honors_2_path,
        notice: 'Academic honor record was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @academic_honor.update(academic_honor_params)
      redirect_to admin_employee_achievement_and_honors_2_path,
        notice: 'Academic honor record was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @academic_honor.destroy
    redirect_to admin_employee_achievement_and_honors_2_path,
      notice: 'Academic honor record was successfully deleted.'     
  end


  private

  def set_employee
    @employee = Employee.find(params[:employee_id])
  end

  def set_academic_honor
    @academic_honor = @employee.academic_honors.find(params[:id])
  end

  def academic_honor_params
    params.require(:academic_honor).permit(:award, :degree_type,
                                          :honor_type, :school,
                                            :date_awarded)
  end

end
