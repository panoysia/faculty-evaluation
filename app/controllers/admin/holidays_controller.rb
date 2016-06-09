class Admin::HolidaysController < Admin::ApplicationController
  before_action :set_holiday, only: [:edit, :update, :destroy]

  def index
    @holidays = Holiday.order(occurs_at: :desc)
  end

  # def show
  # end

  def new
    @holiday = Holiday.new
  end

  def create
    @holiday = Holiday.new(holiday_params)

    respond_to do |format|
      if @holiday.save
        format.html { redirect_to admin_holidays_path, notice: 'Holiday record was successfully created.' }
      else
        format.html { render :new }
      end
    end        
  end

  def edit
  end

  def update
    respond_to do |format|    
      if @holiday.update(holiday_params)
        format.html {
          redirect_to admin_holidays_path,
          notice: 'Holiday record was successfully updated.'
        }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @holiday.destroy
    respond_to do |format|
      format.html {
        redirect_to admin_holidays_path,
        notice: 'Holiday record was successfully deleted.' 
      }
    end    
  end


  private  

  def set_holiday
    @holiday = Holiday.find(params[:id])
  end

  def holiday_params
    params.require(:holiday).permit(:name, :occurs_at)
  end

end