class User::QCEs::SupervisorInstructionRatingsController < User::ApplicationController
  
  EVALUATION_CATEGORY = 'Supervisor'
  before_action :set_qce


  # def create
  #   render html: current_user.inspect
  #   render html: params.inspect
  # end

  def create
    if params[:supervisor_id].present?
      evaluator = Employee.find params[:supervisor_id]

      rating = QCE::InstructionRating.new
      rating.qce_id = @qce.id

      rating.evaluator = evaluator
      rating.evaluator_name = evaluator.full_name
      rating.evaluator_position = evaluator.rank.full_name    
      rating.evaluation_category = EVALUATION_CATEGORY

      respond_to do |format|
        if rating.save
          @qce.update(has_assigned_supervisor_rating: 1)
          format.html { redirect_to edit_qce_path(@qce), notice: "Instruction rating for Supervisor has been created." }
        end
      end
    else
      flash.now.alert = 'Please select your supervisor first.'
      @employees = Employee.all
      render 'user/qces/edit'
    end   # if params[:supervisor_id]

  end   # create

  def destroy
    if @qce.supervisor_instruction_rating.present?
      @qce.supervisor_instruction_rating.destroy
      @qce.update(has_assigned_supervisor_rating: 0)
    
      redirect_to edit_qce_path(@qce), notice: 'Instruction rating for Supervisor has been deleted.'
    end
  end


  private

  def set_qce
    @qce = QCE.find(params[:qce_id])
  end

end