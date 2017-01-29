class User::CCERecord::CreativeWorksController < User::ApplicationController

  before_action :set_employee
  before_action :set_creative_work, only: [:edit, :update, :destroy]


  def new
    @creative_work = employee.creative_works.new
  end

  def create
    @creative_work = employee.creative_works.new(creative_work_params)
    if @creative_work.save
      redirect_to cce_record_path,
        notice: "Creative work record was successfully created."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @creative_work.update(creative_work_params)
      redirect_to cce_record_path,
        notice: "Creative work record was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @creative_work.destroy
    redirect_to cce_record_path,
      notice: "Creative work record was successfully deleted."
  end


  private


  def employee
    @employee = current_user.account
  end

  alias_method :set_employee, :employee


  def set_creative_work
    @creative_work = employee.creative_works.find(params[:id])
  end

  def creative_work_params
    params.require(:creative_work).permit(:name, :patent_no,
                                          :competitiveness,
                                          :year_patented, :description,
                                          criterium_ids: [])
  end

end
