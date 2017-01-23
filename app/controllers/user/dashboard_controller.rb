class User::DashboardController < User::ApplicationController
  
  MIN_COUNT = 5

  def show
    if @current_user.account.is_a? Employee 
      @leaves = current_user.account.leaves.latest(MIN_COUNT)
      @qces = current_user.account.
                qces.
                includes(rating_period: [:academic_year]).
                latest(MIN_COUNT)
    end

    @tasks = current_user.account.rating_tasks.
              includes(:employee,
                      rating: { qce: { rating_period: :academic_year }}).
              latest(MIN_COUNT)

    # @tasks = current_user.account.rating_tasks.
    #           includes(:employee, rating: [:qce]).pending.latest
  end

end
