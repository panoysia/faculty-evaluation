class User::CCERecord::InventionsController < User::ApplicationController

  before_action :set_employee
  before_action :set_invention, only: [:edit, :update, :destroy]


  def new
    @invention = employee.inventions.new
  end

  def create
    @invention = employee.inventions.new(invention_params)
    if @invention.save
      redirect_to cce_record_path,
        notice: "Invention record was successfully created."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @invention.update(invention_params)
      redirect_to cce_record_path,
        notice: "Invention record was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @invention.destroy
    redirect_to cce_record_path,
      notice: "Invention record was successfully deleted."
  end


  private


  def employee
    @employee = current_user.account
  end

  alias_method :set_employee, :employee


  def set_invention
    @invention = employee.inventions.find(params[:id])
  end

  def invention_params
    params.require(:invention).permit(:name, :patent_no, :year_patented,
                                      :description, :patent_type)
  end

end
