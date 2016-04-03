class Admin::AcademicYearsController < Admin::ApplicationController

  before_action :set_academic_year, only: [:show, :edit, :update, :destroy]

  def index
    @academic_years = AcademicYear.order(start_at: :desc, end_at: :desc)
  end

  def show
  end

  def new
    @academic_year = AcademicYear.new
  end

  def create
    @academic_year = AcademicYear.new(academic_year_params)
    respond_to do |format|
      if @academic_year.save
        format.html {
          redirect_to admin_academic_year_path(@academic_year),
          notice: 'Academic Year was successfully created.'
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
      if @academic_year.update(academic_year_params)
        format.html {
          redirect_to edit_admin_academic_year_path(@academic_year),
          notice: 'Academic Year was successfully updated.'
        }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @academic_year.destroy
    respond_to do |format|
      format.html {
        redirect_to admin_academic_years_path,
        notice: 'Academic Year was successfully deleted.' 
      }
    end
  end


  private

  def set_academic_year
    @academic_year = AcademicYear.find(params[:id])
  end

  def academic_year_params
    params.require(:academic_year).permit(:start_at, :end_at)
  end

end