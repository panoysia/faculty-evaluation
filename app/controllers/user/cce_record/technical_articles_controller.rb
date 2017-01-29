class User::CCERecord::TechnicalArticlesController < User::ApplicationController

  before_action :set_employee
  before_action :set_technical_article, only: [:edit, :update, :destroy]


  def new
    @technical_article = employee.technical_articles.new
  end

  def create
    @technical_article = employee.technical_articles.
                            new(technical_article_params)
    if @technical_article.save
      redirect_to cce_record_path,
        notice: "Technical article record was successfully created."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @technical_article.update(technical_article_params)
      redirect_to cce_record_path,
        notice: "Technical article record was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @technical_article.destroy
    redirect_to cce_record_path,
      notice: "Technical article record was successfully deleted."
  end


  private


  def employee
    @employee = current_user.account
  end

  alias_method :set_employee, :employee


  def set_technical_article
    @technical_article = employee.technical_articles.find(params[:id])
  end

  def technical_article_params
    params.require(:technical_article).
      permit(:name, :level, :published_at, :description)
  end

end
