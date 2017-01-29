class User::CCERecord::InstructionalManualsController < User::ApplicationController

  before_action :set_employee
  before_action :set_instructional_manual,
                only: [:edit, :update, :destroy]

  def new
    @instructional_manual = employee.instructional_manuals.new
  end

  def create
    @instructional_manual = employee.instructional_manuals.
                              new(instructional_manual_params)
    if @instructional_manual.save
      redirect_to cce_record_path,
        notice: "Instructional manual record was successfully created."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @instructional_manual.update(instructional_manual_params)
      redirect_to cce_record_path,
        notice: "Instructional manual record was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @instructional_manual.destroy
    redirect_to cce_record_path,
      notice: "Instructional manual record was successfully deleted."
  end


  private


  def employee
    @employee = current_user.account
  end

  alias_method :set_employee, :employee


  def set_instructional_manual
    @instructional_manual = employee.instructional_manuals.
                              find(params[:id])
  end

  def instructional_manual_params
    params.require(:instructional_manual).
      permit(:name, :published_at, :category, :description)
  end

end
