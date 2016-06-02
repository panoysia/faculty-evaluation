class User::QCE::RatingsController < User::ApplicationController
  before_action :set_rating


  def edit
  end

  def update
    # render html: params.inspect and return true

    if QCE::RatingEvaluation.update params[:evaluations].keys, params[:evaluations].values      
      redirect_to edit_qce_rating_path(@rating),
                  notice: "Update succeeded!"
    end
  end


  private

  def set_rating
    @rating = current_user.account.ratings.find(params[:id])
  end

end   # class User::QCE::RatingsController
