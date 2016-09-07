class Admin::Employees::InventionsController < Admin::ApplicationController

  before_action :set_employee
  before_action :set_invention, only: [:edit, :update, :destroy]

  layout 'employee_profile'


  def new
    @invention = @employee.inventions.new
  end

  def create
    # render html: params.inspect and return true
    @invention = @employee.inventions.new(invention_params)
    if @invention.save
      redirect_to admin_employee_achievement_and_honors_1_path,
        notice: 'Invention record was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @invention.update(invention_params)
      redirect_to admin_employee_achievement_and_honors_1_path,
        notice: 'Invention record was successfully updated.'      
    else
      render :edit
    end
  end

  def destroy
    @invention.destroy
    redirect_to admin_employee_achievement_and_honors_1_path,
      notice: 'Invention record was successfully deleted.'
  end


  private

  def set_employee
    @employee = Employee.find(params[:employee_id])
  end

  def set_invention
    @invention = @employee.inventions.find(params[:id])
  end

  def invention_params
    params.require(:invention).permit(:name, :patent_no, :year_patented,
                                      :description, :patent_type)
  end

end
