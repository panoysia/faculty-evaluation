class Admin::Employees::InnovationsController < Admin::ApplicationController

  before_action :set_employee
  before_action :set_innovation, only: [:show, :edit, :update, :destroy]

  layout 'employee_profile'


  def new
    @innovation = @employee.innovations.new
  end

  def create
    render html: params.inspect and return true
    @innovation = @employee.innovations.new(innovation_params)
    if @innovation.save
      redirect_to admin_employee_professional_developments_path(
                    anchor: 'innovations'),
      notice: 'Innovation was successfully created.'
    else
      render :new
    end
  end


  def show
  end

  def edit
  end

  def update
  end

  def destroy
    @innovation.destroy
    redirect_to admin_employee_professional_developments_path(
                  @employee,
                  anchor: 'innovations'),
    notice: 'Innovation was successfully deleted.'     
  end


  private

  def set_employee
    @employee = Employee.find(params[:employee_id])
  end

  def set_innovation
    @innovation = @employee.innovations.find(params[:id])
  end

  def innovation_params
    params.require(:innovation).permit(:patent_no, :nature,
      :year_patented, :description)
  end

end
