class User::CCERecord::ProfessionalMembershipsController < User::ApplicationController

  before_action :set_employee
  before_action :set_membership, only: [:edit, :update, :destroy]


  def new
    @membership = employee.professional_memberships.new
  end

  def create
    @membership = employee.professional_memberships.new(membership_params)
    if @membership.save
      redirect_to cce_record_path,
        notice: "Prof. membership record was successfully created."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @membership.update(membership_params)
      redirect_to cce_record_path,
        notice: "Prof. membership record was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @membership.destroy
    redirect_to cce_record_path,
      notice: "Prof. membership record was successfully deleted."
  end


  private


  def employee
    @employee = current_user.account
  end

  alias_method :set_employee, :employee


  def set_membership
    @membership = employee.professional_memberships.find(params[:id])
  end

  def membership_params
    params.require(:professional_membership).permit(:organization,
                                                    :date_of_membership,
                                                    :organization_type,
                                                    :membership_type)
  end

end
