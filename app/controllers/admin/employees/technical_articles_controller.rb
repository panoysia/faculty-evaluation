class Admin::Employees::TechnicalArticlesController < Admin::ApplicationController

  before_action :set_employee
  before_action :set_technical_article,
                only: [:show, :edit, :update, :destroy]

  layout 'employee_profile'


  def new
    @technical_article = @employee.technical_articles.new
  end

  def create
    render html: params.inspect and return true
    @technical_article = @employee.technical_articles.new(technical_article_params)
    if @technical_article.save
      redirect_to admin_employee_professional_developments_path(
                    anchor: 'technical-articles'),
      notice: 'Technical article was successfully created.'
    else
      render :new
    end    
  end

  def show
  end

  def destroy
    @technical_article.destroy
    redirect_to admin_employee_professional_developments_path(
                  @employee,
                  anchor: 'technical-articles'),
    notice: 'Technical article was successfully deleted.'     
    
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