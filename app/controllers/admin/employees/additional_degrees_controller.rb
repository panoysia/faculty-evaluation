class Admin::Employees::AdditionalDegreesController < Admin::ApplicationController

  before_action :set_employee
  before_action :set_degree, only: [:edit, :update, :destroy]

  layout 'employee_profile'


  def new
    @degree = @employee.additional_degrees.new
  end

  def create
    # render html: params.inspect and return true
    @degree = @employee.additional_degrees.new(degree_params)
    if @degree.save
      redirect_to admin_employee_educations_path,
        notice: 'Additional degree record was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @degree.update(degree_params)
      redirect_to admin_employee_educations_path,
        notice: 'Additional degree record was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @degree.destroy
    redirect_to admin_employee_educations_path(@employee),
      notice: 'Additional degree record was successfully deleted.'
  end


  private

  def set_employee
    @employee = Employee.find(params[:employee_id])
  end

  def set_degree
    @degree = @employee.additional_degrees.find(params[:id])
  end

  def degree_params
    params.require(:additional_degree).permit(:institution, :degree,
                                              :degree_type, :start_at,
                                              :end_at, :graduated_at)
  end

end