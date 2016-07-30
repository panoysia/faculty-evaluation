class Admin::FacultyEvaluationSearchesController < Admin::ApplicationController
  

  def index
    # render html: params.inspect and return true
    if searching?
      if params[:employee_id].present? && params[:nbc_id].present?
        employee_id = params[:employee_id]
        nbc_id = params[:nbc_id]

        @faculty_evaluation = FacultyEvaluation.find_or_initialize_by(
                        employee_id: employee_id,
                        nbc_id: nbc_id
                      )

        render :search_results
        # if evaluation.persisted?
        #   # redirect_to faculty_evaluation#show
        # else
        #   # redirect_to
        # end        
      else
        flash.now.alert = "Please select a Faculty and NBC record to initiate the search."
      end   # if params[:employee_id].present?
    end   # if searching?
  end   # def index

  def show
  end


  private

  def searching?
    params[:commit] == 'Search'
  end

end
