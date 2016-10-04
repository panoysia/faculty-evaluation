class Admin::SearchEmployeeEvaluationsController < Admin::ApplicationController
  
=begin
  
  if searching?
    search = EvaluationSearch.new(employee_id, nbc_id)
  end

=end

  private

  def employee_id
    params[:employee_id]
  end

  def nbc_id
    params[:nbc_id]
  end

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
        flash.now.alert = "Please choose a Faculty and an NBC record to complete the search."
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

=begin
 
if search is valid with params then
  display search results
else
  display validation errors  
end

if Employee::EvaluationSearchForm.valid?
else
end

@search_form = Employee::EvaluationSearchForm.new

SearchEmployeeEvaluation
@search = Search.new(employee_id, nbc_id)

@search.results
@search.employees
@search.eva


Employee::EvaluationSearchForm.valid?

if SearchEvaluationForm.valid?(employee_id, nbc_id)
  @results = Employee::Evaluation.search()
  render partial: some_partial, @results
else
  render :index
end


Employee::SearchEvaluation.new
results = Employee::Evaluation.search(employee_id, nbc_id)

class SearchEmployeeEvaluation

end

def show
  @search = Search.new(term: hashtag)
end

private

def hashtag
  "##{params[:id]}"
end

end

<!-- /app/views/hashtags/show.html.erb -->
<h1><%= @search.term %></h1>
<%= render @search.shouts %>

=end

# class Search
class Employee::EvaluationSearch
  attr_reader :name

  def initialize(options = {})
    @term = options.fetch(:term, "")  
  end

  def shouts
    Shout.text_shouts.where(content_id: text_shouts)
  end    

  private

  def text_shouts
    TextShout.where("body LIKE ?", search_term)
  end

  def search_term
    "%#{term}%"
  end

end