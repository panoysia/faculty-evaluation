class Admin::RatingPeriodsController < Admin::ApplicationController
  before_action :set_rating_period, only: [:show, :edit, :update, :destroy]

  def index
    @rating_periods = RatingPeriod.all
  end

  def show
  end

  def new
    @rating_period = RatingPeriod.new
  end

  def edit
  end

  def create
    @rating_period = RatingPeriod.new(rating_period_params)

    respond_to do |format|
      if @rating_period.save
        format.html { redirect_to [:admin, @rating_period], notice: 'Rating period was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @rating_period.update(rating_period_params)
        format.html { redirect_to [:admin, @rating_period], notice: 'Rating period was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @rating_period.destroy
    respond_to do |format|
      format.html { redirect_to admin_rating_periods_path, notice: 'Rating period was successfully deleted.' }
    end
  end


  private

  def set_rating_period
    @rating_period = RatingPeriod.find(params[:id])
  end

  def rating_period_params
    params.require(:rating_period).permit(:start_at, :end_at, :semester, :status)
  end
  
end