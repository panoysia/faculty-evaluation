class User::QCEs::ComputationSummaryRatingsController < User::ApplicationController

  def show
    @qce = current_user.account.qces.find(params[:qce_id])
  end
end
