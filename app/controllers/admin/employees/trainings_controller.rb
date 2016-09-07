class Admin::Employees::TrainingsController < Admin::ApplicationController

  before_action :set_employee
  before_action :set_training, only: [:show, :edit, :update, :destroy]
  
  layout 'employee_profile'


  def index
    @trainings = @employee.trainings
  end
  
  def show
  end

  def new
    @training = @employee.trainings.new
  end

  def create
    @training = @employee.trainings.new(training_params)
    respond_to do |format|
      if @training.save
        format.html {
          redirect_to admin_employee_educations_path(@employee),
          notice: 'Training was successfully created.'
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
      if @training.update(training_params)
        format.html {
          redirect_to admin_employee_educations_path(@employee, @training),
          notice: 'Training was successfully updated.'
        }
      else
        format.html { render :edit }
      end
    end
      
  end

  def destroy
    @training.destroy
    respond_to do |format|
      format.html {
        redirect_to admin_employee_educations_path(@employee),
        notice: 'Training was successfully deleted.' 
      }
    end

  end


  private

  def set_employee
    @employee = Employee.find(params[:employee_id])
  end

  def set_training
    @training = @employee.trainings.find(params[:id])
  end

  def training_params
    params.require(:training).permit(:title, :category, :level,
                                      :start_at, :end_at, :conducted_by,
                                      :nature_of_participation)
  end

end