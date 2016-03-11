class Admin::AccountController < Admin::ApplicationController

  def edit
  end

  def update
    admin = @current_admin.authenticate(params[:current_password])
    if admin
      # Admin knows his current password, so allow him to update his account with the new data.
      if @current_admin.update(username: params[:username], 
                            password: params[:new_password])
        logout_current_admin
        redirect_to admin_login_path, notice: 'Admin account updated successfully. Please login again.'
      else
        # Display model's validation errors
        render :edit
      end
    else
      flash.now.alert = "Current password is invalid."
      render :edit
    end
       
  end
  

  private

  def admin_params
    params.require(:admin).permit(:username, :password, 
                                  :new_password, :current_password)
  end

end