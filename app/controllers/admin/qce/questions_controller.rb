class Admin::QCE::QuestionsController < Admin::ApplicationController

  
  def index
    @questions = QCE::Question.all
  end

  # def new
  # end

end
