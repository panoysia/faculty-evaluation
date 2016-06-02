class User::QCEs::InstructionsController < User::ApplicationController

  QUESTIONS_COUNT = 20

  # Except for :show, because we need to display ratings not owned by the current user.
  before_action :set_rating, except: [:show]


  def edit
  end

  def show
    @rating = ::QCE::Instruction.find(params[:id]) 
  end

  def update
    # render html: params.inspect and return true

    id = params[:qce_id]

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
        target_path = edit_qce_instruction_path(id, @rating)
      end   # if finalizing?

      redirect_to target_path, notice: message
    end   # if QCE::RatingEvaluation.update

  end   # update
  

  private

  def set_rating
    @rating = current_user.account.ratings.instruction.find(params[:id])
  end

  def finalizing?
    params[:commit] == 'Finalize'
  end

  # def finalize
  #   # Make sure all items have been checked
  #   params[:evaluation].values.delete ""
  #   count = params[:evaluation].values.count

  #   params[:evaluation].values.count < QUESTIONS_COUNT
  #     flash.now.alert = "To finalize, you must evaluate all 20 questions. You have evaluated #{count} of #{QUESTIONS_COUNT}"
  #     render :edit and return true
  #   end
  # end   # finalize

end   # class User::QCEs::InstructionsController
