class User::CareerPathsController < User::ApplicationController

  def show

    # @career_path = current_user.account.career_path
    @specialization = current_user.account.specialization
    # @career_path = @specialization.career_path
    @actions = @specialization.career_path_actions.
                order(category: :asc, start_at: :desc, end_at: :desc)
  end
  
end
