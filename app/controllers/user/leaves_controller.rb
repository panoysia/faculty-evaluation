class User::LeavesController < User::ApplicationController

  before_action :set_employee

  def index
    @leaves = @employee.leaves.
                        includes(:academic_year).
                        order(filed_at: :desc)

    @credits = @employee.leave_service_credits.
                          includes(:academic_year).
                          order(expire_at: :desc)

    query = Employee::LeaveSummaryPerAcademicYearQuery.new(@employee)
    @leave_summary = query.result || []
  end


  private


  def set_employee
    @employee = @current_user.account
  end
  
end