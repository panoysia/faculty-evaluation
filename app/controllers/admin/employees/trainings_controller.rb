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
    # render html: params.inspect and return true
    @training = @employee.trainings.new(training_params)
    if @training.save
      redirect_to admin_employee_educations_path,
        notice: 'Training was successfully created.'
    else
      render :new
    end    
  end

  def edit    
  end

  def update
    if @training.update(training_params)
      redirect_to admin_employee_educations_path,
        notice: 'Training was successfully updated.'
    else
      render :edit
    end      
  end

  def destroy
    @training.destroy
    redirect_to admin_employee_educations_path,
      notice: 'Training was successfully deleted.' 
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