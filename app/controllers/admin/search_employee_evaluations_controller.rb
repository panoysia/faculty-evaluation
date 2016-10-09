class Admin::SearchEmployeeEvaluationsController < Admin::ApplicationController
  

  def index
    if searching?
      # render html: params.inspect and return true
      @search_form = Employee::EvaluationSearchForm.new(search_params)
      if @search_form.valid?
        @evaluation = @search_form.results 
        render :search_results
      else
        render :index
      end
    else
      @search_form = Employee::EvaluationSearchForm.new
    end
  end


  private

  def searching?
    params[:commit] == "Search"
  end
  
  def search_params
    params[:search]
  end

end
