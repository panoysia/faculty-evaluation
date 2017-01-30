class User::CCERecord::TrainingsController < User::ApplicationController

  before_action :set_employee
  before_action :set_training, only: [:show, :edit, :update, :destroy]


  def new
    @training = employee.trainings.new
  end

  def create
    @training = employee.trainings.new(training_params)
    if @training.save
      redirect_to cce_record_path,
        notice: "Training was successfully created."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @training.update(training_params)
      redirect_to cce_record_path,
        notice: "Training was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @training.destroy
    redirect_to cce_record_path,
      notice: "Training was successfully deleted."
  end


  private


  def employee
    @employee = current_user.account
  end

  alias_method :set_employee, :employee


  def set_training
    @training = employee.trainings.find(params[:id])
  end

  def training_params
    params.require(:training).permit(:title, :category, :level,
                                      :start_at, :end_at, :conducted_by,
                                      :nature_of_participation)
  end

end
