class User::QCEs::PeerInstructionRatingsController < User::ApplicationController
  
  EVALUATION_CONTEXT = 'Peer'  
  before_action :set_qce

  # def created
  #   render html: current_user.inspect
  #   render html: params.inspect
  # end

  def create
    
    if params[:employee_ids].blank?
      flash.now.alert = "No peers selected. Please select 5 unique peers."
      @employees = Employee.where.not(id: current_user.account.id)
      render 'user/qces/edit' and return true
    end

    # Remove empty string and its duplicates, plus the employee_id of the currently logged-in employee/faculty. Also, take note that all elements inside the array are strings.
    employee_ids = params[:employee_ids].uniq
    employee_ids.delete ""
    employee_ids.delete current_user.account_id.to_s

    if employee_ids.count < 5
      flash.now.alert = "Please complete all five unique peers."
      @employees = Employee.where.not(id: current_user.account.id) 
      render 'user/qces/edit' and return true
    else
      peer_ratings = []
      # NOTE: An error might be raised here if one employee_id isn't found
      employees = Employee.includes(:rank).find employee_ids

      employees.each do |employee|
        rating = QCE::Instruction.new
        rating.qce_id = @qce.id

        rating.evaluator = employee
        rating.evaluator_name = employee.full_name
        rating.evaluator_position = employee.rank.full_name    
        rating.evaluation_context = EVALUATION_CONTEXT

        rating.save
        # peer_ratings << rating
      end   # employees.each

      respond_to do |format|
        @qce.update(has_assigned_peer_rating: 1)
        format.html { redirect_to edit_qce_path(@qce), notice: 'Instruction ratings for 5 peers have been created.'}
      end
      # @ids = params[:employee_ids]
      # @data = peer_ratings
    end   # employee_ids.count < 5
  end   # def create

  def destroy
    if @qce.peer_instruction_ratings.present?
      @qce.peer_instruction_ratings.destroy_all
      @qce.update(has_assigned_peer_rating: 0)
      
      redirect_to edit_qce_path(@qce), notice: 'Instruction ratings for peers have been deleted.'
    end
  end


  private

  def set_qce
    @qce = current_user.account.qces.find(params[:qce_id])
  end

end   # class User::QCEs::PeerInstructionRatingsController