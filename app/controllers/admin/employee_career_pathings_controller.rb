class Admin::EmployeeCareerPathingsController < Admin::ApplicationController
  
  def index
    #@employees = Employee.all
    if params[:view].present? 
      if params[:view][:employee_id].present? &&
        params[:view][:button].present?
        
        id = params[:view][:employee_id]
        @employee = Employee.find(id)
        @actions = @employee.actions
      end
    end
  end

end