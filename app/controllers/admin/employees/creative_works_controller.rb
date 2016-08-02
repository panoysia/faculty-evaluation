class Admin::Employees::CreativeWorksController < Admin::ApplicationController

  before_action :set_employee
  before_action :set_creative_work, only: [:show, :edit, :update, :destroy]

  layout 'employee_profile'


  def new
    @creative_work = @employee.creative_works.new
  end

  def create
    # render html: params.inspect and return true
    @creative_work = @employee.creative_works.new(creative_work_params)
    if @creative_work.save
      redirect_to admin_employee_professional_developments_path,
        notice: 'Creative work record was successfully created.'
    else
      render :new
    end
  end


  def show
  end

  def edit
  end

  def update
    if @creative_work.update(creative_work_params)
      redirect_to admin_employee_professional_developments_path,
        notice: 'Creative work record was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @creative_work.destroy
    redirect_to admin_employee_professional_developments_path(@employee),
      notice: 'Creative work record was successfully deleted.'
  end


  private

  def set_employee
    @employee = Employee.find(params[:employee_id])
  end

  def set_creative_work
    @creative_work = @employee.creative_works.find(params[:id])
  end

  def creative_work_params
    params.require(:creative_work).permit(:name, :patent_no, :criteria, :competitiveness, :year_patented, :description, criterium_ids: [])
  end

end