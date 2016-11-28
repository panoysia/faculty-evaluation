class Admin::Employees::CareerPathsController < Admin::ApplicationController

  before_action :set_employee
  before_action :set_career_path, only: [:show]

  layout 'employee_profile'


  def show
    sort_criteria = { category: :asc, start_at: :desc, end_at: :desc }
    @actions = @employee.actions.order(sort_criteria)
    
    # @specializations = @career_path.specializations
    # @actions = @career_path.actions.reorder(category: :asc, start_at: :desc, end_at: :desc)

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
