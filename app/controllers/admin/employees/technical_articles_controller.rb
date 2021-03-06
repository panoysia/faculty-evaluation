class Admin::Employees::TechnicalArticlesController < Admin::ApplicationController

  include CCE::AchievementAndHonor1

  before_action :set_employee
  before_action :set_technical_article, only: [:edit, :update, :destroy]
  
  layout 'employee_profile'


  def new
    @technical_article = @employee.technical_articles.new
  end

  def create
    # render html: params.inspect and return true
    @technical_article = @employee.technical_articles.new(technical_article_params)
    if @technical_article.save
      redirect_to admin_employee_achievement_and_honors_1_path,
        notice: 'Technical article record was successfully created.'
    else
      render :new
    end    
  end

  def edit
  end

  def update
    if @technical_article.update(technical_article_params)
      redirect_to referrer,
        notice: 'Technical article record was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @technical_article.destroy
    redirect_to referrer,
      notice: 'Technical article record was successfully deleted.'
  end


  private

  def set_employee
    @employee = Employee.find(params[:employee_id])
  end

  def set_technical_article
    @technical_article = @employee.technical_articles.find(params[:id])
  end

  def technical_article_params
    params.require(:technical_article).permit(:name, :level,
      :published_at, :description)
  end

end