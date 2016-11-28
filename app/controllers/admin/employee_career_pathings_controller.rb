class Admin::EmployeeCareerPathingsController < Admin::ApplicationController
  
  def index
    #@employees = Employee.all
    if params[:view].present? 
      if params[:view][:employee_id].present? &&
        params[:view][:button].present?
        
        id = params[:view][:employee_id]
        sort_criteria = { category: :asc, start_at: :desc, end_at: :desc }
        @employee = Employee.find(id)
        @actions = @employee.actions.order(sort_criteria)
      end
    end
  end

end