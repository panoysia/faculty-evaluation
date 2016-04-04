class User::ApplicationController < ActionController::Base
  AUTHORIZATION_MSG = 'In order to continue, you are required to login first.'

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :authorize_user
  helper_method :current_user, :user_signed_in?


  private

  def current_user
    begin
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue
      session[:user_id] = nil
      #redirect_to(login_path) and return true
    end
  end

  def authorize_user
    redirect_to login_path, alert: AUTHORIZATION_MSG if current_user.nil?
  end

  def user_signed_in?
    !!current_user
  end

  def logout_current_user
    session[:user_id] = nil
    # reset_session
  end

end