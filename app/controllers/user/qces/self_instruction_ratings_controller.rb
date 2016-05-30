class User::QCEs::SelfInstructionRatingsController < User::ApplicationController
  
  EVALUATION_CONTEXT = 'Self'
  before_action :set_qce


  def create
    rating = QCE::Instruction.new
    rating.qce_id = @qce.id
    
    # 'Self' in this context is the current user and evaluator. (Employee object)
    evaluator = current_user.account
    rating.evaluator = evaluator
    rating.evaluator_name = evaluator.full_name
    rating.evaluator_position = evaluator.rank.full_name
    rating.evaluation_context = EVALUATION_CONTEXT

    # render html: rating.inspect
    
    respond_to do |format|
      if rating.save
        @qce.update(has_assigned_self_rating: 1)
        format.html { redirect_to edit_qce_path(@qce), notice: 'Instruction Rating for Self has been created.'}
        # format.js {}
      end    
    end

  end   # create

  def destroy
    if @qce.self_instruction_rating.present?
      @qce.self_instruction_rating.destroy
      @qce.update(has_assigned_self_rating: 0)

      redirect_to edit_qce_path(@qce), notice: 'Instruction rating for Self has been deleted.'
    end
  end


  private

  def set_qce
    @qce = QCE.find(params[:qce_id])
  end

end