

class User::QCE::RatingsController < User::ApplicationController
  
  before_action :set_rating


  def edit
    # @rating = 
  end

  def update
    #render html: "<pre>" + params.inspect + "</pre>" and return true
    #render html: '<pre>' + "#{pp(params)}" + '</pre>'
    
    #render html: ap(params.inspect) and return true
    # render html: params[:evaluations].keys and return true
    # render html: @rating.evaluations.ids + params[:evaluations].values
    # render html: params[:evaluations].keys

    # render html: @rating.evaluations.ids and return true

    # if QCE::RatingEvaluation.update params[:evaluations].keys, params[:evaluations].values    
    # # if QCE::RatingEvaluation.update @rating.evaluations.ids, params[:evaluations].values
    #   flash.now.alert = "Update succeeded!"
    #   render :edit
    #   # redirect_to
    # end
  end


  private

  def set_rating
    @rating = current_user.account.ratings.find(params[:id])
  end
  
  def rating_params
  end
end
