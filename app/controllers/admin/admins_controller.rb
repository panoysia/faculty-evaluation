class Admin::AdminsController < Admin::ApplicationController
  before_action :set_admin, only: [:show, :edit, :update, :destroy]

  def index
    @admins = Admin.all
  end

  def show
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(admin_params)
    respond_to do |format|
      if @admin.save
        format.html { redirect_to [:admin, @admin], notice: 'Admin was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end 

  def edit
  end

  def update
    respond_to do |format|
      if @admin.update(admin_params)
        format.html { redirect_to [:admin, @admin], notice: 'Admin was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @admin.destroy
    redirect_to admin_admins_path, notice: 'Admin was successfully deleted.'
  end


  private

  def set_admin
    @admin = Admin.find(params[:id])      
  end

  def admin_params
    params.require(:admin).permit(:username, :password)
  end

end