class Admin::Employees::ProfessionalWorkExperiencesController < Admin::ApplicationController

  before_action :set_employee
  before_action :set_work_experience, only: [:edit, :update, :destroy]

  layout 'employee_profile'


  def new
    @work_experience = @employee.professional_work_experiences.new
  end

  def create
    # render html: params.inspect and return true
    @work_experience = @employee.professional_work_experiences.
                          new(experience_params)
    if @work_experience.save
      redirect_to admin_employee_work_experiences_path,
        notice: 'Professional work experience record was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @work_experience.update(experience_params)
      redirect_to admin_employee_work_experiences_path,
        notice: 'Professional work experience record was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @work_experience.destroy
    redirect_to admin_employee_work_experiences_path(@employee),
      notice: 'Professional work experience record was successfully deleted.'
  end


  private

  def set_employee
    @employee = Employee.find(params[:employee_id])
  end

  def set_work_experience
    @work_experience = @employee.professional_work_experiences.
                          find(params[:id])
  end

  def experience_params
    params.require(:professional_work_experience).
      permit(:start_at,:end_at, :position, :institution)
  end

end  
