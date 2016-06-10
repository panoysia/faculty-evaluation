class Admin::DepartmentsController < Admin::ApplicationController
  before_action :set_department, only: [:show, :edit, :update, :destroy]

  def index
    @departments = Department.order(name: :asc)
  end

  def show
  end

  def new
    @department = Department.new
  end

  def create
    @department = Department.new(department_params)

    respond_to do |format|
      if @department.save
        format.html { redirect_to admin_departments_path, notice: 'Department record was successfully created.' }
      else
        format.html { render :new }
      end
    end    
  end

  def edit
  end

  def update
    # render html: params.inspect and return true

    respond_to do |format|    
      if @department.update(department_params)
        format.html {
          redirect_to admin_departments_path,
          notice: 'Department record was successfully updated.'
        }
      else
        format.html { render :edit }
      end
    end    
  end

  def destroy
    @department.destroy
    respond_to do |format|
      format.html {
        redirect_to admin_departments_path,
        notice: 'Department record was successfully deleted.' 
      }
    end
  end


  private  

  def set_department
    @department = Department.find(params[:id])
  end

  def department_params
    params.require(:department).permit(:name)
  end

end