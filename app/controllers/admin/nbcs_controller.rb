class Admin::NBCsController < Admin::ApplicationController
  before_action :set_nbc, only: [:show, :edit, :update, :destroy,
                                  :associate_academic_years,
                                  :update_academic_years,
                                  :remove_academic_years_association
                                ]

  def index
    @nbcs = NBC.all
  end

  def show
  end

  def new
    @nbc = NBC.new
  end

  def create
    @nbc = NBC.new(nbc_params)

    respond_to do |format|
      if @nbc.save
        format.html { redirect_to admin_nbcs_path, notice: 'NBC record was successfully created.' }
      else
        format.html { render :new }
      end
    end    
  end

  def edit
  end

  def update
    # render html: params.inspect and return true

    respond_to do |format|    
      if @nbc.update(nbc_params)
        format.html {
          redirect_to admin_nbcs_path,
          notice: 'NBC record was successfully updated.'
        }
      else
        format.html { render :edit }
      end
    end    
  end

  def destroy
    @nbc.destroy
    respond_to do |format|
      format.html {
        redirect_to admin_nbcs_path,
        notice: 'NBC record was successfully deleted.' 
      }
    end
  end

  def associate_academic_years
    # @years = AcademicYear.display_all
  end

  def update_academic_years
    # TODO: Make sure to have 3 unique Academic Year records
    
    # render html: params.inspect and return true  
    ids = params[:academic_year_ids]
    AcademicYear.where(id: ids).update_all(nbc_id: @nbc.id)
    redirect_to associate_academic_years_admin_nbc_path(@nbc),
      notice: 'Selected academic years have been successfully associated to this NBC record.'
  end

  def remove_academic_years_association
    # render html: params.inspect and return true

    @nbc.academic_years.update_all nbc_id: nil
    redirect_to associate_academic_years_admin_nbc_path(@nbc),
      notice: 'Association of NBC from selected academic years have been removed successfully.'
  end


  private  

  def set_nbc
    @nbc = NBC.find(params[:id])
  end

  def nbc_params
    params.require(:nbc).permit(:name, :description, academic_years_attributes: [:id])
  end

end