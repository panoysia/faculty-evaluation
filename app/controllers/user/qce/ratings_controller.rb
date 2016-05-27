class User::QCE::RatingsController < User::ApplicationController
  
  before_action :set_rating


  def edit
    # @rating = 
  end

  def update
    render html: params.inspect and return true
=begin
  QCE::RatingEvaluation.update @rating.
=end
  end


  private

  def set_rating
    @rating = current_user.account.ratings.find(params[:id])
  end
  
  def rating_params
  end
end
