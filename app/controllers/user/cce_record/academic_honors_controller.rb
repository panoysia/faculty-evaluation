class User::CCERecord::AcademicHonorsController < User::ApplicationController

  before_action :set_employee
  before_action :set_academic_honor, only: [:edit, :update, :destroy]


  def new
    @academic_honor = employee.academic_honors.new
  end

  def create
    @academic_honor = employee.academic_honors.new(academic_honor_params)
    if @academic_honor.save
      redirect_to cce_record_path,
        notice: "Academic honor record was successfully created."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @academic_honor.update(academic_honor_params)
      redirect_to cce_record_path,
        notice: "Academic honor record was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @academic_honor.destroy
    redirect_to cce_record_path,
      notice: "Academic honor record was successfully deleted."
  end


  private


  def employee
    @employee = current_user.account
  end

  alias_method :set_employee, :employee


  def set_academic_honor
    @academic_honor = employee.academic_honors.find(params[:id])
  end

  def academic_honor_params
    params.require(:academic_honor).permit(:award, :degree_type,
                                          :honor_type, :school,
                                            :date_awarded)
  end

end