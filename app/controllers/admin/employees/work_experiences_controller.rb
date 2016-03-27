class Admin::Employees::WorkExperiencesController < Admin::ApplicationController

  before_action :set_employee
  before_action :set_work_experience, only: [:show, :edit, :update, :destroy]

  layout 'employee_profile'


  def index
    @work_experiences = @employee.work_experiences
  end

  def show
  end

  def new
    @work_experience = @employee.work_experiences.new
  end

  def create
    @work_experience = @employee.work_experiences.new(work_experience_params)
    respond_to do |format|
      if @work_experience.save
        format.html {
          redirect_to admin_employee_work_experiences_path(@employee),
          notice: 'Work experience was successfully created.'
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
      if @work_experience.update(work_experience_params)
        format.html {
          redirect_to edit_admin_employee_work_experience_path(@employee, @work_experience),
          notice: 'Work experience was successfully updated.'
        }
      else
        format.html { render :edit }
      end
    end    
  end

  def destroy
    @work_experience.destroy
    respond_to do |format|
      format.html {
        redirect_to admin_employee_work_experiences_path(@employee),
        notice: 'Work experience was successfully deleted.' 
      }      
    end
  end


  private

  def set_employee
    @employee = Employee.find(params[:employee_id])
  end

  def set_work_experience
    @work_experience = @employee.work_experiences.find(params[:id]) 
  end

  def work_experience_params
    params.require(:work_experience).permit(:position_title, :company, :start_at, :end_at, :monthly_salary, :salary_grade, :status_of_appointment, :is_gov_service)
  end
end