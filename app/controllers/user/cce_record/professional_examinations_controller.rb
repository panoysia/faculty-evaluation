class User::CCERecord::ProfessionalExaminationsController < User::ApplicationController

  before_action :set_employee
  before_action :set_examination, only: [:edit, :update, :destroy]


  def new
    @examination = employee.professional_examinations.new
  end

  def create
    @examination = employee.professional_examinations.
                    new(examination_params)
    if @examination.save
      redirect_to cce_record_path,
        notice: "Prof. Examination record was successfully created."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @examination.update(examination_params)
      redirect_to cce_record_path,
        notice: "Prof. Examination record was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @examination.destroy
    redirect_to cce_record_path,
      notice: "Prof. Examination record was successfully deleted."
  end


  private


  def employee
    @employee = current_user.account
  end

  alias_method :set_employee, :employee


  def examination_params
    params.require(:professional_examination).
            permit(:title, :agency_name, :date_passed, :category)
  end

  def set_examination
    @examination = employee.professional_examinations.find(params[:id])
  end

end
