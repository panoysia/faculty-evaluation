class User::QCEs::LeadershipInstrumentsController < User::ApplicationController

  EVALUATION_CONTEXT = 'Faculty Member'
  INSTRUMENT_CONTEXT = 'Leadership'

  before_action :set_qce

  
  def create    
    # render html: params.inspect and return true

    if params[:leader].present?
      id = params[:leader]
      evaluator = Employee.find params[:leader]
      
      # NOTE: An error might be raised here if one employee_id isn't found
      employees = Employee.includes(:rank).find id

        if @qce.support_area == 'Research'
          rating = QCE::Research.new
        elsif @qce.support_area == 'Extension'
          rating = QCE::Extension.new
        elsif @qce.support_area == 'Production'
          rating = QCE::Production.new
        end
        
      rating.qce_id = @qce.id
      rating.type = @qce.support_area
      
      rating.evaluator = evaluator
      rating.evaluator_name = evaluator.full_name
      rating.evaluator_position = evaluator.rank.full_name    
      rating.evaluation_context = EVALUATION_CONTEXT
      rating.instrument = INSTRUMENT_CONTEXT
    else
      flash.now.alert = 'Please select your evaluator for the Leadership instrument.'
      @employees = Employee.where.not(id: current_user.account.id)
      render 'user/qces/edit' and return true
    end   # if params[:leader].present?
      
    respond_to do |format|
      if rating.save
        format.html { redirect_to edit_qce_path(@qce), notice: 'Leadership instrument has been created.'}
      end
    end

  end   # create

  def destroy
    # render html: params.inspect and return true

    if @qce.leadership_instrument.present?
      @qce.leadership_instrument.destroy
      redirect_to edit_qce_path(@qce), notice: 'Leadership instrument has been deleted.'
    end
  end


  private

  def set_qce
    @qce = current_user.account.qces.find(params[:qce_id])
  end

end   # class User::QCEs::LeadershipInstrumentsController
