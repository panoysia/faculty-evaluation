class User::SessionsController < User::ApplicationController
  # Exempt our controller from this specific method of its parent class.
  skip_before_action :authorize_user

  before_action only: :new do
    redirect_to(dashboard_path, notice: 'You are already logged in.') if user_signed_in?
  end

  def new
  end

  def create
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to dashboard_path, notice: 'You are now logged in.'
      # user = User.authenticate(params[:email], params[:password])
      # if user
      #   # ...
      # end
    else
      flash.now.alert = 'Invalid username or password.'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    # reset_session
    redirect_to root_path, notice: 'You have been logged out.'
  end

end