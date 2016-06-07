class User::DashboardController < User::ApplicationController
  
  def show
    # @opened_rating_periods = RatingPeriod.open
    @leaves = current_user.account.leaves.latest(5)
    @qces = current_user.account.qces.latest(5)
    @tasks = current_user.account.rating_tasks.
              includes(:employee, rating: [:qce]).latest

    # @tasks = current_user.account.rating_tasks.
    #           includes(:employee, rating: [:qce]).pending.latest

    # @tasks = current_user.account.rating_tasks.includes(:employee, rating: [:qce]).order(created_at: :desc)
  end

end