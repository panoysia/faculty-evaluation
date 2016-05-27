class User::QCEsController < User::ApplicationController
  before_action :set_qce, only: [:show, :edit, :update, :destroy]


  def index
    @qces = current_user.account.qces.includes(:employee, rating_period: [:academic_year])

    employee_id = current_user.account.id
    join_criteria = "LEFT OUTER JOIN qces ON qces.rating_period_id = rating_periods.id AND qces.employee_id = #{employee_id}" 
    where_criteria = "qces.rating_period_id IS NULL AND qces.employee_id IS NULL"
    order_criteria = 'academic_years.start_at DESC, academic_years.end_at DESC, rating_periods.semester DESC'

    @available_rating_periods = RatingPeriod.includes(:academic_year).joins(join_criteria).where(where_criteria).order(order_criteria).references(:academic_year)

    # @employees = Employee.includes(:educations).where(criteria).order('employee_educations.level DESC').references(:employee_educations)
  end

  def show
  end

  def create
    # render html: params.inspect and return true
    # render html: qce_params.inspect and return true

    @rating = current_user.account.qces.new(qce_params)
    respond_to do |format|
      if @rating.save
        format.html { redirect_to edit_qce_path(@rating), notice: "QCE was successfully created.<br>In order to complete/finish this QCE, you'll have to provide additional data and do some tasks listed below." }
      else
        format.html { render :new }
      end
    end    
  end

  def edit
    @employees = Employee.all
  end


  private

  def set_qce
    # @qce = QCE.find(params[:id])

    # Scope searching of QCE to current_user (Employee/Faculty)
    @qce = current_user.account.qces.find(params[:id])
  end

  def qce_params
    # params.require(:qce).permit(:rating_period_id)

    # No need to access the :qce key here, :rating_period_id is a stand-alone parameter and isn't associated to a QCE object
    params.permit(:rating_period_id)
  end

end