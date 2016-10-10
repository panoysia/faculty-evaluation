class Admin::Employees::ProfessionalExaminationsController < Admin::ApplicationController

  include CCE::AchievementAndHonor2

  before_action :set_employee
  before_action :set_examination, only: [:edit, :update, :destroy]

  layout 'employee_profile'


  def index
    @examinations = @employee.professional_examinations
  end

  def new
    @examination = @employee.professional_examinations.new
  end

  def create
    # render html: params.inspect and return true
    @examination = @employee.professional_examinations.
                    new(examination_params)
    if @examination.save
      redirect_to admin_employee_achievement_and_honors_2_path,
        notice: 'Prof. Examination record was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @examination.update(examination_params)
      redirect_to referrer,
        notice: 'Prof. Examination record was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @examination.destroy
    redirect_to referrer,
      notice: 'Prof. Examination record was successfully deleted.'     
  end


  private


  def examination_params
    params.require(:professional_examination).permit(:title, :agency_name,
                                            :date_passed, :category)
  end
  
  def set_employee
    @employee = Employee.find(params[:employee_id])
  end

  def set_examination
    @examination = @employee.professional_examinations.find(params[:id])
  end

end
