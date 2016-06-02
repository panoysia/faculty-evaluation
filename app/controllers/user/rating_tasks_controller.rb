class User::RatingTasksController < User::ApplicationController


  def index
    @tasks = current_user.account.rating_tasks.includes(:employee, rating: [:qce]).order(created_at: :desc)
  end

end