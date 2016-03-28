class Admin::NBCsController < Admin::ApplicationController
  before_action :set_nbc, only: [:show, :edit, :update, :destroy]

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


  private  

  def set_nbc
    @nbc = NBC.find(params[:id])
  end

  def nbc_params
    params.require(:nbc).permit(:name, :description)
  end
  
end