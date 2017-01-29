class User::CCERecord::DiscoveriesController < User::ApplicationController

  before_action :set_employee
  before_action :set_discovery, only: [:edit, :update, :destroy]


  def new
    @discovery = employee.discoveries.new
  end

  def create
    @discovery = employee.discoveries.new(discovery_params)
    if @discovery.save
      redirect_to cce_record_path,
        notice: "Discovery record was successfully created."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @discovery.update(discovery_params)
      redirect_to cce_record_path,
        notice: "Discovery record was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @discovery.destroy
    redirect_to cce_record_path,
      notice: "Discovery record was successfully deleted."
  end


  private


  def employee
    @employee = current_user.account
  end

  alias_method :set_employee, :employee


  def set_discovery
    # includes(:criteria).
    @discovery = employee.discoveries.find(params[:id])
  end

  def discovery_params
    params.require(:discovery).permit(:name, :patent_no, :year_patented,
                                      :description, criterium_ids: [])
  end

end