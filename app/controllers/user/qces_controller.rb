class User::QCEsController < User::ApplicationController
  before_action :set_qce, only: [:show, :edit, :update, :destroy, :destroy_support_area, :finalize]


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

    @qce = current_user.account.qces.new(qce_params)
    respond_to do |format|
      if @qce.save
        format.html { redirect_to edit_qce_path(@qce), notice: "QCE was successfully created.<br>In order to complete/finish this QCE, you'll have to provide additional data and do some tasks listed below." }
      else
        format.html { render :new }
      end
    end    
  end

  def edit
    @employees = Employee.where.not(id: current_user.account.id)
    # @clients = Client.order(last_name: :asc, first_name: :asc)
  end

  def update
    # render html: params.inspect and return true
    # render html: qce_params.inspect and return true

    # support_area = params[:support_area]
    # attributes = { support_area: support_area }
    # render html: attributes and return true
    support_area = qce_params[:support_area]

    respond_to do |format|
      if @qce.update(qce_params)
        format.html { 
          redirect_to edit_qce_path(@qce), 
            notice: "Support area for #{support_area} has been created." 
        }
        
        # format.js
      else
        format.html { render :edit }
      end
    end

  end   # def update

  def destroy
    # TODO: Know what related records get deleted here.
    @qce.destroy
    respond_to do |format|
      format.html {
        redirect_to qces_path,
        notice: 'QCE record was successfully deleted.'
      }
    end
  end

  def destroy_support_area
    # render html: params.inspect and return true

    support_area = qce_params[:support_area]
    @qce.update support_area: nil
    @qce.ratings.where(type: support_area).destroy_all
    redirect_to edit_qce_path(@qce), 
      notice: "Support area for #{support_area} has been deleted."
  end

  def finalize
    # render html: params.inspect and return true
    @qce.update completed: 1
    redirect_to qces_path, notice: 'Your QCE for SY has been finalized.'
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
    params.require(:qce).permit(:rating_period_id, :support_area)
  end

end