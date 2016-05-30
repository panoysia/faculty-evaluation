class User::QCEs::CommunityInstrumentsController < User::ApplicationController

  EVALUATION_CONTEXT = 'Faculty Member'
  INSTRUMENT_CONTEXT = 'Community Responsibility'

  before_action :set_qce

  
  def create    
    # render html: params.inspect and return true

    ids = params[:communities].uniq
    ids.delete ""
    ids.delete current_user.account_id.to_s

    if ids.count < 3
      flash.now.alert = "Please complete all 3 unique evaluators. You selected only #{ids.count} unique evaluator(s)."
      @employees = Employee.where.not(id: current_user.account.id) 
      render 'user/qces/edit' and return true
    else
      # NOTE: An error might be raised here if one employee_id isn't found
      employees = Employee.includes(:rank).find ids
      employees.each do |employee|
        rating = QCE::Rating.new
        rating.qce_id = @qce.id
        rating.type = @qce.support_area

        rating.evaluator = employee
        rating.evaluator_name = employee.full_name
        rating.evaluator_position = employee.rank.full_name    
        rating.evaluation_context = EVALUATION_CONTEXT
        rating.instrument = INSTRUMENT_CONTEXT
        rating.save
      end

      respond_to do |format|
        format.html { redirect_to edit_qce_path(@qce), notice: 'Community Responsibility instrument for 3 evaluators has been created.'}
      end      

    end   # if client_ids.count < 3

  end   # create

  def destroy
    # render html: params.inspect and return true

    if @qce.community_instruments.present?
      @qce.community_instruments.destroy_all
      redirect_to edit_qce_path(@qce), notice: 'Community Responsibility instruments has been deleted.'
    end
  end


  private

  def set_qce
    @qce = current_user.account.qces.find(params[:qce_id])
  end

end   # class User::QCEs::CommunityInstrumentsController
