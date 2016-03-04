class Admin::SessionsController < Admin::ApplicationController
  # Exempt our controller from this specific method of its parent class.  
  skip_before_action :authorize_admin  
  
  before_action only: :new do
    redirect_to(admin_dashboard_path, notice: 'You are already logged in.') if admin_signed_in?
  end


  def new
  end

  def create
    admin = Admin.find_by(username: params[:username])

    if admin && admin.authenticate(params[:password])
      session[:admin_id] = admin.id
      redirect_to admin_dashboard_path, notice: 'You are now logged in.'
    else
      flash.now.alert = 'Invalid username or password.'
      render :new
    end
  end

  def destroy
    session[:admin_id] = nil
    redirect_to admin_root_path, notice: 'You have been logged out.'
  end
end