class Admin::Employees::EducationsController < Admin::ApplicationController
  
  before_action :set_employee
  before_action :set_education, only: [:show, :edit, :update, :destroy]

  layout 'employee_profile'


  def index
    @educations = @employee.educations
  end

  def show
  end

  def new
    @education = @employee.educations.new
  end

  def create
    @education = @employee.educations.new(education_params)
    respond_to do |format|
      if @education.save
        format.html {
          redirect_to admin_employee_educations_path(@employee),
          notice: 'Education was successfully created.'
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
      if @education.update(education_params)
        format.html {
          redirect_to edit_admin_employee_education_path(@employee, @education),
          notice: 'Education was successfully updated.'
        }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @education.destroy
    respond_to do |format|
      format.html {
        redirect_to admin_employee_educations_path(@employee),
        notice: 'Education was successfully deleted.' 
      }
    end
  end


  private

  def set_employee
    @employee = Employee.find(params[:employee_id])
  end

  def set_education
    @education = @employee.educations.find(params[:id])
  end

  def education_params
    params.require(:education).permit(:level, :school_name, :degree_course, :grade_units, :graduated_at, :start_at, :end_at, :honors_received, :is_recent)
  end

end