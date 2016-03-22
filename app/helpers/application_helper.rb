module ApplicationHelper

  def error_messages_for(object)
    render partial: 'shared/error_messages', locals: { object: object }
  end

  def set_active_tab(tab_name)
    tab_name.to_s == controller_name ? 'active' : ''
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