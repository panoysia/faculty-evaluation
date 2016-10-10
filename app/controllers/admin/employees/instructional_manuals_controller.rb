class Admin::Employees::InstructionalManualsController < Admin::ApplicationController

  include CCE::AchievementAndHonor1

  before_action :set_employee
  before_action :set_instructional_manual,
    only: [:edit, :update, :destroy]

  layout 'employee_profile'


  def new
    @instructional_manual = @employee.instructional_manuals.new
  end

  def create
    # render html: params.inspect and return true
    @instructional_manual = @employee.instructional_manuals.new(instructional_manual_params)
    if @instructional_manual.save
      redirect_to admin_employee_achievement_and_honors_1_path,
        notice: 'Instructional manual record was successfully created.'
    else
      render :new
    end    
  end

  def edit
  end  

  def update
    if @instructional_manual.update(instructional_manual_params)
      redirect_to referrer,
        notice: 'Instructional manual record was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @instructional_manual.destroy
    redirect_to referrer,
      notice: 'Instructional manual record was successfully deleted.'
  end


  private

  def instructional_manual_params
    params.require(:instructional_manual).permit(:name, :published_at,
                                              :category, :description)
  end

  def set_employee
    @employee = Employee.find(params[:employee_id])
  end

  def set_instructional_manual
    @instructional_manual = @employee.instructional_manuals.
                              find(params[:id])
  end

end