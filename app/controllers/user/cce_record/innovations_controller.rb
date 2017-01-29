class User::CCERecord::InnovationsController < User::ApplicationController

  before_action :set_employee
  before_action :set_innovation, only: [:edit, :update, :destroy]


  def new
    @innovation = employee.innovations.new
  end

  def create
    @innovation = employee.innovations.new(innovation_params)
    if @innovation.save
      redirect_to cce_record_path,
        notice: "Innovation record was successfully created."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @innovation.update(innovation_params)
      redirect_to cce_record_path,
        notice: "Innovation record was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @innovation.destroy
    redirect_to cce_record_path,
      notice: "Innovation record was successfully deleted."
  end


  private


  def employee
    @employee = current_user.account
  end

  alias_method :set_employee, :employee


  def set_innovation
    @innovation = employee.innovations.find(params[:id])
  end

  def innovation_params
    params.require(:innovation).permit(:name, :patent_no,
                                      :year_patented, :description,
                                      :competitiveness, criterium_ids: [])
  end

end
