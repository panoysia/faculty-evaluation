module ApplicationHelper
  
  def error_messages_for(object)
    render partial: 'shared/error_messages', locals: { object: object }
  end

  # "bs" is short for Bootstrap
  def get_bs_active_class(*tab_names)
    tab_names.include?(controller_name.to_sym) ? "active" : ""
  end

  # For formatting dates for display. 
  #
  # Gives me a good reason for monkey-patching Ruby's Date class.
  
  def date_format_readable(date)
    #date.strftime '%Y-%b-%d'
    date.strftime '%b %d %Y' if date.present?
  end

  def convert_gender_value(value)
    value == 'M' ? 'Male' : 'Female'
  end

  def format_in_decimal(number)
    number_with_precision(number, precision: 2)
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