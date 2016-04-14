class User::QCEs::SelfInstructionRatingsController < User::ApplicationController
  
  before_action :set_qce

  def create
    rating = QCE::InstructionRating.new
    rating.qce_id = @qce.id
    rating.rated_on = Date.today
    rating.evaluator_type = 'Self'
    rating.evaluator_name = @qce.employee.full_name
    rating.evaluator_position = @qce.employee.rank.full_name

    # render html: rating.inspect
    
    respond_to do |format|
      if rating.save
        @qce.update(has_assigned_self_rating: 1)
        format.html { redirect_to edit_qce_path(@qce), notice: 'Instruction Rating for Self has been created.'}
        # format.js {}
      end    
    end

  end


  private

  def set_qce
    @qce = QCE.find(params[:qce_id])
  end

end