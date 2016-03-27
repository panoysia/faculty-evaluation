class Admin::Employees::VoluntaryWorksController < Admin::ApplicationController

  before_action :set_employee
  before_action :set_voluntary_work, only: [:show, :edit, :update, :destroy]

  layout 'employee_profile'
  

  def index
    @voluntary_works = @employee.voluntary_works
  end

  def show
  end

  def new
    @voluntary_work = @employee.voluntary_works.new
  end

  def create
    @voluntary_work = @employee.voluntary_works.new(voluntary_work_params)
    respond_to do |format|
      if @voluntary_work.save
        format.html {
          redirect_to admin_employee_voluntary_works_path(@employee),
          notice: 'Voluntary work was successfully created.'
        }
      else
        format.html { render :new }
      end
    end

  end

  def edit
  end

  def update
    respond_to do |format|    
      if @voluntary_work.update(voluntary_work_params)
        format.html {
          redirect_to edit_admin_employee_voluntary_work_path(@employee, @voluntary_work),
          notice: 'Voluntary work was successfully updated.'
        }
      else
        format.html { render :edit }
      end
    end

  end

  def destroy
    @voluntary_work.destroy
    respond_to do |format|
      format.html {
        redirect_to admin_employee_voluntary_works_path(@employee),
        notice: 'Voluntary work was successfully deleted.' 
      }
    end

  end


  private

  def set_employee
    @employee = Employee.find(params[:employee_id])
  end

  def set_voluntary_work
    @voluntary_work = @employee.voluntary_works.find(params[:id])
  end

  def voluntary_work_params
    params.require(:voluntary_work).permit(:organization, :start_at, :end_at, :no_of_hours, :position)
  end

end