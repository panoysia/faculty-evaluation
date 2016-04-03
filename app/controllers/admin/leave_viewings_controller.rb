class Admin::LeaveViewingsController < Admin::ApplicationController
  
  def index
    # render html: params.inspect
    
    if params[:by] == 'r'  # records
      @leaves = Leave.includes(:employee).order(filed_at: :desc)
    elsif params[:by] =='c'   # credits
      # @credits = 
    end

    # if params[:q].present?
      # query = "last_name like ?"
      # value = "%#{params[:q]}%"
      # @searched_leaves = Leave.where(query, value)
    # else
    #   @searched_employees = Employee.includes(:rank).all
    # end

  end

end