class Employee::EvaluationApprovalService

  def initialize(evaluation)
    @evaluation = evaluation
  end

  # perform/call
  def perform
    true

=begin
    Employee.class.transaction do
      # SQL ACTION: INSERT/CREATE the new evaluation record
      evaluation = Employee::Evaluation.new
      evaluation.rank_before = @evaluation.rank_before
      evaluation.rank_after = @evaluation.rank_after
      evaluation.qce_score = @evaluation.qce_score
      evaluation.cce_score = @evaluation.cce_score
    end
=end

=begin


    evaluation.save

    # SQL ACTION: UPDATE rank of employee with the achieved rank
    # SQL ACTION: UPDATE nbc_id column of all cce_scoring records
=end
  end   # perform

end   # class Employee::EvaluationApprovalService

=begin

def create  
  redirect_to admin_employee_evaluations(@employee)  
end


class UsersController < ApplicationController
  def suspend
    @user = User.find(params[:id])
    suspension = UserSuspension.new(@user)
    suspension.create!
    redirect_to @user, notice: 'Successfully suspended.'
  end
end
=end