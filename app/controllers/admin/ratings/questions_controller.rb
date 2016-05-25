class Admin::Ratings::QuestionsController < Admin::ApplicationController

  
  def index
    @questions = Rating::Question.all
  end

  # def new
  # end

end