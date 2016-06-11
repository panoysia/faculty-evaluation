class User::CareerPathsController < User::ApplicationController

  def show
    @specialization = current_user.account.specialization
    if @specialization.present? 
      @actions = @specialization.career_path_actions.
                  order(category: :asc, start_at: :desc, end_at: :desc)
    else
      render 'no_career_path' and return true
    end
  end
  
end
