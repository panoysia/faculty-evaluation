class User::QCEs::InstructionRatingsController < User::ApplicationController

  before_action :set_rating, only: [:evaluate]


=begin
  def index
    @ratings = current_user.account.instruction_ratings
  end
=end


  def evaluate
  end


  private

  def set_rating
    @rating = current_user.account.instruction_ratings.find(params[:id])
  end

  #/instruction_ratings/3/evaluate
end