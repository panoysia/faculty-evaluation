class User::CCERecord::AdditionalDegreesController < User::ApplicationController

  before_action :set_employee
  before_action :set_degree, only: [:edit, :update, :destroy]


  def new
    @degree = employee.additional_degrees.new
  end

  def create
    @degree = employee.additional_degrees.new(degree_params)
    if @degree.save
      redirect_to cce_record_path,
        notice: "Additional degree record was successfully created."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @degree.update(degree_params)
      redirect_to cce_record_path,
        notice: "Additional degree record was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @degree.destroy
    redirect_to cce_record_path,
      notice: "Additional degree record was successfully deleted."
  end


  private


  def employee
    @employee = current_user.account
  end

  alias_method :set_employee, :employee


  def set_degree
    @degree = employee.additional_degrees.find(params[:id])
  end

  def degree_params
    params.require(:additional_degree).permit(:institution, :degree,
                                              :degree_type, :start_at,
                                              :end_at, :graduated_at)
  end

end
