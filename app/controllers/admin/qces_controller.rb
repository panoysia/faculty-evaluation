class Admin::QCEsController < Admin::ApplicationController
  
  def index
    @ratings = QCERating.includes(:employee, rating_period: [:academic_year]).all
  end
  
  def show
  end

end