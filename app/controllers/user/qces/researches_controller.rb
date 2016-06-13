class User::QCEs::ResearchesController < User::ApplicationController  

  QUESTIONS_COUNT = 5

  # Except for :show, because we need to display ratings not owned by the current user.
  before_action :set_rating, except: [:show, :randomize_save]


  def edit
  end

  def show
    @qce_id = ::QCE.find(params[:qce_id])
    @rating = ::QCE::Research.find(params[:id])     
  end

  def randomize_save
    # render html: params.inspect and return true
    # ["6747", "6748", "6749", "6750", {"score"=>"3"}, {"score"=>"3"}, {"score"=>"5"}, {"score"=>"1"}]

    rating = QCE::Research.find(params[:id])
    
    ids = rating.evaluation_ids
    answers = []
    answer_range = (4..5).to_a

    1.upto(5).each do |number|
      answers << { score: answer_range.sample }
    end

    if QCE::RatingEvaluation.update ids, answers
      rating.touch(:finished_at)
      rating.task.completed!
      message = "Your evaluation for this rating has been finalized successfully."
      redirect_to rating_tasks_path, notice: message
    end
    
  end   # def update


  def update
    # render html: params.inspect and return true

    id = params[:qce_id]
    
    if params[:evaluations].blank?
      flash.now.alert = "Please evaluate at least one question first."
      render :edit and return true
    end

    if QCE::RatingEvaluation.update params[:evaluations].keys,
                                    params[:evaluations].values
      if finalizing?
        params[:evaluations].values.delete ""
        count = params[:evaluations].values.count

        if params[:evaluations].values.count < QUESTIONS_COUNT
          flash.now.alert = "To finalize, you must evaluate all 20 questions. You have only evaluated #{count} out of #{QUESTIONS_COUNT} questions."
          render :edit and return true
        else
          @rating.touch(:finished_at)
          @rating.task.completed!
          message = "Your evaluation for this rating has been finalized successfully."
          target_path = rating_tasks_path
        end
      else
        message = "Your evaluation for this rating has been saved successfully."
        target_path = edit_qce_research_path(id, @rating)
      end   # if finalizing?

      redirect_to target_path, notice: message
    end   # if QCE::RatingEvaluation.update

  end   # def update


  private

  def set_rating
    @rating = current_user.account.ratings.research.find(params[:id])
  end
  
  def finalizing?
    params[:commit] == 'Finalize'
  end

end