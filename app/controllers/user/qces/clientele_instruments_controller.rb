class User::QCEs::ClienteleInstrumentsController < User::ApplicationController

  EVALUATION_CONTEXT = 'Faculty Member'
  INSTRUMENT_CONTEXT = 'Clientele Satisfaction'

  before_action :set_qce

  
  def create    
    # render html: params.inspect and return true

    client_ids = params[:clients].uniq
    client_ids.delete ""
    # client_ids.delete current_user.account_id.to_s

    if client_ids.count < 3
      flash.now.alert = "Please complete all 3 unique client evaluators."
      @employees = Employee.where.not(id: current_user.account.id)
      # REPLACEMENT: @clients = Client.order(last_name: :asc, first_name: :asc)
      render 'user/qces/edit' and return true
    else
      # NOTE: An error might be raised here if one employee_id isn't found
      employees = Employee.includes(:rank).find client_ids
      # REPLACEMENT: clients = Client.find client_ids
      employees.each do |employee|

        if @qce.support_area == 'Research'
          rating = QCE::Research.new
        elsif @qce.support_area == 'Extension'
          rating = QCE::Extension.new
        elsif @qce.support_area == 'Production'
          rating = QCE::Production.new
        end
                
        rating.qce_id = @qce.id
        rating.type = @qce.support_area

        rating.evaluator = employee
        rating.evaluator_name = employee.full_name
        rating.evaluator_position = employee.rank.full_name    
        # REPLACEMENT: rating.evaluation_context = params[:evaluation_context]
        rating.evaluation_context = EVALUATION_CONTEXT
        rating.instrument = INSTRUMENT_CONTEXT
        rating.save
      end

      respond_to do |format|
        #@qce.update(has_assigned_peer_rating: 1)
        format.html { redirect_to edit_qce_path(@qce), notice: 'Clientele Satisfaction instrument for 3 client evaluators has been created.'}
      end      

    end   # if client_ids.count < 3

  end   # create

  def destroy
    # render html: params.inspect and return true
    
    if @qce.clientele_instruments.present?
      @qce.clientele_instruments.destroy_all
      redirect_to edit_qce_path(@qce), notice: 'Clientele Satisfaction instruments has been deleted.'
    end
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
    @qce = current_user.account.qces.find(params[:qce_id])
  end

end   # class User::QCEs::ClienteleInstrumentsController
