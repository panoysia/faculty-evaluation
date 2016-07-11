class Admin::FacultyEvaluationsController < Admin::ApplicationController

=begin

  # render html: params.inspect and return true
  # employee = Employee.find(employee_id)

=end

  def index
    if searching?
      if params[:employee_id].present? && params[:nbc_id].present?
        employee_id = params[:employee_id]
        nbc_id = params[:nbc_id]
        evaluation = FacultyEvaluation.find_or_initialize_by(
                        employee_id: employee_id,
                        nbc_id: nbc_id
                      )

        if evaluation.persisted?
          # redirect_to faculty_evaluation#show
        else
          # redirect_to
        end
      else
        render html: 'select both' and return true
      end
    end
  end

  def new
    
  end

  def create
  end


  def show

  end

  
  private

  def searching?
    params[:commit] == 'Search'
  end

end