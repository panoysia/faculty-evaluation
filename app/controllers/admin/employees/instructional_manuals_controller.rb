class Admin::Employees::InstructionalManualsController < Admin::ApplicationController

  before_action :set_employee
  before_action :set_instructional_manual, only: [:show, :edit, :update, :destroy]

  layout 'employee_profile'


  def new
    @instructional_manual = @employee.instructional_manuals.new
  end

  def create
    render html: params.inspect and return true
    @instructional_manual = @employee.instructional_manuals.new(instructional_manual_params)
    if @instructional_manual.save
      redirect_to admin_employee_professional_developments_path(
                    anchor: 'instructional-manuals'),
      notice: 'Instructional manual was successfully created.'
    else
      render :new
    end    
  end

  def show
  end

  def destroy
    @instructional_manual.destroy
    redirect_to admin_employee_professional_developments_path(
                  @employee,
                  anchor: 'instructional-manuals'),
    notice: 'Instructional manual was successfully deleted.'
  end


  private

  def set_employee
    @employee = Employee.find(params[:employee_id])
  end

  def set_instructional_manual
    @instructional_manual = @employee.instructional_manuals.
                              find(params[:id])
  end

  def instructional_manual_params
    params.require(:instructional_manual).permit(:name, :level,
      :published_at, :category)
  end

end