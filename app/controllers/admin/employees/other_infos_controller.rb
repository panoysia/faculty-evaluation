class Admin::Employees::OtherInfosController < Admin::ApplicationController

  before_action :set_employee #, only: [:edit, :show, :update, :destroy]
  

  def index
    @other_infos = @employee.other_infos
    #@other_info = @other_infos.new
    render layout: 'employee_profile'
  end

  def new
    @other_info = @employee.other_infos.new
  end

  def show
  end

  def create
  end

  def destroy
  end

  private

  def set_employee
    @employee = Employee.find(params[:employee_id])
  end
end