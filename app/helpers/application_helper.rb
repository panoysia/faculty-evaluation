module ApplicationHelper

  def error_messages_for(object)
    render partial: 'shared/error_messages', locals: { object: object }
  end

  # def authenticate_user
  # end

  # def authenticate_admin
  # end
  
  # def admin_signed_in?    
  # end

  # def user_signed_in?
  # end

end