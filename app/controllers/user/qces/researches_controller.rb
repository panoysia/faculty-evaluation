class User::QCEs::ResearchesController < User::ApplicationController  
  before_action :set_rating

  def edit
  end

  def show
  end

  def update
    # render html: params.inspect and return true
    id = params[:qce_id]
    if QCE::RatingEvaluation.update params[:evaluations].keys, params[:evaluations].values      
      redirect_to edit_qce_research_path(id, @rating),
                  notice: "Update succeeded!"
    end
  end


  private

  def set_rating
    @rating = current_user.account.ratings.research.find(params[:id])
  end
  
end