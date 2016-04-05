class User::LeavesController < User::ApplicationController

  before_action :set_employee

  def index
    @leaves = @employee.leaves.order(filed_at: :desc)
  end

  def show
  end


  private

  def set_employee
    @employee = @current_user.account
  end

  # def set_leave
  #   @leave = @employee.leaves.find(params[:id]) 
  # end
  
end