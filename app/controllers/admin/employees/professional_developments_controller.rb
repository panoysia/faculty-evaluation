class Admin::Employees::ProfessionalDevelopmentsController < Admin::ApplicationController
  
  before_action :set_employee
  # before_action :set_training, only: [:show, :edit, :update, :destroy]
  
  layout 'employee_profile'

  def index
    @records = %w(mon tue wed thu fri)
  end


  private

  def set_employee
    @employee = Employee.find(params[:employee_id])
  end
  
end
