class Admin::SpecializationsController < Admin::ApplicationController
  before_action :set_specialization, only: [:show, :edit, :update, :destroy]


  def index
    @specializations = Specialization.order(name: :asc)
  end

  def show
    @employees = @specialization.employees
  end

  def new
    @specialization = Specialization.new
  end

  def create
    # render html: params.inspect and return true

    @specialization = Specialization.new(specialization_params)
  
    respond_to do |format|
      if @specialization.save
        format.html { redirect_to admin_specializations_path,
          notice: 'Specialization was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @specialization.update(specialization_params)
        format.html { redirect_to admin_specializations_path, 
          notice: 'Specialization was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @specialization.destroy
    respond_to do |format|
      format.html { redirect_to admin_specializations_path, notice: 'Specialization was successfully deleted.' }
    end
  end


  private

  def set_specialization
    @specialization = Specialization.find(params[:id])
  end  

  def specialization_params
    params.require(:specialization).permit(:name, :career_path_id)
  end
  
end