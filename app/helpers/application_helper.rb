module ApplicationHelper
  
  def error_messages_for(object)
    render partial: 'shared/error_messages', locals: { object: object }
  end

  def set_active_tab(tab_name)
    tab_name.to_s == controller_name ? 'active' : ''
  end

  # For formatting dates for display. 
  #
  # Gives me a good reason for monkey-patching Ruby's Date class.
  
  def date_format_readable(date)
    #date.strftime '%Y-%b-%d'
    date.strftime '%b %d %Y'
  end

  def convert_gender_value(value)
    value == 'M' ? 'Male' : 'Female'
  end

  def format_in_decimal
    
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