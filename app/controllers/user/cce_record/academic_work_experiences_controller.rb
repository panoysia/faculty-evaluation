class User::CCERecord::AcademicWorkExperiencesController < User::ApplicationController

  before_action :set_employee
  before_action :set_work_experience, only: [:edit, :update, :destroy]


  def new
    @work_experience = employee.academic_work_experiences.new
  end

  def create
    @work_experience = employee.academic_work_experiences.
                          new(experience_params)
    if @work_experience.save
      redirect_to cce_record_path,
        notice: "Academic work experience record was successfully created."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @work_experience.update(experience_params)
      redirect_to cce_record_path,
        notice: "Academic work experience record was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @work_experience.destroy
    redirect_to cce_record_path,
      notice: "Academic work experience record was successfully deleted."
  end


  private


  def employee
    @employee = current_user.account
  end

  alias_method :set_employee, :employee


  def set_work_experience
    @work_experience = employee.academic_work_experiences.
                          find(params[:id])
  end

  def experience_params
    params.require(:academic_work_experience).permit(:start_at, :end_at,
                                                :position, :institution,
                                                :institution_type)
  end

end
