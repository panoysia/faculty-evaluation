class Admin::CareerPathsController < Admin::ApplicationController
  before_action :set_career_path, only: [:show, :edit, :update, :destroy]


  def index
    @career_paths = CareerPath.order(name: :asc)
  end

  def show
    @specializations = @career_path.specializations
    @actions = @career_path.actions.reorder(category: :asc, start_at: :desc, end_at: :desc)
  end

  def edit
  end

  def new
    @career_path = CareerPath.new
  end

  def create
    @career_path = CareerPath.new(career_path_params)

    respond_to do |format|
      if @career_path.save
        format.html { redirect_to [:admin, @career_path], notice: 'Career Path was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @career_path.update(career_path_params)
        format.html { redirect_to [:admin, @career_path], notice: 'Career path was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @career_path.destroy
    respond_to do |format|
      format.html { redirect_to admin_career_paths_path, notice: 'Career Path successfully deleted.' }
    end
  end


  private

  def set_career_path
    @career_path = CareerPath.find(params[:id])
  end

  def career_path_params
    params.require(:career_path).permit(:name)
  end

end
