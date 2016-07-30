class Admin::Employees::CreativeWorksController < Admin::ApplicationController

  before_action :set_employee
  before_action :set_creative_work, only: [:show, :edit, :update, :destroy]

  layout 'employee_profile'


  def new
    @creative_work = @employee.creative_works.new
  end

  def create
    render html: params.inspect and return true
    @creative_work = @employee.creative_works.new(creative_work_params)
    if @creative_work.save
      redirect_to admin_employee_professional_developments_path(
                    anchor: 'creative-works'),
      notice: 'Creative work was successfully created.'
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
    @creative_work.destroy
    redirect_to admin_employee_professional_developments_path(
                  @employee,
                  anchor: 'creative-works'),
    notice: 'Creative work was successfully deleted.'     
  end


  private

  def set_employee
    @employee = Employee.find(params[:employee_id])
  end

  def set_creative_work
    @creative_work = @employee.creative_works.find(params[:id])
  end

  def creative_work_params
    params.require(:creative_work).permit(:patent_no, :year_patented,
                                      :description)
  end

end