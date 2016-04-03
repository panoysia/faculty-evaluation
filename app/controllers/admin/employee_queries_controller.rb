class Admin::EmployeeQueriesController < Admin::ApplicationController

  def index
    if params[:query] then
      render(html: params.inspect) and return true
    else

    end
  end

  def indexs
    if params[:query] then
      if params[:query][:degree].present?
        value = params[:query][:degree_value]
      end

      if params[:query][:gender]
        value = params[:query][:gender_value]
      end

      if params[:query][:rank]
        value = params[:query][:rank_value]
      end

      if params[:query][:specialization]
        value = params[:query][:specialization_value]
      end
    else
      # render normal index page
    end

    if params[:query] then
      # button && select box value
      value = params[:query][:value]

      if params[:query][:qualifications] && value
        criteria = ""
      end

      if params[:query][:gender] && value
        value = (value == 'male') ? 'male' : 'female'
        criteria = "where gender = #{value}"
      end

      if params[:rank] && params[:value]
        criteria = "where academic_rank_id = #{params[:value]}"
      end

      if params[:specialization] && params[:value]
        criteria = "where specialization_id = #{params[:value]}"
      end

      if criteria.present?
        render html: params.inspect and return true
        # @query_results = Employee.where(criteria).to_sql
        # render html: @query
      else
        flash.now.alert = "No criteria found in your query. Please choose from any of the options below."
        render :index
      end    
    end   # if param[:query]

  end

end   # class Admin::EmployeeQueriesController