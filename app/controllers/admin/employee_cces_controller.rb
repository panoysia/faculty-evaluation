class Admin::EmployeeCCEsController < Admin::ApplicationController
  
  def index
    #@employees = Employee.all
    if params[:view].present? 
      if params[:view][:employee_id].present? &&
        params[:view][:button].present?
        
        id = params[:view][:employee_id]
        @employee = Employee.find(id)
        
        # Compute educational attainment
        # professional experience
        # 
      end
    end
  end

end