class Admin::EmployeeSearchesController < Admin::ApplicationController
  
  def index
    if params[:q].present?
      query = "last_name like ?"
      value = "#{params[:q]}%"
      @searched_employees = Employee.includes(:rank).where(query, value)
    else
      @searched_employees = Employee.includes(:rank).all
    end
  end

end