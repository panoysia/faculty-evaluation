class User::CCERecord::ProfessionalReviewsController < User::ApplicationController

  before_action :set_employee
  before_action :set_review, only: [:edit, :update, :destroy]


  def new
    @review = employee.professional_reviews.new
  end

  def create
    @review = employee.professional_reviews.new(review_params)
    if @review.save
      redirect_to cce_record_path,
        notice: "Prof. review record was successfully created."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @review.update(review_params)
      redirect_to cce_record_path,
        notice: "Prof. review record was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @review.destroy
    redirect_to cce_record_path,
      notice: "Prof. review record was successfully deleted."
  end


  private


  def employee
    @employee = current_user.account
  end

  alias_method :set_employee, :employee


  def set_review
    @review = employee.professional_reviews.find(params[:id])
  end

  def review_params
    params.require(:professional_review).
      permit(:name, :review_type, :occurred_at)
  end

end
