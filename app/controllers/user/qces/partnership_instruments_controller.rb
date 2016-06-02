class User::QCEs::PartnershipInstrumentsController < User::ApplicationController

  EVALUATION_CONTEXT = 'Faculty Member'
  INSTRUMENT_CONTEXT = 'Partnership Development'

  before_action :set_qce

  
  def create    
    # render html: params.inspect and return true

    partner_ids = params[:partners].uniq
    partner_ids.delete ""
    partner_ids.delete current_user.account_id.to_s

    if partner_ids.count < 3
      flash.now.alert = "Please complete all 3 unique evaluators."
      @employees = Employee.where.not(id: current_user.account.id)
      render 'user/qces/edit' and return true
    else
      # NOTE: An error might be raised here if one employee_id isn't found
      employees = Employee.includes(:rank).find partner_ids
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
        rating.evaluation_context = EVALUATION_CONTEXT
        rating.instrument = INSTRUMENT_CONTEXT
        rating.save
      end

      respond_to do |format|
        format.html { redirect_to edit_qce_path(@qce), notice: 'Partnership Development instrument for 3 evaluators has been created.'}
      end      

    end   # if client_ids.count < 3

  end   # create

  def destroy
    # render html: params.inspect and return true
    
    if @qce.partnership_instruments.present?
      @qce.partnership_instruments.destroy_all
      redirect_to edit_qce_path(@qce), notice: 'Partnership Development instruments has been deleted.'
    end
  end


  private

  def set_qce
    @qce = current_user.account.qces.find(params[:qce_id])
  end

end   # class User::QCEs::PartnershipInstrumentsController
