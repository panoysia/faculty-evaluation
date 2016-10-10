class Admin::Employees::AdminWorkExperiencesController < Admin::ApplicationController

  include CCE::WorkExperience

  before_action :set_employee
  before_action :set_work_experience, only: [:edit, :update, :destroy]

  layout 'employee_profile'


  def new
    @work_experience = @employee.admin_work_experiences.new
  end

  def create
    # render html: params.inspect and return true
    @work_experience = @employee.admin_work_experiences.
                          new(experience_params)
    if @work_experience.save
      redirect_to admin_employee_work_experiences_path,
        notice: 'Administrative work experience record was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @work_experience.update(experience_params)
      redirect_to referrer,
        notice: 'Administrative work experience record was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @work_experience.destroy
    redirect_to referrer,
      notice: 'Administrative work experience record was successfully deleted.'
  end


  private


  def experience_params
    params.require(:admin_work_experience).permit(:start_at, :end_at,
                                                :position, :institution)
  end

  def set_employee
    @employee = Employee.find(params[:employee_id])
  end

  def set_work_experience
    @work_experience = @employee.admin_work_experiences.
                          find(params[:id])
  end

end  
