class User::QCERatingsController < User::ApplicationController
  before_action :set_qce_rating, only: [:show, :edit, :update, :destroy]


  def index
    @ratings = current_user.account.qce_ratings.includes(:employee, rating_period: [:academic_year])

    employee_id = current_user.account.id
    join_criteria = "LEFT OUTER JOIN qce_ratings ON qce_ratings.rating_period_id = rating_periods.id AND qce_ratings.employee_id = #{employee_id}" 
    where_criteria = "qce_ratings.rating_period_id IS NULL AND qce_ratings.employee_id IS NULL"
    order_criteria = 'academic_years.start_at DESC, academic_years.end_at DESC'

    @available_rating_periods = RatingPeriod.includes(:academic_year).joins(join_criteria).where(where_criteria).order(order_criteria).references(:academic_year)

    # @employees = Employee.includes(:educations).where(criteria).order('employee_educations.level DESC').references(:employee_educations)
  end

  def show
  end

  # def new
    # @rating = current_user.account.qce_ratings.new
  # end

  def create
    # render html: params.inspect
    @rating = current_user.account.qce_ratings.new(qce_rating_params)
    respond_to do |format|
      if @rating.save
        format.html { redirect_to qce_rating_path(@rating), notice: "QCE Rating was successfully created.<br>Listed below are the tasks needed to complete this QCE Rating." }
      else
        format.html { render :new }
      end
    end    
  end


  private

  def set_qce_rating
    @qce_rating = QCERating.find(params[:id])
  end

  def qce_rating_params
    # params.require(:qce_rating).permit(:rating_period_id)
    params.permit(:rating_period_id)
  end

end