class User::QCEs::ProductionsController < User::ApplicationController
  before_action :set_rating

  def edit
  end

  def show
  end

  def update
    # render html: params.inspect and return true

    id = params[:qce_id]
    if QCE::RatingEvaluation.update params[:evaluations].keys, params[:evaluations].values
      redirect_to edit_qce_production_path(id, @rating),
                   notice: "Update succeeded!"
    end
  end


  private

  def set_rating
    @rating = current_user.account.ratings.production.find(params[:id])
  end

end