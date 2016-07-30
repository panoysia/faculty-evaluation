class Admin::Employees::CareerPathsController < Admin::ApplicationController

  before_action :set_employee
  before_action :set_career_path, only: [:show]

  layout 'employee_profile'


  def show
    # @specialization = current_user.account.specialization
    # if @specialization.present? 
    #   @actions = @specialization.career_path_actions.
    #               order(category: :asc, start_at: :desc, end_at: :desc)
    # else
    #   render 'no_career_path' and return true
    # end
  end


  private

  def set_employee
    @employee = Employee.find(params[:employee_id])
  end

  def set_career_path
    @career_path = @employee.career_path
  end
  
end
