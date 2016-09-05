class Admin::Employees::AcademicDegreesController < Admin::ApplicationController

  before_action :set_employee
  before_action :set_degree, only: [:edit, :update, :destroy]

  layout 'employee_profile'


  def new
    @degree = @employee.academic_degrees.new
  end

  def create
    # render html: params.inspect and return true
    @degree = @employee.academic_degrees.new(academic_degree_params)
    if @degree.save
      redirect_to admin_employee_educations_path,
        notice: 'Academic degree record was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @degree.update(academic_degree_params)
      redirect_to admin_employee_educations_path,
        notice: 'Academic degree record was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @degree.destroy
    redirect_to admin_employee_educations_path(@employee),
      notice: 'Academic degree record was successfully deleted.'
  end


  private

  def set_employee
    @employee = Employee.find(params[:employee_id])
  end

  def set_degree
    @degree = @employee.academic_degrees.find(params[:id])
  end

  def academic_degree_params
    params.require(:academic_degree).permit(:institution, :degree,
                                            :degree_type, :start_at,
                                            :end_at, :graduated_at)
  end

end  
