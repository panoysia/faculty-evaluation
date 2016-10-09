class Admin::Employees::EvaluationsController < Admin::ApplicationController

  before_action :set_employee


  def index

  end

  def new
    @evaluation = Employee::EvaluationPresenter.new(evaluation_record)
  end

  def create
    # 
    # @evaluation = Employee::Evaluation.create(some_params)
    # redirect_to @evaluation, notice: "Evaluation successfully created."

    # user = User.where(email: params[:email]).first

    # if UserAuthenticator.new(user).authenticate(params[:password])
    #   self.current_user = user
    #   redirect_to dashboard_path
    # else
    #   flash[:alert] = "Login failed."
    #   render "new"
    # end
    

  end

  def show
    @evaluation = Employee::EvaluationPresenter.new(evaluation_record)
    @cce_record = @evaluation.cce_record
  end


  private

  def set_employee
    @employee = Employee.find(params[:employee_id])
  end

  def evaluation_record
    @employee.evaluations.find(params[:id])
  end

end

# evaluation = Employee::Evaluation.find_or_initialize_by(employee_id_and_nbc_id)