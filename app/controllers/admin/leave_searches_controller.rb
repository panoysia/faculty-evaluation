class Admin::LeaveSearchesController < Admin::ApplicationController
  
  def index
    
    values = {}

    if params[:search]
      if params[:academic_year_id].present?
        criteria = "academic_year_id = :academic_year_id"
        values[:academic_year_id] = params[:academic_year_id]
      end

      if params[:employee_id].present?
        if criteria.present?
          criteria << " AND employee_id = :employee_id"
        else
          criteria = "employee_id = :employee_id"
        end

        values[:employee_id] = params[:employee_id]
      end
    end

    # render html: criteria.inspect and return true

    if values.present?
      @leaves = Leave.includes(:employee).where(criteria, values).order(filed_at: :desc)
      # render html: @leaves.to_sql and return true
    else
      flash.now.alert = "No criteria found in your search. Please provide necessary data in the fields below."
      render :index
    end

    # if params[:start_at].present? && params[:end_at].present?
    #   values[:start_at] = params[:start_at]
    #   values[:end_at] = params[:end_at]
    #   criteria = "(start_at >= :start_at AND end_at <= :end_at)"
    # end

    # if params[:employee].present?
    #   if params[:employee][:id].present?
    #     values[:employee_id] = params[:employee][:id] 
    #     if criteria.present? 
    #       criteria << " AND (employee_id = :employee_id))"
    #       criteria.insert(0, '(')
    #     else
    #       criteria = "(employee_id = :employee_id)"
    #     end
    #   end
    # end
 
    # render html: [criteria.inspect, values.inspect]

    # if params[:q].present?
      # query = "last_name like ?"
      # value = "%#{params[:q]}%"
      # @searched_leaves = Leave.where(query, value)
    # else
    #   @searched_employees = Employee.includes(:rank).all
    # end

  end

end