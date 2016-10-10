class Admin::Employees::ProfessionalMembershipsController < Admin::ApplicationController

  include CCE::AchievementAndHonor2

  before_action :set_employee
  before_action :set_membership, only: [:edit, :update, :destroy]

  layout 'employee_profile'


  def index
    @memberships = @employee.professional_memberships
  end

  def new
    @membership = @employee.professional_memberships.new
  end

  def create
    # render html: params.inspect and return true
    @membership = @employee.professional_memberships.
                    new(membership_params)
    if @membership.save
      redirect_to admin_employee_achievement_and_honors_2_path,
        notice: 'Prof. membership record was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @membership.update(membership_params)
      redirect_to referrer,
        notice: 'Prof. membership record was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @membership.destroy
    redirect_to referrer,
      notice: 'Prof. membership record was successfully deleted.'
  end


  private


  def membership_params
    params.require(:professional_membership).permit(:organization,
                                                    :date_of_membership,
                                                    :organization_type,
                                                    :membership_type)
  end

  def set_employee
    @employee = Employee.find(params[:employee_id])
  end

  def set_membership
    @membership = @employee.professional_memberships.find(params[:id])
  end

end
