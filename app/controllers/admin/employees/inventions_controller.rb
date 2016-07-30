class Admin::Employees::InventionsController < Admin::ApplicationController

  before_action :set_employee
  before_action :set_invention, only: [:show, :edit, :update, :destroy]

  layout 'employee_profile'


  def new
    @invention = @employee.inventions.new
  end

  def create
    # render html: params.inspect and return true
    @invention = @employee.inventions.new(invention_params)
    if @invention.save
      redirect_to admin_employee_professional_developments_path,
        notice: 'Invention was successfully created.'
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
    @invention.destroy
    redirect_to admin_employee_professional_developments_path(@employee),
      notice: 'Invention was successfully deleted.'
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
