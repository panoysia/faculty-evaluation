class User::CCERecordsController < User::ApplicationController  
  
  before_action :modify_view_path


  def show
    @cce_record = ::Employee::CCERecord.new(current_user.account)
  end


  private


  def modify_view_path
    prepend_view_path "app/views/user/cce_records"
  end

end
