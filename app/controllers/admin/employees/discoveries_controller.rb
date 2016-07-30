class Admin::Employees::DiscoveriesController < Admin::ApplicationController

  before_action :set_employee
  before_action :set_discovery, only: [:show, :edit, :update, :destroy]

  layout 'employee_profile'


  def new
    @discovery = @employee.discoveries.new
  end

  def create
    # render html: params.inspect and return true
    @discovery = @employee.discoveries.new(discovery_params)
    if @discovery.save
      redirect_to admin_employee_professional_developments_path,
        notice: 'Discovery was successfully created.'
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
    @discovery.destroy
    redirect_to admin_employee_professional_developments_path(@employee),
      notice: 'Discovery was successfully deleted.'     
  end


  private

  def set_employee
    @employee = Employee.find(params[:employee_id])
  end

  def set_discovery
    @discovery = @employee.discoveries.find(params[:id])
  end

  def discovery_params
    params.require(:discovery).permit(:name, :patent_no, :year_patented,
                                      :description, :criteria)
  end

end
