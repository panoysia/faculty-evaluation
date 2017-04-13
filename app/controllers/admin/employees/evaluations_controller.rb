class Admin::Employees::EvaluationsController < Admin::ApplicationController

  before_action :set_employee, only: [:index, :new, :show]
  before_action :modify_view_path

  layout "employee_profile"


  def index
    @evaluations = @employee.evaluations
  end

  def new
    new_evaluation
    # @evaluation = Employee::EvaluationNewPresenter.
    #                 new(build_employee_evaluation)
  end

  def show
    @evaluation = Employee::EvaluationPresenter.new(evaluation)
    @cce_record = @evaluation.cce_record
  end

  def create
    service = Employee::EvaluationApprovalService.
                new(new_evaluation)

    if service.perform
      redirect_to admin_employee_evaluations_path,
                  notice: "Evaluation was successfully recorded"
    else
      render :new
    end

  end


  private


  def set_employee
    @employee = Employee.find(params[:employee_id])
  end

  def evaluation
    @employee.evaluations.find(params[:id])
  end

  def modify_view_path
    prepend_view_path "app/views/admin/employees/evaluations"
  end

  def nbc_id
    session[:nbc_id]
  end

  def build_employee_evaluation
    @employee.evaluations.new(nbc_id: nbc_id)
  end

  def new_evaluation
    @evaluation = Employee::EvaluationNewPresenter.
                    new(build_employee_evaluation)    
  end
  
end
