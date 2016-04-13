class User::QCEs::AssignToSelfController < User::ApplicationController
  
  before_action :set_qce

  def new
  end

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
        # format.html {}
        format.js {}
      end    
    end

  end


  private

  def set_qce
    @qce = QCE.find(params[:qce_id])
  end

end