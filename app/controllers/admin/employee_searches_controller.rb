class Admin::EmployeeSearchesController < Admin::ApplicationController
  
  def index
    if params[:q].present?
      if Rails.env.development?
        query = "last_name like ?"
      elsif Rails.env.production?
        query = "last_name ilike ?"
      end

      value = "%#{params[:q]}%"
      @searched_employees = Employee.includes(:rank).where(query, value)
    else
      @searched_employees = Employee.includes(:rank).all
    end
  end

end