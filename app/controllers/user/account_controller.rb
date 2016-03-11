class User::AccountController < User::ApplicationController

  def edit
  end

  def update
    user = @current_user.authenticate(params[:current_password])
    if user
      # User knows his current password, so allow him to update his account with the new data.
      if @current_user.update(username: params[:username], 
                            password: params[:new_password])
        logout_current_user
        redirect_to login_path, notice: 'User account updated successfully. Please login again.'
      else
        # Display model's validation errors
        render :edit
      end
    else
      flash.now.alert = "Current password is invalid."
      render :edit
    end
       
    # @current_user.username = params[:username]
    # @current_user.password = params[:new]
    #new_password = params[:user][:password]
    # if @user.update_account(user_params, new_password)
    # if @user.change_password(old_password, new_password)
  end
  

  private

  # def set_user
  #   # @current_user ||= User.find(session[:user_id]) if session[:user_id]
  #   @user = current_user
  # end

  def user_params
    params.require(:user).permit(:username, :password, :password_digest, 
      :new_password, :current_password)
  end

end