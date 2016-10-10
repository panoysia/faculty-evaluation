class Admin::Employees::ProfessionalReviewsController < Admin::ApplicationController

  include CCE::ExpertService

  before_action :set_employee
  before_action :set_review, only: [:edit, :update, :destroy]

  layout 'employee_profile'


  def new
    @review = @employee.professional_reviews.new
  end

  def create
    # render html: params.inspect and return true
    @review = @employee.professional_reviews.new(review_params)
    if @review.save
      redirect_to admin_employee_expert_services_path,
        notice: 'Prof. review record was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @review.update(review_params)
      redirect_to referrer,
        notice: 'Prof. review record was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @review.destroy
    redirect_to referrer,
      notice: 'Prof. review record was successfully deleted.'
  end


  private


  def review_params
    params.require(:professional_review).permit(:name, :review_type,
                                                :occurred_at)
  end

  def set_employee
    @employee = Employee.find(params[:employee_id])
  end

  def set_review
    @review = @employee.professional_reviews.find(params[:id])
  end

end