class User::QCEs::ClienteleInstrumentsController < User::ApplicationController
  
  before_action :set_qce

  
  def create
    render html: params.inspect and return true
  end

  def destroy

  end

  # def destroy
  #   if @qce.peer_instruction_ratings.present?
  #     @qce.peer_instruction_ratings.destroy_all
  #     @qce.update(has_assigned_peer_rating: 0)
      
  #     redirect_to edit_qce_path(@qce), notice: 'Instruction ratings for Peers has been deleted.'
  #   end
  # end

  private

  def set_qce
    @qce = QCE.find(params[:qce_id])
  end

end   # class User::QCEs::ClienteleInstrumentsController
