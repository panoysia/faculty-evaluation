class User::CCERecord::AcademicDegreesController < User::ApplicationController

  before_action :set_employee
  before_action :set_degree, only: [:edit, :update, :destroy]


  def new
    @degree = employee.academic_degrees.new
  end

  def create
  end

  def edit
  end

  def update
    if @degree.update(academic_degree_params)
      redirect_to referrer,
        notice: 'Academic degree record was successfully updated.'
    else
      render :edit
    end    
  end

  def destroy
    @degree.destroy
    redirect_to referrer,
      notice: 'Academic degree record was successfully deleted.'    
  end


  private


  def employee
    @employee = current_user.account
  end

  alias_method :set_employee, :employee


  def set_degree
    @degree = employee.academic_degrees.find(params[:id])
  end

  def academic_degree_params
    params.require(:academic_degree).permit(:institution, :degree,
                                            :degree_type, :start_at,
                                            :end_at, :graduated_at)
  end

end
