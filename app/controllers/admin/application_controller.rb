class Admin::ApplicationController < ActionController::Base
  AUTHORIZATION_MSG = 'In order to continue, you are required to login first.'

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authorize_admin
  helper_method :current_admin, :admin_signed_in?


  private

  def current_admin
    @current_admin ||= Admin.find(session[:admin_id]) if session[:admin_id]
  end

  def authorize_admin
    redirect_to admin_login_path, alert: AUTHORIZATION_MSG if current_admin.nil?
  end

  def admin_signed_in?
    !!current_admin
  end    

  def logout_current_admin
    session[:admin_id] = nil
  end
end