class Admin::SearchEmployeeEvaluationsController < Admin::ApplicationController


  def index
    if searching?
      @search_form = Employee::EvaluationSearchForm.new(search_params)
      if @search_form.valid?
        # returns an EvaluationPresenter
        @evaluation = @search_form.results
        
        @checker = Employee::QCEsInNBCCompletionChecker.
                    new(@evaluation.employee, @evaluation.nbc)

        # Store :nbc_id in session, to prevent tampering
        # in browsers address bar
        session[:nbc_id] = @search_form.nbc_id
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
