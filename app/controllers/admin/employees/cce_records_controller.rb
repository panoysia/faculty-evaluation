class Admin::Employees::CCERecordsController < Admin::ApplicationController

  before_action :set_employee
  before_action :modify_view_path

  layout 'employee_profile'


  def show
    @cce_record = ::Employee::CCERecord.new(@employee)
  end


  private

  def set_employee
    @employee = Employee.find(params[:employee_id])
  end

  def modify_view_path
    prepend_view_path "app/views/admin/employees/cce_records"
  end

end
