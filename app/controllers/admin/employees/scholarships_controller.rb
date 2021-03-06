class Admin::Employees::ScholarshipsController < Admin::ApplicationController

  include CCE::AchievementAndHonor2

  before_action :set_employee
  before_action :set_scholarship, only: [:edit, :update, :destroy]

  layout 'employee_profile'


  def index
    @scholarships = @employee.scholarships
  end

  def new
    @scholarship = @employee.scholarships.new
  end

  def create
    # render html: params.inspect and return true
    @scholarship = @employee.scholarships.new(scholarship_params)
    if @scholarship.save
      redirect_to admin_employee_achievement_and_honors_2_path,
        notice: 'Scholarship record was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @scholarship.update(scholarship_params)
      redirect_to referrer,
        notice: 'Scholarship record was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @scholarship.destroy
    redirect_to referrer,
      notice: 'Scholarship record was successfully deleted.'     
  end


  private


  def scholarship_params
    params.require(:scholarship).permit(:title, :sponsoring_agency,
                                        :date_granted, :scholarship_type,
                                        :degree_type)
  end

  def set_employee
    @employee = Employee.find(params[:employee_id])
  end

  def set_scholarship
    @scholarship = @employee.scholarships.find(params[:id])
  end

end
